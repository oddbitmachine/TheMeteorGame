; MSX BIOS Calls - http://map.grauw.nl/resources/msxbios.php
INIGRP:    equ 00072h	; Function : Switches to SCREEN 2 (high resolution screen with 256×192 pixels)
    			; Input    : GRPNAM, GRPCGP, GRPCOL, GRPATR, GRPPAT
    			; Registers: All
LDIRVM:    equ 0005Ch	; Function : Block transfer to VRAM from memory
    			; Input    : BC - Block length
    			;            DE - Start address of VRAM
    			;            HL - Start address of memory
    			; Registers: All
WRTVDP:    equ 00047h	; Function : Write data in the VDP-register
			; Input    : B  - Data to write
			;            C  - Number of the register
			; Registers: AF, BC
CALPAT:	   equ 00084h	; Function : Returns the address of the sprite pattern table
          		; Input    : A  - Sprite ID
          		; Output   : HL - For the address
          		; Registers: AF, DE, HL
CALATR:    equ 00087h	; Function : Returns the address of the sprite attribute table
              		; Input    : A  - Sprite number
              		; Output   : HL - For the address
              		; Registers: AF, DE, HL