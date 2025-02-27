	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_Menu_Draw
_Menu_Draw:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r4
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 67
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 40
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 68
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l14: # 

						//../DeMiSTify/firmware/menu.c, line 70
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 70
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 1
						// reg r4 - only match against tmp
	mt	r4
	cmp	r3

						//../DeMiSTify/firmware/menu.c, line 70
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l11
		add	r7

						//../DeMiSTify/firmware/menu.c, line 70
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, a
						// (a/p assign)
						// Destination is a variable with offset 0, 0
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 8a with 42
						// var, auto|reg
						// matchobj comparing flags 1 with 42
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 8a
						// matchobj comparing flags 1 with 8a
						// const
						// matchobj comparing flags 1 with 8a
						// matchobj comparing flags 1 with 8a
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 70
						//pcreltotemp
	.lipcrel	l12
	add	r7
l11: # 

						//../DeMiSTify/firmware/menu.c, line 70
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, a
						// (a/p assign)
						// Destination is a variable with offset 0, 0
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// var, auto|reg
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 8a
						// matchobj comparing flags 1 with 8a
						// const
						// matchobj comparing flags 1 with 8a
						// matchobj comparing flags 1 with 8a
	.liconst	1
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l12: # 

						//../DeMiSTify/firmware/menu.c, line 70
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags a type 3
						// var, auto|reg
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 70
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 20
		// Real offset of type is 28, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with a
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 70
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteStart // extern
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 71
		// Offsets 32, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 28
		// Real offset of type is 28, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 71
						//call
						//pcreltotemp
	.lipcrel	_OsdPutChar // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 72
						// (bitwise/arithmetic) 	//ops: 6, 0, 3
						//Special case - addt
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	4
	addt	r5
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 72
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 6a, 4a
						// (a/p assign)
						// Dereferencing object...
						// Destination is a variable with offset 0, 40
		// Real offset of type is 40, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 6a with 4a
						// deref 
	ld	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/menu.c, line 72
						//call
						//pcreltotemp
	.lipcrel	_OsdPuts // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 73
						//call
						//pcreltotemp
	.lipcrel	_OsdWriteEnd // extern
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/menu.c, line 74
						// (bitwise/arithmetic) 	//ops: 6, 0, 6
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// const
	.liconst	11
	add	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 69
						// (bitwise/arithmetic) 	//ops: 4, 0, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	add	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 69
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	8
	sgn
	cmp	r3

						//../DeMiSTify/firmware/menu.c, line 69
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7
						// allocreg r1
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_Menu_Set
_Menu_Set:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 81
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 2
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l1,4
						// static pe not varadr
						//sizemod based on type 0xa
	stmpdec	r2

						//../DeMiSTify/firmware/menu.c, line 82
		// Offsets 7, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 4
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	7
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 83
		// Offsets 7, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

						// required value found in tmp
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 83
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw // extern
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// freereg r2
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_Menu_ShowHide
_Menu_ShowHide:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 97
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 40
						// const
						// matchobj comparing flags 1 with 40
	.liconst	0
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 97
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7

						//../DeMiSTify/firmware/menu.c, line 98
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 98
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7

						//../DeMiSTify/firmware/menu.c, line 98
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 98
						//pcreltotemp
	.lipcrel	l23
	add	r7
l22: # 

						//../DeMiSTify/firmware/menu.c, line 98
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done
l23: # 

						//../DeMiSTify/firmware/menu.c, line 98
		// Offsets 0, 0
		// Have am? no, no
		// flags 4a, 2
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l2,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r3

						//../DeMiSTify/firmware/menu.c, line 100
						//pcreltotemp
	.lipcrel	l25
	add	r7
l21: # 

						//../DeMiSTify/firmware/menu.c, line 100
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 42, 2
						// (a/p assign)
							// Not using addressing mode
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l2,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// freereg r1
						// freereg r2
