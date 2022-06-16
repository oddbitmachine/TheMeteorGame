; Sets the foreground, background and border colors, calling INITGRP after
InitGraphicMode:
	ld hl,FORCLR		; Loads FORCLR sys variable in HL
        ld (hl),b		; Loads the value from B into the position pointed by HL
        ld hl,BAKCLR		; Loads BAKCLR sys variable in HL
        ld (hl),c		; Loads the value from B into the position pointed by HL
        ld hl,BDRCLR		; Loads BDCLR sys variable in HL
        ld (hl),d		; Loads the value from B into the position pointed by HL
        call INIGRP		; Initializes the VDP graphic mode
        
        ret			; Return to the caller routine

Set16x16Sprites:
        ld    a,(RG1SAV)	; Load into A the current value of VDP's register 1
        and   $FC       	; AND A with $FC (11111100) resulting in xxxxxx00 (x=no change)
        or    $02       	; OR A with 00000010 resulting in xxxxxx10
        di       		; Disable interruptions before calling the VDP 
        ld    b, a		; Load value from A into B to be used by WRTVDP
        ld    c, $01    	; Load the register value (#1) into C
        call  WRTVDP    	; Send to VDP register set at C (#1) the data stored in B
        ei			; Enable interruptions
        ret        		; Return to the caller routine
