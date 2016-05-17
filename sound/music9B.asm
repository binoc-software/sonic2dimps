; =============================================================================================
; Project Name:		music9B
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music9B_Header:
	smpsHeaderVoice	music9B_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$13

	smpsHeaderDAC	music9B_DAC
	smpsHeaderFM	music9B_FM1,	smpsPitch02lo,	$0A
	smpsHeaderFM	music9B_FM2,	smpsPitch01lo,	$0F
	smpsHeaderFM	music9B_FM3,	smpsPitch01lo,	$0F
	smpsHeaderFM	music9B_FM4,	smpsPitch01lo,	$0D
	smpsHeaderFM	music9B_FM5,	smpsPitch03lo,	$16
	smpsHeaderPSG	music9B_PSG1,	smpsPitch04lo,	$03,	$05
	smpsHeaderPSG	music9B_PSG2,	smpsPitch03lo,	$06,	$05
	smpsHeaderPSG	music9B_PSG3,	smpsPitch03lo,	$00,	$04

; FM1 Data
music9B_FM1:
	smpsFMvoice	$00
	smpsModSet	$20,	$01,	$04,	$05
	dc.b		nRst,	$0C,	nCs6,	$12,	nRst,	$06,	nCs6,	nRst
	dc.b		nD6,	$12,	nB5,	$1E,	nCs6,	$06,	nRst,	nCs6
	dc.b		nRst,	nCs6,	nRst,	nA5,	nRst,	nG5,	$12,	nB5
	dc.b		$0C,	nRst,	$12,	nC6,	$04,	nRst,	nC6,	nB5
	dc.b		$06,	nRst,	nBb5,	nRst,	nA5,	nRst
	smpsModSet	$28,	$01,	$18,	$05
	dc.b		nAb5,	$60
	smpsStop

; FM2 Data
music9B_FM2:
	smpsFMvoice	$01
	dc.b		nRst,	$01,	nE7,	$06,	nRst,	nE7,	nRst,	nCs7
	dc.b		nRst,	nCs7,	nRst,	nD7,	$15,	nD7,	$1B,	nE7
	dc.b		$06,	nRst,	nE7,	nRst,	nCs7,	nRst,	nCs7,	nRst
	dc.b		nG7,	$15,	nG7,	$1B
	smpsStop

; FM3 Data
music9B_FM3:
	smpsFMvoice	$01
	dc.b		nCs7,	$0C,	nCs7,	nA6,	nA6,	nB6,	$15,	nB6
	dc.b		$1B,	nCs7,	$0C,	nCs7,	nA6,	nA6,	nD7,	$15
	dc.b		nD7,	$1B
	smpsStop

; FM4 Data
music9B_FM4:
	smpsFMvoice	$02
	smpsE2		$01
	dc.b		nA3,	$06,	nRst,	nA3,	nRst,	nE3,	nRst,	nE3
	dc.b		nRst,	nG3,	$15,	nFs3,	$0C,	nG3,	$03,	nFs3
	dc.b		$0C,	nA3,	$06,	nRst,	nA3,	nRst,	nE3,	nRst
	dc.b		nE3,	nRst,	nD4,	$15,	nCs4,	$0C,	nD4,	$03
	dc.b		nCs4,	$0C,	nA3,	$04,	nRst,	nA3,	nAb3,	$06
	dc.b		nRst,	nG3,	nRst,	nFs3,	nRst,	nFs3,	$60
	smpsE2		$01
	smpsStop

; FM5 Data
music9B_FM5:
	smpsFMvoice	$03
	dc.b		nRst,	$30,	nD7,	$12,	nRst,	$03,	nD7,	$1B
	dc.b		nRst,	$30,	nG7,	$12,	nRst,	$03,	nG7,	$1B

; PSG1 Data
music9B_PSG1:

; PSG2 Data
music9B_PSG2:

; PSG3 Data
music9B_PSG3:
	smpsStop

; DAC Data
music9B_DAC:
	dc.b		nRst,	$18,	dKick
	smpsLoop	$00,	$04,	music9B_DAC
	smpsStop

music9B_Voices:
	dc.b		$3A,$51,$08,$51,$02,$1E,$1E,$1E,$10,$1F,$1F,$1F,$0F,$00,$00,$00
	dc.b		$02,$0F,$0F,$0F,$1F,$18,$24,$22,$81;			Voice 00
	dc.b		$3C,$33,$30,$73,$70,$94,$9F,$96,$9F,$12,$00,$14,$0F,$04,$0A,$04
	dc.b		$0D,$2F,$0F,$4F,$2F,$33,$80,$1A,$80;			Voice 01
	dc.b		$3A,$01,$07,$01,$01,$8E,$8E,$8D,$53,$0E,$0E,$0E,$03,$00,$00,$00
	dc.b		$07,$1F,$FF,$1F,$0F,$1C,$28,$27,$80;			Voice 02
	dc.b		$1F,$66,$31,$53,$22,$1C,$98,$1F,$1F,$12,$0F,$0F,$0F,$00,$00,$00
	dc.b		$00,$FF,$0F,$0F,$0F,$8C,$8D,$8A,$8B;			Voice 03
	dc.b		$00;			Voice 04
	even