l25: # 
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 101
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	and	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 101
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	64
	addt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//../DeMiSTify/firmware/menu.c, line 101
						//call
						//pcreltotemp
	.lipcrel	_spi_osd_cmd // extern
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 105
						//FIXME convert
						// (convert - reducing type 3 to 503
						// (prepobj r0)
 						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-4
	mr	r0
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_Menu_Visible
_Menu_Visible:
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 111
						//setreturn
						// (obj to r0) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4
	.weak	_Menu_JoystickToAnalogue
_Menu_JoystickToAnalogue:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 118
		// Offsets 0, 0
		// Have am? no, no
		// flags 62, 42
						// (a/p assign)
						// Dereferencing object...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 62 type 3
						// matchobj comparing flags 62 with 40
						// deref 
	ld	r3
						// (save temp)isreg
	mr	r2
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 119
		// Offsets -32512, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 62
						// const
						// matchobj comparing flags 1 with 62
	.liconst	-32512
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 119
		// Offsets 32512, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	32512
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 120
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 120
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l31
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 122
						// (minus)
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	mr	r1
						// matchobj comparing flags 1 with 2
	.liconst	0
	exg r1
	sub r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 122
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 4a with 2
						// reg r1 - only match against tmp
	mt	r1
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	8
	shl	r4
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 123
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	sub	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 125
						//pcreltotemp
	.lipcrel	l35
	add	r7
l31: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 125
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 125
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l34
		add	r7

						//../DeMiSTify/firmware/menu.c, line 127
						// (bitwise/arithmetic) 	//ops: 0, 0, 6
						// (obj to r5) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	mr	r5
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	8
	shl	r5
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 128
						// (bitwise/arithmetic) 	//ops: 0, 3, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 131
						//pcreltotemp
	.lipcrel	l35
	add	r7
l34: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 131
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
	mul	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 131
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	4
	sgn
	shr	r2
						// (save result) // isreg
						// freereg r1
l35: # 

						//../DeMiSTify/firmware/menu.c, line 132
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 132
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l37
		add	r7

						//../DeMiSTify/firmware/menu.c, line 133
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 42
						// reg r5 - only match against tmp
						// (save temp)isreg
	mr	r2
						//save_temp done
l37: # 

						//../DeMiSTify/firmware/menu.c, line 134
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	sgn
	cmp	r2

						//../DeMiSTify/firmware/menu.c, line 134
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l39
		add	r7

						//../DeMiSTify/firmware/menu.c, line 135
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 42, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 42
						// reg r4 - only match against tmp
						// (save temp)isreg
	mr	r2
						//save_temp done
l39: # 

						//../DeMiSTify/firmware/menu.c, line 136
						// Q1 disposable
						// Z disposable
		// Offsets 0, 0
		// Have am? yes, yes
		// flags 42, 62
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r3
						//save_temp done
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.weak	_Menu_Joystick
_Menu_Joystick:
	stdec	r6
						// allocreg r2
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r2
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 143
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 40
						// var, auto|reg
						// matchobj comparing flags 1 with 40
	.liconst	4
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 143
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 2
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 143
						//call
						//pcreltotemp
	.lipcrel	_user_io_digital_joystick_ext // extern
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// freereg r2
	ldinc	r6	// shortest way to add 4 to sp
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.6
	.global	_Menu_UpdateInput
