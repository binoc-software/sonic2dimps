; =============================================================================================
; Project Name:		music99
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music99_Header:
	smpsHeaderVoice	music99_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$05

	smpsHeaderDAC	music99_DAC
	smpsHeaderFM	music99_FM1,	smpsPitch01lo,	$0C
	smpsHeaderFM	music99_FM2,	smpsPitch01lo,	$09
	smpsHeaderFM	music99_FM3,	smpsPitch01lo,	$0D
	smpsHeaderFM	music99_FM4,	smpsPitch01lo,	$0C
	smpsHeaderFM	music99_FM5,	smpsPitch01lo,	$0E
	smpsHeaderPSG	music99_PSG1,	smpsPitch00,	$00,	$03
	smpsHeaderPSG	music99_PSG2,	smpsPitch00,	$02,	$03
	smpsHeaderPSG	music99_PSG3,	smpsPitch00,	$03,	$04

; FM5 Data
music99_FM5:
	smpsAlterNote	$03

; FM1 Data
music99_FM1:
	smpsFMvoice	$00
	dc.b		nRst,	$3C,	nCs6,	$15,	nRst,	$03,	nCs6,	$06
	dc.b		nRst,	nD6,	$0F,	nRst,	$03,	nB5,	$18,	nRst
	dc.b		$06,	nCs6,	nRst,	nCs6,	nRst,	nCs6,	nRst,	nA5
	dc.b		nRst,	nG5,	$0F,	nRst,	$03,	nB5,	$0C,	nRst
	dc.b		$12,	nA5,	$06,	nRst,	nCs6,	nRst,	nA6,	nRst
	dc.b		nE6,	$0C,	nRst,	$06,	nAb6,	$12,	nA6,	$06
	dc.b		nRst,	$72
	smpsStop

; FM2 Data
music99_FM2:
	smpsFMvoice	$01
	smpsE2		$01
	dc.b		nRst,	$30,	nA3,	$06,	nRst,	nA3,	nRst,	nE3
	dc.b		nRst,	nE3,	nRst,	nG3,	$12,	nFs3,	$0C,	nG3
	dc.b		$06,	nFs3,	$0C,	nA3,	$06,	nRst,	nA3,	nRst
	dc.b		nE3,	nRst,	nE3,	nRst,	nD4,	$12,	nCs4,	$0C
	dc.b		nD4,	$06,	nCs4,	$0C,	nRst,	nA2,	nRst,	nA2
	dc.b		nRst,	$06,	nAb3,	$12,	nA3,	$06,	nRst,	nA2
	dc.b		$6C
	smpsE2		$01
	smpsStop

; FM3 Data
music99_FM3:
	smpsFMvoice	$02
	dc.b		nRst,	$30,	nE6,	$06,	nRst,	nE6,	nRst,	nCs6
	dc.b		nRst,	nCs6,	nRst,	nD6,	$0F,	nRst,	$03,	nD6
	dc.b		$18,	nRst,	$06,	nE6,	nRst,	nE6,	nRst,	nCs6
	dc.b		nRst,	nCs6,	nRst,	nG6,	$0F,	nRst,	$03,	nG6
	dc.b		$18,	nRst,	$06,	nE6,	$0C,	nRst,	nE6,	nRst
	dc.b		nRst,	$06,	nEb6,	$12,	nE6,	$0C
	smpsAlterVol	$FC
	smpsFMvoice	$01
	smpsAlterNote	$03
	dc.b		nA2,	$6C
	smpsStop

; FM4 Data
music99_FM4:
	smpsFMvoice	$02
	dc.b		nRst,	$30,	nCs6,	$06,	nRst,	nCs6,	nRst,	nA5
	dc.b		nRst,	nA5,	nRst,	nB5,	$0F,	nRst,	$03,	nB5
	dc.b		$18,	nRst,	$06,	nCs6,	nRst,	nCs6,	nRst,	nA5
	dc.b		nRst,	nA5,	nRst,	nD6,	$0F,	nRst,	$03,	nD6
	dc.b		$18,	nRst,	$06,	nCs6,	$0C,	nRst,	nCs6,	nRst
	dc.b		nRst,	$06,	nC6,	$12,	nCs6,	$0C
	smpsAlterVol	$FD
	smpsFMvoice	$01
	smpsModSet	$00,	$01,	$06,	$04
	dc.b		nA2,	$6C
	smpsStop
	smpsPSGform	$E7
	dc.b		nRst,	$30
