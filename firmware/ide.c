/*
Copyright 2008, 2009 Jakub Bednarski

This file is part of Minimig

Minimig is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Minimig is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// 2009-11-22 - read/write multiple implemented

// 2020-11-14 - AMR: Simplified and combined read / readm + write / writem.  AROS IDE now works.


#define hdd_debugf printf

#define CMD_IDECMD  0x04
#define CMD_IDEDAT  0x08

#define CMD_IDE_REGS_RD   0x80
#define CMD_IDE_REGS_WR   0x90
#define CMD_IDE_DATA_WR   0xA0
#define CMD_IDE_DATA_RD   0xB0
#define CMD_IDE_CDDA_RD   0xC0 // status bit read, since no free CMD_xxx :(
#define CMD_IDE_CDDA_WR   0xD0
#define CMD_IDE_STATUS_RD 0x00
#define CMD_IDE_STATUS_WR 0xF0

#define CMD_IDE_CFG_WR    0xFA

#define IDE_STATUS_END  0x80
#define IDE_STATUS_PKT  0x20
#define IDE_STATUS_IRQ  0x10
#define IDE_STATUS_RDY  0x08
#define IDE_STATUS_REQ  0x04
#define IDE_STATUS_ERR  0x01

#define TFR_ERR    1
#define TFR_SCOUNT 2
#define TFR_SNUM   3
#define TFR_CYLL   4
#define TFR_CYLH   5
#define TFR_SDH    6
#define TFR_STAT   7

#define ACMD_NOP                          0x00
#define ACMD_DEVICE_RESET                 0x08
#define ACMD_RECALIBRATE                  0x10
#define ACMD_DIAGNOSTIC                   0x90
#define ACMD_IDENTIFY_DEVICE              0xEC
#define ACMD_INITIALIZE_DEVICE_PARAMETERS 0x91
#define ACMD_READ_SECTORS                 0x20
#define ACMD_WRITE_SECTORS                0x30
#define ACMD_READ_MULTIPLE                0xC4
#define ACMD_WRITE_MULTIPLE               0xC5
#define ACMD_SET_MULTIPLE_MODE            0xC6
#define ACMD_PACKET                       0xA0
#define ACMD_IDENTIFY_PACKET_DEVICE       0xA1

#define DISKLED_ON
#define DISKLED_OFF

typedef struct
{
	fileTYPE	file;
	int  cylinders;
	int  heads;
	int  sectors;
	int  sectors_per_block;
	int  partition; // partition no.
} hdfTYPE;

hdfTYPE hdf[CONFIG_IDE_UNITS];


void WriteStatus(int status)
{
	EnableFpga();
	SPI(CMD_IDE_STATUS_WR);
	SPI(status);
	SPI(0);
	SPI(0);
	SPI(0);
	SPI(0);
	DisableFpga();
}

int GetFPGAStatus()
{
	int result;

	EnableFpga();
	result = SPI(0);
	SPI(0);
	SPI(0);
	SPI(0);
	SPI(0);
	SPI(0);
	DisableFpga();

	return result;
}


static void SwapBytes(char *c, unsigned int len)
{
  char temp;

  while(len) {
    temp = *c;
    *c=c[1];
    c[1]=temp;
    len-=2;
    c+=2;
  }
}


// IdentifiyDevice()
// builds Identify Device struct
static void IdentifyDevice(unsigned short *pBuffer, unsigned char unit)
{
	char *p, i, x;
	unsigned long total_sectors = hdf[unit].cylinders * hdf[unit].heads * hdf[unit].sectors;
//	printf("ID: sectors %d\n",total_sectors);
	memset(pBuffer, 0, 512);

	pBuffer[0] = 1 << 6; // hard disk
	pBuffer[1] = hdf[unit].cylinders; // cyl count
	pBuffer[3] = hdf[unit].heads; // head count
	pBuffer[6] = hdf[unit].sectors; // sectors per track
	// FIXME - can get serial no from card itself.
	memcpy((char*)&pBuffer[10], "iMTSiMiniMHgrafdli e", 20); // serial number - byte swapped
	memcpy((char*)&pBuffer[23], ".100    ", 8); // firmware version - byte swapped
	p = (char*)&pBuffer[27];
	// FIXME - likewise the model name can be fetched from the card.
	memcpy(p, "YAQUBE                                  ", 40); // model name - byte swapped
	p += 8;
//	for (i = 0; (x = hardfile[unit]->name[i]) && i < 16; i++) // copy file name as model name
//		p[i] = x;
	SwapBytes((char*)&pBuffer[27], 40);

	pBuffer[47] = 0x8010; // maximum sectors per block in Read/Write Multiple command
	pBuffer[49] = 0x0200; // support LBA addressing
	pBuffer[53] = 1;
	pBuffer[54] = hdf[unit].cylinders;
	pBuffer[55] = hdf[unit].heads;
	pBuffer[56] = hdf[unit].sectors;
	pBuffer[57] = (unsigned short)total_sectors;
	pBuffer[58] = (unsigned short)(total_sectors >> 16);
	pBuffer[60] = (unsigned short)total_sectors;
	pBuffer[61] = (unsigned short)(total_sectors >> 16);
//	printf("CHS %d %d %d\n",hdf[unit].cylinders,hdf[unit].heads,hdf[unit].sectors);
}

// chs2lba()
static unsigned long chs2lba(int cylinder, int head, int sector, int unit, char lbamode)
{
  if (lbamode){
    return ((head<<24) + (cylinder<<8) + sector);
  }else
    return (cylinder * hdf[unit].heads + head) * hdf[unit].sectors + sector - 1;
}


// WriteTaskFile()
static void WriteTaskFile(int error, int sector_count, int sector_number, int cylinder_low, int cylinder_high, int drive_head)
{
	EnableFpga();

	SPI(CMD_IDE_REGS_WR); // write task file registers command
	SPI(0x00);
	SPI(0x00); // dummy
	SPI(0x00);
	SPI(0x00); // dummy
	SPI(0x00);

	SPI(0x00); // dummy

	SPI(0x00);
	SPI(0x00);
	SPI(error);         // error
	SPI(0x00);
	SPI(sector_count);  // sector count
	SPI(0x00);
	SPI(sector_number); // sector number
	SPI(0x00);
	SPI(cylinder_low);  // cylinder low
	SPI(0x00);
	SPI(cylinder_high); // cylinder high
	SPI(0x00);
	SPI(drive_head);    // drive/head

	DisableFpga();
}


// ATA_Recalibrate()
static inline void ATA_Recalibrate(unsigned char* tfr, int unit)
{
  // Recalibrate 0x10-0x1F (class 3 command: no data)
//  hdd_debugf("IDE%d: Recalibrate", unit);
	WriteTaskFile(0, 0, 1, 0, 0, tfr[6] & 0xF0);
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}


// ATA_Diagnostic()
static inline void ATA_Diagnostic(unsigned char* tfr)
{
  // Execute Drive Diagnostic (0x90)
//  hdd_debugf("IDE: Drive Diagnostic");
	WriteTaskFile(1, 0, 0, 0, 0, 0);
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}

static void sendsector(unsigned char *buf)
{
	int i;
	EnableFpga();
	SPI(CMD_IDE_DATA_WR); // write data command
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	spi_write(buf,512);
	DisableFpga();
}

// ATA_IdentifyDevice()
static void ATA_IdentifyDevice(unsigned char* tfr, int unit, char packet)
{
	int i;
	unsigned short *id = (unsigned short *)sector_buffer;
	// Identify Device (0xec)
	//  hdd_debugf("IDE%d: Identify %s Device", unit, packet ? "Packet" : "");
	tfr[TFR_SCOUNT] = 0x01;
	tfr[TFR_SNUM]   = 0x01;
	tfr[TFR_ERR]  = 0x00;
	tfr[TFR_CYLL] = 0x00;
	tfr[TFR_CYLH] = 0x00;
	tfr[TFR_SDH]  = 0x00;
	IdentifyDevice(id, unit);

	WriteTaskFile(0, tfr[2], tfr[3], tfr[4], tfr[5], tfr[6]);
	WriteStatus(IDE_STATUS_RDY); // pio in (class 1) command type
	sendsector(sector_buffer);
#if 0
	EnableFpga();
	
	SPI(CMD_IDE_DATA_WR); // write data command
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	SPI(0x00);
	for (i = 0; i < 256; i++) {
		SPI((unsigned char)id[i]);
		SPI((unsigned char)(id[i] >> 8));
	}
	DisableFpga();
#endif
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}


// ATA_Initialize()
static inline void ATA_Initialize(unsigned char* tfr, int unit)
{
	// Initialize Device Parameters (0x91)
//	hdd_debugf("Initialize Device Parameters");
//	hdd_debugf("IDE%d: %02X.%02X.%02X.%02X.%02X.%02X.%02X.%02X", unit, tfr[0], tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6], tfr[7]);
	WriteTaskFile(0, tfr[2], tfr[3], tfr[4], tfr[5], tfr[6]);
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}


// ATA_SetMultipleMode()
static inline void ATA_SetMultipleMode(unsigned char* tfr, int unit)
{
	// Set Multiple Mode (0xc6)
//	hdd_debugf("Set Multiple Mode");
//	hdd_debugf("IDE%d: %02X.%02X.%02X.%02X.%02X.%02X.%02X.%02X", unit, tfr[0], tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6], tfr[7]);
	hdf[unit].sectors_per_block = tfr[2];
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}

static inline void ATA_NOP(unsigned char *tfr, int unit)
{
	WriteTaskFile(tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6]);
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}

static inline void ATA_DeviceReset(unsigned char *tfr, int unit)
{
//	hdd_debugf("Device Reset");
//	hdd_debugf("IDE%d: %02X.%02X.%02X.%02X.%02X.%02X.%02X.%02X", unit, tfr[0], tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6], tfr[7]);
	tfr[TFR_SCOUNT] = 0x01;
	tfr[TFR_SNUM]   = 0x01;
	tfr[TFR_ERR]    = 0x00;
	//tfr[TFR_SDH]    = 0x00;
	tfr[TFR_CYLL] = 0x00;
	tfr[TFR_CYLH] = 0x00;
	WriteTaskFile(tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6]);
	WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
}

void Menu_UpdateInput();

// ATA_ReadSectors()
static inline void ATA_ReadSectors(unsigned char* tfr, int sector, int cylinder, int head, int unit, int sector_count, int multiple, char lbamode)
{
	// Read Sectors (0x20)
	long lba;
	int i;
	int block_count;

//	printf("LBAMode: %d\n",lbamode);

	lba=chs2lba(cylinder, head, sector, unit, lbamode);
	//  hdd_debugf("IDE%d: read %s, %d.%d.%d:%d, %d", unit, (lbamode ? "LBA" : "CHS"), cylinder, head, sector, lba, sector_count);
//	printf("Rd %d, %d, %d, %d, %d, %d\n",cylinder,head,sector,unit,lbamode,sector_count);

#if 0
	do {
		Menu_UpdateInput();
	} while (!(TestKey(KEY_TAB)&2));
#endif
	while (sector_count)
	{
		block_count = multiple ? sector_count : 1;
		if (multiple && block_count > hdf[unit].sectors_per_block)
			block_count = hdf[unit].sectors_per_block;

		WriteStatus(IDE_STATUS_RDY); // pio in (class 1) command type
		while (!(GetFPGAStatus() & CMD_IDECMD))
			; // wait for empty sector buffer

		/* Advance CHS address while DRQ is not asserted with the address of last (anticipated) read. */
		int block_count_tmp = block_count;
		while(block_count_tmp--)
		{
			if (sector_count!=1)
			{
				if (sector == hdf[unit].sectors)
				{
					sector = 1;
					head++;
					if (head == hdf[unit].heads)
					{
						head = 0;
						cylinder++;
					}
				}
				else
					sector++;
			}
			--sector_count;
		}
		if (lbamode) {
			long newlba = lba+block_count;
			sector = newlba & 0xff;
			cylinder = newlba >> 8;
			head = newlba >> 24;
		}

		/* Update task file with CHS address */
		WriteTaskFile(0, tfr[2], sector, cylinder, (cylinder >> 8), (tfr[6] & 0xF0) | head);

		// Indicate the start of the transfer
		WriteStatus(IDE_STATUS_IRQ);

		if(hdf[unit].file.size)
		{
			int blk=block_count;
			while(blk--) // Any blocks left?
			{
				FileSeek(&hdf[unit].file,lba<<9);
				FileReadSector(&hdf[unit].file,0); // NULL enables direct transfer to the FPGA
#if 0
				FileReadSector(&hdf[unit].file,sector_buffer); // NULL enables direct transfer to the FPGA#
				sendsector(sector_buffer);
#endif
				FileNextSector(&hdf[unit].file,1);
				lba++;
			}
		}
		else
			WriteStatus(IDE_STATUS_RDY|IDE_STATUS_ERR);

	}
	WriteStatus(IDE_STATUS_END);
}