_Menu_UpdateInput:
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 187
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 187
						//call
						//pcreltotemp
	.lipcrel	_UpdateKeys // extern
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 188
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menu_joy
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 21 with 82
						// matchobj comparing flags 21 with 82
						// const/deref
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// (prepobj tmp)
 						// (prepobj tmp)
 						// matchobj comparing flags a1 with 82
						// matchobj comparing flags a1 with 82
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	-24
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 189
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 21
						// matchobj comparing flags 82 with 82
						//extern: comparing 0 with 0
						// extern (offset 0)
	.liabs	_menu_buttons
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 21 with 82
						// matchobj comparing flags 21 with 82
						// const/deref
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// (prepobj tmp)
 						// (prepobj tmp)
 						// matchobj comparing flags a1 with 82
						// matchobj comparing flags a1 with 82
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	-20
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r2
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 44
		// Real offset of type is 44, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 21
						// matchobj comparing flags 2 with 82
						// extern
	.liabs	_menu_joy
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 190
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 4a type 3
						// matchobj comparing flags 4a with 2
						// matchobj comparing flags 4a with 82
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 4a
						// matchobj comparing flags 1 with 82
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 190
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
	.liconst	8
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 190
						// Q1 disposable
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 4a with 1
						// matchobj comparing flags 4a with 82
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 4a with 4a
						// matchobj comparing flags 4a with 4a
						// reg r1 - only match against tmp
	mt	r1
	or	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_menu_joymerged, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
						// freereg r2
						// freereg r1
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.7
	.global	_Menu_PollInput
_Menu_PollInput:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4

						//../DeMiSTify/firmware/menu.c, line 197
						//call
						//pcreltotemp
	.lipcrel	_Menu_UpdateInput // extern
	add	r7
						// Flow control - popping 0 + 0 bytes

						//../DeMiSTify/firmware/menu.c, line 198
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_menu_longpress
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 199
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 16
		// Real offset of type is 16, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 1
						// matchobj comparing flags 42 with 82
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 199
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 199
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 199
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 5
						// (obj to r4) flags 4a type 3
						// matchobj comparing flags 4a with 4a
						// reg r1 - only match against tmp
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r4
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 200
		// Offsets 750, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 32
		// Real offset of type is 32, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	750
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 200
						//call
						//pcreltotemp
	.lipcrel	_GetTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 200
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 200
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 4a with 4a
						// reg r1 - only match against tmp
						//Saving to reg r5
						// (save temp)isreg
	mr	r5
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (test)
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 4a
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	20
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_buttons
						//extern deref
						//sizemod based on type 0x3
	ldt
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 56
		// Real offset of type is 56, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 201
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
l57: # 

						//../DeMiSTify/firmware/menu.c, line 203
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 204
						//call
						//pcreltotemp
	.lipcrel	_Menu_UpdateInput // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 205
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 205
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 205
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 205
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l53
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 206
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 4a
						// extern (offset 0)
	.liabs	_menu_longpress
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	1
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
l53: # 

						//../DeMiSTify/firmware/menu.c, line 201
						// (test)
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l58
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	16
	ldidx	r6
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// extern
	.liabs	_menu_buttons
						//extern deref
						//sizemod based on type 0x3
	ldt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// var, auto|reg
						// matchobj comparing flags 1 with 2
	.liconst	20
	ldidx	r6
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 92
		// Real offset of type is 92, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 2
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 201
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 201
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 201
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
l58: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 208
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	mr	r0
						// freereg r1
						// freereg r3
						// freereg r4
						// freereg r5
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
	.global	_Menu_Run
_Menu_Run:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-12
	add	r6
						// allocreg r5
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//../DeMiSTify/firmware/menu.c, line 215
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 216
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1

						// required value found in tmp
						// (save temp)isreg
	mr	r4
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 218
						//FIXME convert
						// (convert - reducing type 503 to 3
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 21 type 503
						// matchobj comparing flags 21 with 1
						// const/deref
						// matchobj comparing flags 1 with 1
						// (prepobj tmp)
 						// (prepobj tmp)
 						// matchobj comparing flags a1 with 1
						// deref
						// const to tmp
						// matchobj comparing flags 1 with 1
	.liconst	-20
						//sizemod based on type 0x503
	ldt
						//Saving to reg r0
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 220
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 21
						// var, auto|reg
						// matchobj comparing flags 1 with 21
	.liconst	4
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 82
						// matchobj comparing flags 2 with 82
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)store type a
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 233
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 82
	.liconst	1
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 233
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
	.liconst	0
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 233
		// Offsets 252, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 40
		// Real offset of type is 48, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 82
	.liconst	252
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 233
						//call
						//pcreltotemp
	.lipcrel	_Menu_PollInput // extern
	add	r7
						// Flow control - popping 8 + 0 bytes
						// matchobj comparing flags 1 with 82
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 233
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 4a with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 233
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l62
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 235
		// Offsets -1, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 52
		// Real offset of type is 52, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	-1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 235
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 236
		// Offsets 90, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 60
		// Real offset of type is 60, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 236
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 238
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
l62: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 240
						// (test)
						// (obj to tmp) flags 2 type 101
						// extern
	.liabs	_menu_longpress
						//extern deref
						//sizemod based on type 0x101
	byt
	ldt

						//../DeMiSTify/firmware/menu.c, line 240
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l64
		add	r7

						//../DeMiSTify/firmware/menu.c, line 241
						//call
						//pcreltotemp
	.lipcrel	_ToggleScandoubler // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
