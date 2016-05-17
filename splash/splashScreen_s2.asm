; =====================================================================================================================
; Splash Screen Index
; =====================================================================================================================
; *** FORMAT ***
; dc.l	Art Pointer,		Mappings Pointer,	Palette Pointer
; dc.b	Palette Length/2,	Music ID
; dc.w	Wait Time
; dc.b	Next Screen,		Additional Routine (Unused)
; =====================================================================================================================
; *** NEXT SCREEN ***
; Use for the next screen mode, OR to go to another splash screen
; if < $80, it's to a screen mode
; if > $80, it's to a splash screen
;
; eg.	$04	-	Title Screen
;	$0C	-	Level
;	$80	-	Splash Screen 0
;	$81	-	Splash Screen 1
;	etc.
; =====================================================================================================================
RAM_SplashScreen		EQU	$FFFFF742
SplashScreen_Index:	
				dc.l	Art_STeam,	Map_STeam,	Pal_STeam
				dc.b	$10,		$35+$80
				dc.w	$100
				dc.b	$81,		$00		
				dc.l	Art_Dimps,	Map_Dimps,	Pal_Dimps
				dc.b	$10,		$00
				dc.w	$100
				dc.b	$82,		$00
				dc.l	Art_BinOC,	Map_BinOC,	Pal_BinOC
				dc.b	$10,		$35+$80
				dc.w	$100
				dc.b	$04,		$00					
				dc.l	Art_BadCredits,	Map_BadCredits,	Pal_Credits
				dc.b	$10,		$9E
				dc.w	$FFF
				dc.b	$04,		$00							
; =====================================================================================================================
; Splash Screen Code
; =====================================================================================================================
SplashScreen:	
				move.b	#$78,d0
				jsr	PlayMusic			; Stop music
				jsr	ClearPLC			; Clear PLCs
				jsr	Pal_FadeFrom			; Fade out previous palette
				move	#$2700,sr

SplashScreen_VDP:		lea	($C00004).l,a6			; Setup VDP
				move.w	#$8004,(a6)
				move.w	#$8230,(a6)
				move.w	#$8407,(a6)
				move.w	#$9001,(a6)
				move.w	#$9200,(a6)
				move.w	#$8B03,(a6)
				move.w	#$8720,(a6)
				clr.b	($FFFFF64E).w
				jsr	ClearScreen			; Clear screen
				
SplashScreen_ReadIndex:		lea	(SplashScreen_Index).l,a3
				moveq	#0,d7
				move.b	(RAM_SplashScreen).l,d7
				lsl.l	#4,d7
				adda.l	d7,a3
				moveq	#0,d7
				move.b	(RAM_SplashScreen).l,d7
				lsl.l	#1,d7
				adda.l	d7,a3
				
SplashScreen_Art:		move.l	#$40000000,($C00004).l		; Load art
				movea.l	(a3)+,a0
				jsr	NemDec
				
SplashScreen_Mappings:		lea	($FF0000).l,a1			; Load screen mappings
				movea.l	(a3)+,a0
				move.w	#0,d0
				jsr	EniDec
				
SplashScreen_ShowOnVDP:		lea	($FF0000).l,a1			; Show screen
				move.l	#$40000003,d0
				moveq	#$27,d1
				moveq	#$1B,d2
				jsr	ShowVDPGraphics				
				
SplashScreen_Palette:		movea.l	(a3)+,a1			; Load palette
				lea	($FFFFFB80).w,a2
				moveq	#0,d0
				moveq	#0,d7
				move.b	(a3)+,d7
				move.b	d7,d0
SplashScreen_PalLoop:		move.l	(a1)+,(a2)+
				tst.w	d0
				beq.s	SplashScreen_Palette2
				sub.w	#1,d0
				bra.s	SplashScreen_PalLoop				
SplashScreen_Palette2:		moveq	#0,d0
				move.b	#$40,d0
				sub.b	d7,d0
SplashScreen_PalLoop2:		move.l	#0,(a2)+
				tst.w	d0
				beq.s	SplashScreen_Music
				sub.w	#1,d0
				bra.s	SplashScreen_PalLoop2
						
SplashScreen_Music:		moveq	#0,d0
				move.b	(a3)+,d0			; Play music
				jsr	PlayMusic
				
SplashScreen_SetWait:		move.w	(a3)+,($FFFFF614).w		; Wait time
				jsr	Pal_FadeTo			; Fade palette in

; ---------------------------------------------------------------------------------------------------------------------
SplashScreen_Loop:		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
				jsr	DelayProgram			; Run delay program
				tst.w	($FFFFF614).w			; Test wait time
				beq.s	SplashScreen_Next		; is it over? branch
				andi.b	#$80,($FFFFF605).w		; is Start button pressed?
				beq.s	SplashScreen_Loop		; if not, loop

SplashScreen_Next:		moveq	#0,d0
				move.b	(a3)+,d0
				bpl.w	SplashScreen_GoToScreen		; if value is < $80, go to that screen
				bclr	#7,d0
				move.b	d0,(RAM_SplashScreen).l		; if value is > $80, go to that splash
				bra.w	SplashScreen
				
SplashScreen_GoToScreen:	move.b	d0,($FFFFF600).w		; go to screen
				rts	
				
; ---------------------------------------------------------------------------------------------------------------------
Art_SEGAS:			BINCLUDE "splash\sega_data.bin"
				even
Map_SEGAS:			BINCLUDE "splash\sega_map.bin"
				even
Pal_SEGAS:			BINCLUDE "splash\sega_pal.bin"
				even
; ---------------------------------------------------------------------------------------------------------------------				
Art_STeam:			BINCLUDE "splash\steam_data.bin"
				even
Map_STeam:			BINCLUDE "splash\steam_map.bin"
				even
Pal_STeam:			BINCLUDE "splash\steam_pal.bin"
				even
; ---------------------------------------------------------------------------------------------------------------------					
Art_Dimps:			BINCLUDE "splash\dimps_data.bin"
				even
Map_Dimps:			BINCLUDE "splash\dimps_map.bin"
				even
Pal_Dimps:			BINCLUDE "splash\dimps_pal.bin"
				even
; ---------------------------------------------------------------------------------------------------------------------				
Art_BinOC:			BINCLUDE "splash\binoc_data.bin"
				even
Map_BinOC:			BINCLUDE "splash\binoc_map.bin"
				even
Pal_BinOC:			BINCLUDE "splash\binoc_pal.bin"
				even		
; ---------------------------------------------------------------------------------------------------------------------				
Art_BadCredits:			BINCLUDE "splash\credits_bad_data.bin"
				even
Map_BadCredits:			BINCLUDE "splash\credits_bad_map.bin"
				even
Pal_Credits:			BINCLUDE "splash\credits_pal.bin"
				even					