// ATA_WriteSectors()
static inline void ATA_WriteSectors(unsigned char* tfr, int sector, int cylinder, int head, int unit, int sector_count, char multiple, char lbamode)
{
	int i;
	int block_count, block_size, sectors;
	long lba=chs2lba(cylinder, head, sector, unit, lbamode);
	int bw;

	// write sectors
	WriteStatus(IDE_STATUS_REQ); // pio out (class 2) command type
	//  hdd_debugf("IDE%d: write %s, %d.%d.%d:%d, %d", unit, (lbamode ? "LBA" : "CHS"), cylinder, head, sector, lba, sector_count);

	FileSeek(&hdf[unit].file,lba<<9);

	while (sector_count) {
		block_count = multiple ? sector_count : 1;
		if (multiple && block_count > hdf[unit].sectors_per_block)
			block_count = hdf[unit].sectors_per_block;

		while(block_count)
		{
			while (!(GetFPGAStatus() & CMD_IDEDAT)); // wait for full write buffer
			EnableFpga();
			SPI(CMD_IDE_DATA_RD); // read data command
			SPI(0x00);
			SPI(0x00);
			SPI(0x00);
			SPI(0x00);
			SPI(0x00);
			spi_read(sector_buffer,512);
//			spi_block_read(sector_buffer);
			DisableFpga();

			FileWriteSector(&hdf[unit].file,sector_buffer);
			FileNextSector(&hdf[unit].file,1);
//			f_write(&hdf[unit].idxfile->file, sector_buffer, 512*block_size, &bw);
			lba++;

			// decrease sector count
			if (sector_count!=1) {
				if (sector == hdf[unit].sectors) {
					sector = 1;
					head++;
					if (head == hdf[unit].heads) {
						head = 0;
						cylinder++;
					}
				} else {
					sector++;
				}
			}
			sector_count--; // decrease sector count

			block_count--;
		}

//		if (hdf[unit].type & HDF_FILE)
//			f_sync(&hdf[unit].idxfile->file);

		if (lbamode) {
			sector = lba & 0xff;
			cylinder = lba >> 8;
			head = lba >> 24;
		}

		WriteTaskFile(0, tfr[2], sector, cylinder, (cylinder >> 8), (tfr[6] & 0xF0) | head);

		if (sector_count)
			WriteStatus(IDE_STATUS_IRQ);
		else
			WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ);
	}
}