l64: # 

						//../DeMiSTify/firmware/menu.c, line 243
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_menu_joy
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 244
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l2,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 244
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 259
		// Offsets 253, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 52
		// Real offset of type is 52, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 259
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 260
		// Offsets 250, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 64
		// Real offset of type is 64, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 260
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 261
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	255
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 261
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 4a with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 261
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 80
		// Real offset of type is 84, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 261
						//call
						//pcreltotemp
	.lipcrel	_Menu_Joystick // extern
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 262
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	8
	sgn
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 262
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 4a with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 262
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 92
		// Real offset of type is 100, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 262
						//call
						//pcreltotemp
	.lipcrel	_Menu_Joystick // extern
	add	r7
						// Flow control - popping 4 + 4 bytes
	.liconst	8
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 264
						//pcreltotemp
	.lipcrel	l110
	add	r7
l66: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 266
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 2 type 3
						// extern
	.liabs	_menu_joymerged
						//extern deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 268
						// (test)
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 2
						// reg r3 - only match against tmp
	//mt
				// flags 42
	and	r3

						//../DeMiSTify/firmware/menu.c, line 268
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 270
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 52
		// Real offset of type is 52, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 42
						// extern
	.liabs	_joy_timestamp
						//extern deref
						//sizemod based on type 0x103
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 270
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 270
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 270
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 271
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 4
		// Real offset of type is 4, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 273
						//pcreltotemp
	.lipcrel	l72
	add	r7
						// freereg r1
l70: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 273
		// Offsets 160, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 64
		// Real offset of type is 64, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	160
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 273
						//call
						//pcreltotemp
	.lipcrel	_GetTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 273
						// (getreturn)						// (save result) // not reg
						// Store_reg to type 0x103, flags 0x2
						// (prepobj tmp)
 						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_joy_timestamp, 4
						// extern pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 276
						//pcreltotemp
	.lipcrel	l72
	add	r7
l68: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 276
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_joy_timestamp
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// freereg r1
l72: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 278
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 278
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l73
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 278
		// Offsets 235, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 104
		// Real offset of type is 104, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	235
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 278
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 278
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 278
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 278
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l74
		add	r7
l73: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 280
		// Offsets -5, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-5
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l74: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 285
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	1
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 285
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l76
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 285
		// Offsets 244, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 124
		// Real offset of type is 124, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	244
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 285
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 285
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 285
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 285
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l77
		add	r7
l76: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 287
		// Offsets -6, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-6
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
l77: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 292
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	8
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 292
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l79
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 292
		// Offsets 245, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 144
		// Real offset of type is 144, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	245
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 292
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 292
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 292
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 292
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l80
		add	r7
l79: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 294
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 294
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l83
		add	r7

						//../DeMiSTify/firmware/menu.c, line 295
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 2

						// required value found in tmp
	mr	r0
				//return 0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	sub	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 297
						//pcreltotemp
	.lipcrel	l84
	add	r7
l83: # 

						//../DeMiSTify/firmware/menu.c, line 297
		// Offsets -1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-1
						// (save temp)isreg
	mr	r4
						//save_temp done
