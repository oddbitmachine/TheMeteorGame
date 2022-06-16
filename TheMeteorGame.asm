; The Meteor Game

	include "System_BIOSCalls.asm"
	include "System_SystemVariables.asm"

	org 0x4000
        
	include "System_CartridgeHeader.asm"

; initialize the whole thing here
Init:
	;Let's initialize the screen colors
	ld b,15			; Foreground color
        ld c,13			; Background color
        ld d,13			; Border color
        call InitGraphicMode	; Initializes graphic mode with the color at BCD 
    
        call Set16x16Sprites	; Set the sprite size to 16x16 pixels
        
        ld   a,0		; Load the sprite ID 0 into A
        call CALPAT		; Return the sprite 0 pattern VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        LD   bc,64		; Our sprite pattern uses 64 bytes
        LD   hl,MeteorIdleSprite01 ; Load the pattern address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address
        
        ld   a,0		; Load the sprite ID 0 into A
        call CALATR		; Return the sprite 0 attribute VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        ld   bc,4		; Our sprite attribute uses 4 bytes
        LD   hl,MeteorIdleSprite01_attrib ; Load the attribute address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address

        ld   a,1		; Load the sprite ID 1 into A
        call CALPAT		; Return the sprite 1 pattern VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        LD   bc,64		; Our sprite pattern uses 64 bytes
        LD   hl,MeteorIdleSprite02 ; Load the pattern address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address
        
        ld   a,1		; Load the sprite ID 1 into A
        call CALATR		; Return the sprite 1 attribute VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        ld   bc,4		; Our sprite attribute uses 4 bytes
        LD   hl,MeteorIdleSprite02_attrib ; Load the attribute address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address
        ld   a,2		; Load the sprite ID 2 into A
        call CALPAT		; Return the sprite 2 pattern VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        LD   bc,64		; Our sprite pattern uses 64 bytes
        LD   hl,MeteorIdleSprite03 ; Load the pattern address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address
        
        ld   a,2		; Load the sprite ID 2 into A
        call CALATR		; Return the sprite 2 attribute VRAM address in HL 
        push hl			; Send HL data to he stack
        pop  de			; then return it bacl in DE
        ld   bc,4		; Our sprite attribute uses 4 bytes
        LD   hl,MeteorIdleSprite03_attrib ; Load the attribute address in HL
        
        call LDIRVM		; Copy BC blocks of data from RAM HL address into VRAM DE address
    

            
ForeverLoop:
    jr ForeverLoop    ; Repeats the loop indefinitely
        

	include "Function_SetScreen.asm"        
	include "Asset_MeteorData.asm"
        
        end Init