music99_Loop01:
	smpsNoteFill	$03
	dc.b		nA5,	$0C
	smpsNoteFill	$0C
	dc.b		$0C
	smpsNoteFill	$03
	dc.b		$0C
	smpsNoteFill	$0C
	dc.b		$0C
	smpsLoop	$00,	$05,	music99_Loop01
	smpsNoteFill	$03
	dc.b		$06
	smpsNoteFill	$0E
	dc.b		$12
	smpsNoteFill	$03
	dc.b		$0C
	smpsNoteFill	$0F
	dc.b		$0C
	smpsStop
	dc.b		nRst,	$0C,	nCs0,	nCs0,	nCs0,	nC0,	nCs0,	nC0
	dc.b		nCs0,	nC0,	nCs0,	nC0,	nCs0,	nC0,	nCs0,	nC0
	dc.b		nCs0,	nC0,	nCs0,	nC0,	$06,	nRst,	$02,	nCs0
	dc.b		nCs0,	nCs0,	$09,	nCs0,	$03,	nC0,	$0C,	nCs0
	dc.b		nC0,	nCs0,	nC0,	$06,	nCs0,	$12,	nCs0,	$0C
	dc.b		nC0
	smpsStop

music99_Voices:
	dc.b		$3A,$51,$08,$51,$02,$1E,$1E,$1E,$10,$1F,$1F,$1F,$0F,$00,$00,$00
	dc.b		$02,$0F,$0F,$0F,$1F,$18,$24,$22,$81;			Voice 00
	dc.b		$20,$36,$35,$30,$31,$DF,$DF,$9F,$9F,$07,$06,$09,$06,$07,$06,$06
	dc.b		$08,$2F,$1F,$1F,$FF,$19,$37,$13,$80;			Voice 01
	dc.b		$3A,$01,$07,$01,$01,$8E,$8E,$8D,$53,$0E,$0E,$0E,$03,$00,$00,$00
	dc.b		$00,$1F,$FF,$1F,$0F,$18,$28,$27,$80;			Voice 02
	dc.b		$FF,$FF,$FF,$FF,$81,$0C,$82,$82,$82,$08,$82,$04,$81,$0C,$82,$81
	dc.b		$82,$81,$82,$81,$82,$81,$82,$81,$82;			Voice 03
	dc.b		$81,$82,$81,$06,$80,$02,$82,$82,$82,$09,$82,$03,$81,$0C,$82,$82
	dc.b		$04,$82,$82,$82,$80,$80,$82,$06,$82;			Voice 04
	dc.b		$12,$82,$0C,$81,$F2,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$50,$53,$47
	dc.b		$32,$31,$80,$03,$80,$30,$F7,$00,$06;			Voice 05
	dc.b		$FF,$FA,$80,$20,$BF,$03,$C1,$C3,$EC,$01,$E9,$FF,$F7,$00,$05,$FF
	dc.b		$F4,$BF,$03,$C1,$C3,$EC,$01,$E9,$01;			Voice 06
	dc.b		$F7,$00,$07,$FF,$F4,$F2,$FF,$FF,$FF,$FF,$FF,$FF,$70,$73,$67,$33
	dc.b		$F3,$E7,$80,$30,$E8,$03,$C6,$0C,$E8;			Voice 07
	dc.b		$0C,$0C,$E8,$03,$0C,$E8,$0C,$0C,$F7,$00,$05,$FF,$EF,$E8,$03,$06
	dc.b		$E8,$0E,$12,$E8,$03,$0C,$E8,$0F,$0C;			Voice 08
	dc.b		$F2;			Voice 09
	even
