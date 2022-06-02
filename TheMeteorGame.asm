; The Meteor Game

; MSX BIOS Calls
INIGRP:	equ 00072h
	; Function : Switches to SCREEN 2 (high resolution screen with 256×192 pixels)
	; Input    : GRPNAM, GRPCGP, GRPCOL, GRPATR, GRPPAT
	; Registers: All
LDIRVM:	equ 0005Ch
	; Function : Block transfer to VRAM from memory
	; Input    : BC - Block length
        ;            DE - Start address of VRAM
        ;            HL - Start address of memory
	; Registers: All
WRTVDP:	equ 00047h
	; Function : Write data in the VDP-register
	; Input    : B  - Data to write
	;	     C  - Number of the register
	; Registers: AF, BC
CALPAT:	equ 00084h
	; Function : Returns the address of the sprite pattern table
	; Input    : A  - Sprite ID
	; Output   : HL - For the address
	; Registers: AF, DE, HL
CALATR:	equ 00087h
	; Function : Returns the address of the sprite attribute table
	; Input    : A  - Sprite number
	; Output   : HL - For the address
	; Registers: AF, DE, HL


; System Variables
FORCLR:	equ 0F3E9h
BAKCLR:	equ 0F3EAh
BDRCLR:	equ 0F3EBh
GRPATR:	equ 0F3CDh
GRPPAT:	equ 0F3CFh
RG0SAV:	equ 0F3DFh
RG1SAV:	equ 0F3E0h

	org 0x4000
        
; MSX cartridge header @ 0x4000 - 0x400f
	dw 0x4241
        dw Init
        dw Init
        dw 0
        dw 0
        dw 0
        dw 0
        dw 0

; initialize the whole thing here
Init:
	ld hl,FORCLR	; Load the foreground variable position in HL
        ld (hl),15	; Changes the value for FORCLR to 15 (White)
        ld hl,BAKCLR	; Load the background variable position in HL
        ld (hl),13	; Changes the value for BAKCLR to 13 (purple)
        ld hl,BDRCLR	; Load the border variable position in HL
        ld (hl),13	; Changes the value for BDRCLR to 13 (purple)
        call INIGRP	; Calls the routine that initializes the screen mode
	
        call Set16x16Sprites
        
        ld de,03800h	; Load in DE the VRAM position for sprite with ID 0
        LD bc,64	; The amount of data to be transferred: 4 x 16 bytes
        LD hl,MeteorIdleSprite01	; Load the MeteorIdleSprite01 pattern in HL
        
        call LDIRVM	; Copy BC amount of bytes of the content pointed by HL into the VRAM at address loaded in DE 
        
        ld de,01B00h	; Load in DE the VRAM position for the attributes
        ld bc,4		; The amount of data to be transferred: 4 bytes
        LD hl,MeteorIdleSprite01_attrib	; Load the MeteorIdleSprite01_attrib attribute in HL
        
        call LDIRVM
        
        ld de,03820h
        ld BC,64
        ld HL,MeteorIdleSprite02
        
        call LDIRVM
        
        ld de,01B04h
        ld BC,4
        ld HL,MeteorIdleSprite02_attrib
       
       	call LDIRVM
        
        ld de,03840h
        ld BC,64
        ld HL,MeteorIdleSprite03
        
        call LDIRVM
        
        ld de,01B08h
        ld BC,4
        ld HL,MeteorIdleSprite03_attrib
       
       	call LDIRVM
        	
ForeverLoop:
	jr ForeverLoop	; Repeats the loop indefinitely
        
Set16x16Sprites:
	ld a,(RG1SAV)	; Load into A the current value of VDP's register 1
        and $FC		; AND A with $FC (11111100) resulting in xxxxxx00 (x=no change)
        or $02		; OR A with 00000010 resulting in xxxxxx10
        di		; Disable interruptions before calling the VDP 
        ld b, a		; Load value from A into B to be used by WRTVDP
	ld c, $01	; Load the register value (#1) into C
	call WRTVDP	; Send to VDP register set at C (#1) the data stored in B
	ei		; Enable interruptions
        ret		; Return to the caller routine
        

MeteorIdleSprite01:
; color 1
        DB $07,$18,$21,$42,$44,$81,$81,$81
        DB $80,$80,$80,$40,$41,$20,$18,$07
        DB $E0,$18,$E4,$12,$E2,$11,$75,$72
        DB $E1,$07,$70,$8A,$02,$04,$18,$E0

MeteorIdleSprite01_attrib:
	DB $05,$5,$00,$01	; Line 05, column 05, sprite ID 0, 
        			; transparent(0) foreground and black (1) background

MeteorIdleSprite02
; color 11
        DB $00,$07,$1E,$3D,$3B,$7E,$7E,$7E
        DB $7F,$7F,$7F,$3F,$3E,$1F,$07,$00
        DB $00,$E0,$18,$EC,$1C,$0E,$0A,$0D
        DB $1E,$F8,$8F,$74,$FC,$F8,$E0,$00

MeteorIdleSprite02_attrib:
	DB $05,$05,$04*1,$0B	; Line 05, column 05, sprite ID 1 (4*1), 
        			; transparent(0) foreground and black (1) background


MeteorIdleSprite03:        
; color 15
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$E0,$80,$80
        DB $00,$00,$00,$00,$00,$00,$00,$00
        
MeteorIdleSprite03_attrib:
	DB $05,$05,$04*2,$0F	; Line 05, column 05, sprite ID 2 ($4*2), 
        			; transparent(0) foreground and black (1) background

        
        end Init
