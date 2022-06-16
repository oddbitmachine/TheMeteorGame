MeteorIdleSprite01:
; color 1
        DB $07,$18,$21,$42,$44,$81,$81,$81
        DB $80,$80,$80,$40,$41,$20,$18,$07
        DB $E0,$18,$E4,$12,$E2,$11,$75,$72
        DB $E1,$07,$70,$8A,$02,$04,$18,$E0

MeteorIdleSprite01_attrib:
    	DB $05,$5,$00,$01    ; Line 05, column 05, sprite ID 0, 
                    ; transparent(0) foreground and black (1) background

MeteorIdleSprite02
; color 11
        DB $00,$07,$1E,$3D,$3B,$7E,$7E,$7E
        DB $7F,$7F,$7F,$3F,$3E,$1F,$07,$00
        DB $00,$E0,$18,$EC,$1C,$0E,$0A,$0D
        DB $1E,$F8,$8F,$74,$FC,$F8,$E0,$00

MeteorIdleSprite02_attrib:
    	DB $05,$05,$04*1,$0B    ; Line 05, column 05, sprite ID 1 (4*1), 
                    ; transparent(0) foreground and black (1) background


MeteorIdleSprite03:        
; color 15
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$00,$00,$00
        DB $00,$00,$00,$00,$00,$E0,$80,$80
        DB $00,$00,$00,$00,$00,$00,$00,$00
        
MeteorIdleSprite03_attrib:
    	DB $05,$05,$04*2,$0F    ; Line 05, column 05, sprite ID 2 ($4*2), 
                    ; transparent(0) foreground and black (1) background