l84: # 

						//../DeMiSTify/firmware/menu.c, line 298
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l80: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 301
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	4
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 301
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l85
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 301
		// Offsets 242, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 164
		// Real offset of type is 164, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	242
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 301
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 301
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 301
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 301
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l86
		add	r7
l85: # 
						// allocreg r1
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 62
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 303
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 62 with 2
						// deref 
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 62
						// const
						// matchobj comparing flags 1 with 62
	.liconst	7
	sgn
	cmp	r0

						//../DeMiSTify/firmware/menu.c, line 303
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l89
		add	r7

						//../DeMiSTify/firmware/menu.c, line 304
						// (bitwise/arithmetic) 	//ops: 7, 0, 1
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 62 with 1
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 62
						// matchobj comparing flags 1 with 62
						// const
						// matchobj comparing flags 1 with 62
						// matchobj comparing flags 1 with 62
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l4,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.

						//../DeMiSTify/firmware/menu.c, line 306
						//pcreltotemp
	.lipcrel	l90
	add	r7
l89: # 

						//../DeMiSTify/firmware/menu.c, line 306
		// Offsets -2, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-2
						// (save temp)isreg
	mr	r4
						//save_temp done
l90: # 

						//../DeMiSTify/firmware/menu.c, line 307
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l86: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 310
		// Offsets 253, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 180
		// Real offset of type is 180, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	253
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 310
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 310
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 310
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 310
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l92
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 312
						// (test)
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 312
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l94
		add	r7

						//../DeMiSTify/firmware/menu.c, line 313
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 4
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 2
						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 315
						//pcreltotemp
	.lipcrel	l95
	add	r7
l94: # 

						//../DeMiSTify/firmware/menu.c, line 315
		// Offsets -3, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-3
						// (save temp)isreg
	mr	r4
						//save_temp done
l95: # 

						//../DeMiSTify/firmware/menu.c, line 316
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
l92: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 319
		// Offsets 250, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 196
		// Real offset of type is 196, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	250
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 319
						//call
						//pcreltotemp
	.lipcrel	_TestKey // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 319
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//../DeMiSTify/firmware/menu.c, line 319
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 4a
						// const
						// matchobj comparing flags 1 with 4a
	.liconst	2
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 319
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l97
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 321
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 1
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	7
	sgn
	cmp	r0

						//../DeMiSTify/firmware/menu.c, line 321
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l99
		add	r7

						//../DeMiSTify/firmware/menu.c, line 322
		// Offsets 7, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 4
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 1
						// static
	.liabs	l4,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	7
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 324
						//pcreltotemp
	.lipcrel	l100
	add	r7
l99: # 

						//../DeMiSTify/firmware/menu.c, line 324
		// Offsets -4, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 12
		// Real offset of type is 12, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-4
						// (save temp)isreg
	mr	r4
						//save_temp done
l100: # 

						//../DeMiSTify/firmware/menu.c, line 325
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r5
						//save_temp done
