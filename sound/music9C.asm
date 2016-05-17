; =============================================================================================
; Project Name:		music9C
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music9C_Header:
	smpsHeaderVoice	music9C_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$07

	smpsHeaderDAC	music9C_DAC
	smpsHeaderFM	music9C_FM1,	smpsPitch02lo+$03,	$08
	smpsHeaderFM	music9C_FM2,	smpsPitch02lo,	$08
	smpsHeaderFM	music9C_FM3,	smpsPitch01lo,	$0F
	smpsHeaderFM	music9C_FM4,	smpsPitch01lo,	$0F
	smpsHeaderFM	music9C_FM5,	smpsPitch01lo,	$0A
	smpsHeaderPSG	music9C_PSG1,	smpsPitch04lo,	$03,	$05
	smpsHeaderPSG	music9C_PSG2,	smpsPitch03lo,	$06,	$05
	smpsHeaderPSG	music9C_PSG3,	smpsPitch03lo,	$00,	$04

; FM1 Data
music9C_FM1:
	smpsFMvoice	$00
	dc.b		nRst,	$30
music9C_Loop01:
	smpsAlterPitch	$01
	dc.b		nRst,	$0C,	nEb6,	$12,	nRst,	$06,	nEb6,	nRst
	dc.b		nE6,	$0C,	nRst,	$06,	nCs6,	$18,	nRst,	$06
	smpsLoop	$00,	$03,	music9C_Loop01
	dc.b		nF6,	$06,	nRst,	nF6,	nRst,	nF6,	nRst,	nC6
	dc.b		nRst,	nBb5,	$0C,	nRst,	$06,	nD6,	$4E
	smpsStop

; FM2 Data
music9C_FM2:
	smpsFMvoice	$01
	smpsAlterVol	$02
	smpsAlterPitch	$F4
	smpsE2		$01
	dc.b		nA5,	$0C,	nAb5,	nG5,	nFs5
	smpsAlterVol	$FE
	smpsAlterPitch	$0C
	smpsFMvoice	$02
music9C_Loop02:
	dc.b		nA4,	$06,	nRst,	nA4,	nRst,	nE4,	nRst,	nE4
	dc.b		nRst,	nG4,	$12,	nFs4,	$0C,	nG4,	$06,	nFs4
	dc.b		$0C
	smpsAlterPitch	$01
	smpsLoop	$00,	$03,	music9C_Loop02
	smpsAlterPitch	$FD
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nFs4,	nRst,	nFs4
	dc.b		nRst,	nE5,	$0C,	nRst,	$06,	nEb5,	$4E
	smpsE2		$01
	smpsStop

; FM3 Data
music9C_FM3:
	smpsFMvoice	$03
	dc.b		nRst,	$30
music9C_Loop03:
	dc.b		nE6,	$06,	nRst,	nE6,	nRst,	nCs6,	nRst,	nCs6
	dc.b		nRst,	nD6,	$12,	nD6,	$1E
	smpsLoop	$00,	$03,	music9C_Loop03
	dc.b		nE6,	$06,	nRst,	nE6,	nRst,	nCs6,	nRst,	nCs6
	dc.b		nRst,	nG6,	$0C,	nRst,	$06,	nG6,	$1E,	smpsNoAttack
	dc.b		$30
	smpsStop

; FM4 Data
music9C_FM4:
	smpsFMvoice	$03
	dc.b		nRst,	$30
music9C_Loop04:
	dc.b		nCs6,	$06,	nRst,	nCs6,	nRst,	nA5,	nRst,	nA5
	dc.b		nRst,	nB5,	$12,	nB5,	$1E
	smpsLoop	$00,	$03,	music9C_Loop04
	dc.b		nCs6,	$06,	nRst,	nCs6,	nRst,	nA5,	nRst,	nA5
	dc.b		nRst,	nD6,	$0C,	nRst,	$06,	nD6,	$4E

; FM5 Data
music9C_FM5:

; PSG1 Data
music9C_PSG1:

; PSG2 Data
music9C_PSG2:

; PSG3 Data
music9C_PSG3:
	smpsStop

; DAC Data
music9C_DAC:
	dc.b		nRst,	$30
music9C_Loop05:
	dc.b		dKick,	$0C,	dSnare
	smpsLoop	$00,	$0E,	music9C_Loop05
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$0C
	smpsStop

music9C_Voices:
	dc.b		$3A,$51,$08,$51,$02,$1E,$1E,$1E,$10,$1F,$1F,$1F,$0F,$00,$00,$00
	dc.b		$02,$0F,$0F,$0F,$1F,$18,$24,$22,$81;			Voice 00
	dc.b		$3B,$52,$31,$31,$51,$12,$14,$12,$14,$0D,$00,$0D,$02,$00,$00,$00
	dc.b		$01,$4F,$0F,$5F,$3F,$1E,$18,$2D,$80;			Voice 01
	dc.b		$3A,$61,$3C,$14,$31,$9C,$DB,$9C,$DA,$04,$09,$04,$03,$03,$01,$03
	dc.b		$00,$1F,$0F,$0F,$AF,$21,$47,$31,$80;			Voice 02
	dc.b		$1C,$6F,$01,$21,$71,$9F,$DB,$9E,$5E,$0F,$07,$06,$07,$08,$0A,$0B
	dc.b		$00,$8F,$8F,$FF,$FF,$18,$8D,$26,$80;			Voice 03
	dc.b		$00;			Voice 04
	even