// HandleHDD()
void HandleHDD()
{
	unsigned char  tfr[8];
	int i;
	int sector;
	int cylinder;
	int head;
	int unit;
	int sector_count;
	int lbamode;
	int cs1 = 0;

	int c1=GetFPGAStatus();

	if (c1 & CMD_IDECMD) {
		DISKLED_ON;
		EnableFpga();
		SPI(CMD_IDE_REGS_RD); // read task file registers
		SPI(0x00);
		SPI(0x00);
		SPI(0x00);
		SPI(0x00);
		SPI(0x00);

		for (i = 0; i < 8; i++) {
			tfr[i] = SPI(0);
//			if (i == 6 && cs1ena) cs1 = tfr[i] & 0x01;
			tfr[i] = SPI(0);
		}

		DisableFpga();
		unit = (cs1 << 1) | ((tfr[6] & 0x10) >> 4); // primary/secondary/master/slave selection
//		if (0) hdd_debugf("IDE%d: %02X.%02X.%02X.%02X.%02X.%02X.%02X.%02X", unit, tfr[0], tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6], tfr[7]);

		if (!hdf[unit].file.size) {
//			hdd_debugf("IDE%d: not present", unit);
			WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ | IDE_STATUS_ERR);
			DISKLED_OFF;
			return;
		}

		sector = tfr[3];
		cylinder = tfr[4] | (tfr[5] << 8);
		head = tfr[6] & 0x0F;
		lbamode = tfr[6] & 0x40;
		sector_count = tfr[2];
		if (sector_count == 0) sector_count = 0x100;

		if ((tfr[7] & 0xF0) == ACMD_RECALIBRATE) {
			ATA_Recalibrate(tfr,  unit);
		} else if (tfr[7] == ACMD_DIAGNOSTIC) {
			ATA_Diagnostic(tfr);
		} else if (tfr[7] == ACMD_IDENTIFY_DEVICE) {
			ATA_IdentifyDevice(tfr, unit, 0);
		} else if (tfr[7] == ACMD_INITIALIZE_DEVICE_PARAMETERS) {
			ATA_Initialize(tfr, unit);
		} else if (tfr[7] == ACMD_SET_MULTIPLE_MODE) {
			ATA_SetMultipleMode(tfr, unit);
		} else if (tfr[7] == ACMD_READ_SECTORS) {
			ATA_ReadSectors(tfr, sector, cylinder, head, unit, sector_count, 0, lbamode);
		} else if (tfr[7] == ACMD_READ_MULTIPLE) {
			ATA_ReadSectors(tfr, sector, cylinder, head, unit, sector_count, 1, lbamode);
		} else if (tfr[7] == ACMD_WRITE_SECTORS) {
			ATA_WriteSectors(tfr, sector, cylinder, head, unit, sector_count ,0, lbamode);
		} else if (tfr[7] == ACMD_WRITE_MULTIPLE) {
			ATA_WriteSectors(tfr, sector, cylinder, head, unit, sector_count, 1, lbamode);
		} else if (tfr[7] == ACMD_DEVICE_RESET) {
			ATA_DeviceReset(tfr, unit);
		} else if (tfr[7] == ACMD_NOP) {
			ATA_NOP(tfr, unit);
		} else {
//			hdd_debugf("Unknown ATA command");
//			hdd_debugf("IDE%d: %02X.%02X.%02X.%02X.%02X.%02X.%02X.%02X", unit, tfr[0], tfr[1], tfr[2], tfr[3], tfr[4], tfr[5], tfr[6], tfr[7]);
			WriteTaskFile(0x04, tfr[2], tfr[3], tfr[4], tfr[5], tfr[6]);
			WriteStatus(IDE_STATUS_END | IDE_STATUS_IRQ | IDE_STATUS_ERR);
		}
		DISKLED_OFF;
	}
}