l97: # 

						//../DeMiSTify/firmware/menu.c, line 327
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	sgn
	cmp	r4

						//../DeMiSTify/firmware/menu.c, line 327
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7

						//../DeMiSTify/firmware/menu.c, line 327
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type a
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	88
	add	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 327
						// (test)
						// (obj to tmp) flags 62 type 4
						// matchobj comparing flags 62 with 1
						// deref 
	ld	r2

						//../DeMiSTify/firmware/menu.c, line 327
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l102
		add	r7
						// freereg r1
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 328
						//FIXME convert
						// (convert - reducing type 4 to a
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type 4
						// matchobj comparing flags 62 with 62
						// deref 
	ld	r2
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 328
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 224
		// Real offset of type is 224, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 42 with 62
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 328
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 6a with 42
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l102: # 
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 331
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//../DeMiSTify/firmware/menu.c, line 331
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	240
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 331
		// Offsets 90, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 232
		// Real offset of type is 240, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	90
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 331
						//call
						//pcreltotemp
	.lipcrel	_Menu_PollInput // extern
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 331
						// (test)
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 4a with 1
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 331
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l105
		add	r7
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 8
		// Real offset of type is 8, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// matchobj comparing flags 82 with 4a
						// var, auto|reg
						// matchobj comparing flags 1 with 4a
	.liconst	8
	addt	r6
	mr	r0

						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 82
						// matchobj comparing flags 2 with 82
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 331
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 2
						// matchobj comparing flags 2 with 82
						// var, auto|reg
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 82
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 82
	.liconst	11
	mul	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 331
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 2, 1
						// (obj to r0) flags 2 type a
						// matchobj comparing flags 2 with 82
						// var, auto|reg
						// matchobj comparing flags 1 with 82
	.liconst	4
						//sizemod based on type 0xa
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 4a with 2
						// matchobj comparing flags 4a with 2
						// reg r1 - only match against tmp
	mt	r1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0xa, flags 0x62
	mt	r0
	st	r6
	// Volatile, or not int - not caching
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 331
						// (test)
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 22 with 62
						// deref 
						// (prepobj tmp)
 						// (prepobj tmp)
 						// matchobj comparing flags a2 with 62
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt

						//../DeMiSTify/firmware/menu.c, line 331
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l105
		add	r7
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 332
						//FIXME convert
						// (convert - reducing type 4 to a
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type 4
						// matchobj comparing flags 22 with 22
						// deref 
						// (prepobj tmp)
 						// (prepobj tmp)
 						// matchobj comparing flags a2 with 22
						// deref
						// var FIXME - deref?
						// reg - auto
	ld	r6
						//sizemod based on type 0x4
	ldt
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 332
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 264
		// Real offset of type is 264, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 22
						// var, auto|reg
						// matchobj comparing flags 1 with 22
	.liconst	8
						//sizemod based on type 0x3
	ldidx	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 332
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 6a with 2
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1
l105: # 
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 343
						// (test)
						// (obj to tmp) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
				// flags 42
	and	r5

						//../DeMiSTify/firmware/menu.c, line 343
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l108
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 344
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 272
		// Real offset of type is 272, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 42
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 344
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
l108: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 346
						// (test)
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt

						//../DeMiSTify/firmware/menu.c, line 346
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l110
		add	r7
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 346
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

						// required value found in tmp
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 346
						//call
						//pcreltotemp
	.lipcrel	_CheckTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 346
						// (test)
						// (obj to tmp) flags 4a type 103
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 346
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l110
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 348
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 296
		// Real offset of type is 296, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 4a
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l4,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 348
						//call
						//pcreltotemp
	.lipcrel	_Menu_Draw // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 349
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 304
		// Real offset of type is 304, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 349
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 350
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 2
						// (a/p assign)
						// Destination is a variable with offset 0, 3
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// (prepobj r0)
 						// static
	.liabs	l3,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
						// const
						// matchobj comparing flags 1 with 82
						// matchobj comparing flags 1 with 82
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
l110: # 
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	.liconst	-12
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.9
	.global	_Menu_Message
