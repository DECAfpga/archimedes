/* Configuration file should be placed in the core's firmware directory.
   Each core will have different requirements of the firmware, and by avoiding
   the parts not needed the ROM size can be kept to a minimum */

#include "keyboard.h"
#define KEY_OSD KEY_PRTSCRN

#ifndef CONFIG_H
#define CONFIG_H

/* PS/2 Mouse support */
#define PS2_MOUSE
#define PS2_MOUSE_WHEEL

#define PS2_WRITE

/* CDROM support - used by the TurboGrafx core */
#undef CONFIG_CD

/* Disk Image support - used for Save RAM on consoles as well as the
more obvious application of disk images on computer cores.  If not defined
here, the number of units defaults to 4. */
#define CONFIG_DISKIMG
#define CONFIG_DISKIMG_UNITS 2

#define CONFIG_IDE
#define CONFIG_IDE_UNITS 2

/* Speed up file operations by "bookmarking" the file.
   (Undef to disable, or set to the number of desired bookmarks - a reasonable
   range would be between 4 and 16 */
#define CONFIG_FILEBOOKMARKS 6

/* Keyboard-based Joystick emulation */
#undef CONFIG_JOYKEYS

/* Send key events via the mist_io block. If the core can support
   a PS/2 keyboard directly then that's probably a better option. */
#undef CONFIG_SENDKEYS

/* Send joystick events using the "new" extended joystick protocol.
   This could support more buttons (if DeMiSTify itself supported them,
   which it currently doesn't) - but some cores still use the older protocol. */
#define CONFIG_EXTJOYSTICK

#define CONFIG_AUTOSCANDOUBLER

#endif