// GetHardfileGeometry()
// this function comes from WinUAE, should return the same CHS as WinUAE
void GetHardfileGeometry(hdfTYPE *pHDF)
{
	int total=0;
	int i, head, cyl, spt;
	int sptt[] = { 63, 127, 255, 0 };
	int cyllimit=65535;
	
//	printf("HDF size %d\n",pHDF->file.size);

	total=pHDF->file.size>>9;
	if (!total)
		return;

//	printf("HDF %d sectors\n",total);
	for (i = 0; sptt[i] != 0; i++) {
		spt = sptt[i];
		for (head = 4; head <= 16; head++) {
			cyl = total / (head * spt);
			if (total <= 1024 * 1024) {
				if (cyl <= 1023) break;
			} else {
				if (cyl < 16383)
					break;
				if (cyl < 32767 && head >= 5)
					break;
				if (cyl <= cyllimit)  // Should there some head constraint here?
					break;
			}
		}
		if (head <= 16) break;
	}
	pHDF->cylinders = cyl;
	pHDF->heads = head;
	pHDF->sectors = spt;
}


void SendHDFCfg()
{
	int i;
	int cfg = 0;
#ifdef CONFIG_IDE
	if(hdf[0].file.size)
		cfg|=1;
#if CONFIG_IDE_UNITS > 1
	if(hdf[1].file.size)
		cfg|=2;
#endif
#if CONFIG_IDE_UNITS > 2
	if(hdf[2].file.size)
		cfg|=4;
#endif
#if CONFIG_IDE_UNITS > 3
	if(hdf[2].file.size)
		cfg|=8;
#endif
	EnableFpga();
	SPI(CMD_IDE_CFG_WR);
	SPI(cfg);
	DisableFpga();
#endif
}


// OpenHardfile()
void OpenHardfile(const char *filename,int unit)
{
	if(FileOpen(&hdf[unit].file,filename))
	{
		GetHardfileGeometry(&hdf[unit]);
		SendHDFCfg();
	}
}