_Menu_Message:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	stdec	r6	// shortest way to decrement sp by 4
						// allocreg r4
						// allocreg r1
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 40, 42
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r3
						// allocreg r2
						// allocreg r1
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 68
		// Real offset of type is 68, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 40
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 357
						// (bitwise/arithmetic) 	//ops: 2, 0, 6
						//Special case - addt
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	77
	addt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 358
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	81
	add	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/menu.c, line 358
						// Q1 disposable
		// Offsets 0, 0
		// Have am? yes, no
		// flags 6a, 62
						// (a/p assign)
						// Dereferencing object...
						// Destination is a variable with offset 0, 0
		// Real offset of type is 0, isauto 0
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 6a type a
						// matchobj comparing flags 6a with 1
						// deref 
	ld	r1
						// (save temp)store type a
	st	r6
						//save_temp done
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 359
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 42 with 6a
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/menu.c, line 359
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l115
		add	r7
						// freereg r3
						// allocreg r3

						//../DeMiSTify/firmware/menu.c, line 361
						// (bitwise/arithmetic) 	//ops: 6, 0, 4
						//Special case - addt
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	4
	addt	r5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 361
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 6a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 72
		// Real offset of type is 72, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 42 with 4a
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)store type a
	st	r3
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 362
		// Offsets 0, 0
		// Have am? no, no
		// flags 2, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 28
		// Real offset of type is 28, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 42
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l1,0
						//static deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 362
						//call
						//pcreltotemp
	.lipcrel	_Menu_Set // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 363
						// Z disposable
		// Offsets 0, 0
		// Have am? no, yes
		// flags 62, 6a
						// (a/p assign)
						// Dereferencing object...
						// Destination is a variable with offset 0, 72
		// Real offset of type is 72, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 62 type a
						// deref 
	ld	r6
						// (save temp)store type a
	st	r3
						//save_temp done
						// freereg r3
l115: # 
						// allocreg r3
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 365
						// (test)
						// (obj to tmp) flags 42 type a
						// reg r4 - only match against tmp
	mt	r4
				// flags 42
	and	r4

						//../DeMiSTify/firmware/menu.c, line 365
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l116
		add	r7

						//../DeMiSTify/firmware/menu.c, line 365
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 36
		// Real offset of type is 36, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 42
						// const
						// matchobj comparing flags 1 with 42
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 365
						//pcreltotemp
	.lipcrel	l117
	add	r7
l116: # 

						//../DeMiSTify/firmware/menu.c, line 365
		// Offsets 1, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 36
		// Real offset of type is 36, isauto 0
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
l117: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 365
		// Offsets 0, 0
		// Have am? no, no
		// flags 42, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 44
		// Real offset of type is 44, isauto 0
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/menu.c, line 365
						//call
						//pcreltotemp
	.lipcrel	_Menu_ShowHide // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 366
						// (test)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	20
	ldidx	r6

						//../DeMiSTify/firmware/menu.c, line 366
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l120
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 366
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 2

						// required value found in tmp
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						//No need to mask - same size

						//../DeMiSTify/firmware/menu.c, line 366
						//call
						//pcreltotemp
	.lipcrel	_GetTimer // extern
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/menu.c, line 366
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2

						//../DeMiSTify/firmware/menu.c, line 366
						//pcreltotemp
	.lipcrel	l121
	add	r7
l120: # 
						// allocreg r1

						//../DeMiSTify/firmware/menu.c, line 366
		// Offsets 0, 0
		// Have am? no, no
		// flags 1, 4a
						// (a/p assign)
						// Destination is a register...
						// Destination is a variable with offset 0, 60
		// Real offset of type is 60, isauto 0
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)isreg
	mr	r2
						//save_temp done
l121: # 

						//../DeMiSTify/firmware/menu.c, line 366
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj tmp)
 						// (prepobj tmp)
 						// static
	.liabs	l3,4
						// static pe not varadr
						//sizemod based on type 0x3
	stmpdec	r2
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6	// shortest way to add 4 to sp
	.lipcrel	.functiontail, 0
	add	r7

	.section	.data.a
	.global	_joy_timestamp
_joy_timestamp:
	.int	0
	.section	.bss.b
	.global	_menu_longpress
	.comm	_menu_longpress,1
	.section	.bss.c
	.global	_menu_buttons
	.comm	_menu_buttons,4
	.section	.bss.d
	.global	_menu_joy
	.comm	_menu_joy,4
	.section	.bss.e
	.global	_menu_joymerged
	.comm	_menu_joymerged,4
	.section	.data.f
l2:
	.int	0
	.section	.data.10
l3:
	.int	0
	.section	.bss.11
	.lcomm	l1,4
	.section	.bss.12
	.lcomm	l4,4
