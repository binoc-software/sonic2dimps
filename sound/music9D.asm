; =============================================================================================
; Project Name:		music9D
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music9D_Header:
	smpsHeaderVoice	music9D_Voices
	smpsHeaderChan	$07,	$03
	smpsHeaderTempo	$01,	$06

	smpsHeaderDAC	music9D_DAC
	smpsHeaderFM	music9D_FM1,	smpsPitch01lo,	$08
	smpsHeaderFM	music9D_FM2,	smpsPitch01lo,	$08
	smpsHeaderFM	music9D_FM3,	smpsPitch01lo,	$07
	smpsHeaderFM	music9D_FM4,	smpsPitch01lo,	$16
	smpsHeaderFM	music9D_FM5,	smpsPitch01lo,	$16
	smpsHeaderFM	music9D_FM6,	smpsPitch01lo,	$16
	smpsHeaderPSG	music9D_PSG1,	smpsPitch01lo,	$02,	$04
	smpsHeaderPSG	music9D_PSG2,	smpsPitch01lo,	$02,	$05
	smpsHeaderPSG	music9D_PSG3,	smpsPitch01lo,	$00,	$04

; FM3 Data
music9D_FM3:
	smpsAlterNote	$02

; FM1 Data
music9D_FM1:
	smpsFMvoice	$00
	dc.b		nE5,	$06,	nG5,	nC6,	nE6,	$0C,	nC6,	nG6
	dc.b		$2A
	smpsStop

; FM2 Data
music9D_FM2:
	smpsFMvoice	$00
	dc.b		nC5,	$06,	nE5,	nG5,	nC6,	$0C,	nA5,	nD6
	dc.b		$2A
	smpsStop

; FM4 Data
music9D_FM4:
	smpsFMvoice	$01
	dc.b		nE5,	$0C,	nE5,	$06,	nG5,	$06,	nRst,	nG5
	dc.b		nRst,	nC6,	$2A
	smpsStop

; FM5 Data
music9D_FM5:
	smpsFMvoice	$01
	dc.b		nC6,	$0C,	nC6,	$06,	nE6,	$06,	nRst,	nE6
	dc.b		nRst,	nG6,	$2A
	smpsStop

; FM6 Data
music9D_FM6:
	smpsFMvoice	$01
	dc.b		nG5,	$0C,	nG5,	$06,	nC6,	$06,	nRst,	nC6
	dc.b		nRst,	nE6,	$2A
	smpsStop

; PSG2 Data
music9D_PSG2:
	dc.b		nRst,	$2D
music9D_Loop01:
	dc.b		nG5,	$06,	nF5,	nE5,	nD5
	smpsSetVol	$03
	smpsLoop	$00,	$04,	music9D_Loop01
	smpsStop

; PSG1 Data
music9D_PSG1:
	smpsE2		$01
	dc.b		nRst,	$02,	nRst,	$2D
music9D_Loop02:
	dc.b		nG5,	$06,	nF5,	nE5,	nD5
	smpsSetVol	$03
	smpsLoop	$00,	$04,	music9D_Loop02

; PSG3 Data
music9D_PSG3:

; DAC Data
music9D_DAC:
	smpsE2		$01
	smpsStop

music9D_Voices:
	dc.b		$04,$35,$72,$54,$46,$1F,$1F,$1F,$1F,$07,$0A,$07,$0D,$00,$0B,$00
	dc.b		$0B,$1F,$0F,$1F,$0F,$23,$14,$1D,$80;			Voice 00
	dc.b		$3C,$31,$52,$50,$30,$52,$53,$52,$53,$08,$00,$08,$00,$04,$00,$04
	dc.b		$00,$10,$07,$10,$07,$1A,$80,$16,$80;			Voice 01
	even
