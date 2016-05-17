; =============================================================================================
; Project Name:		music98
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music98_Header:
	smpsHeaderVoice	music98_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$05

	smpsHeaderDAC	music98_DAC
	smpsHeaderFM	music98_FM1,	smpsPitch02lo,	$10
	smpsHeaderFM	music98_FM2,	smpsPitch02lo,	$10
	smpsHeaderFM	music98_FM3,	smpsPitch02lo,	$10
	smpsHeaderFM	music98_FM4,	smpsPitch02lo,	$10
	smpsHeaderFM	music98_FM5,	smpsPitch02lo,	$10
	smpsHeaderPSG	music98_PSG1,	smpsPitch04lo,	$06,	$05
	smpsHeaderPSG	music98_PSG2,	smpsPitch03lo,	$06,	$05
	smpsHeaderPSG	music98_PSG3,	smpsPitch03lo,	$00,	$04

; FM4 Data
music98_FM4:
	smpsAlterNote	$03
	smpsPan		panRight,	$00
	smpsJump	music98_Jump01

; FM1 Data
music98_FM1:
	smpsPan		panLeft,	$00
music98_Jump01:
	smpsFMvoice	$00
	smpsNoteFill	$06
	dc.b		nE7,	$06,	$03,	$03,	$06,	$06
	smpsNoteFill	$00
	dc.b		nFs7,	$09,	nD7,	nCs7,	$06,	nE7,	$18
	smpsStop

; FM2 Data
music98_FM2:
	smpsFMvoice	$01
	smpsNoteFill	$06
	smpsE2		$01
	dc.b		nCs7,	$06,	$03,	$03,	$06,	$06
	smpsNoteFill	$00
	dc.b		nD7,	$09,	nB6,	nA6,	$06,	nCs7,	$18
	smpsE2		$01
	smpsStop

; FM5 Data
music98_FM5:
	smpsAlterNote	$03
	smpsPan		panRight,	$00
	smpsJump	music98_Jump02

; FM3 Data
music98_FM3:
	smpsPan		panLeft,	$00
music98_Jump02:
	smpsFMvoice	$02
	dc.b		nA4,	$0C,	nRst,	$06,	nA4,	nG4,	nRst,	$03
	dc.b		nG4,	$06,	nRst,	$03,	nG4,	$06,	nA4,	$18
	smpsStop

; PSG1 Data
music98_PSG1:
	smpsNoteFill	$06
	dc.b		nCs7,	$06,	$03,	$03,	$06,	$06
	smpsNoteFill	$00
	dc.b		nD7,	$09,	nB6,	nA6,	$06,	nCs7,	$18

; PSG2 Data
music98_PSG2:

; PSG3 Data
music98_PSG3:
	smpsStop

; DAC Data
music98_DAC:
	dc.b		dHiTimpani,	$12,	$06,	dVLowTimpani,	$09,	$09,	$06,	dHiTimpani
	dc.b		$06,	dLowTimpani,	dHiTimpani,	dLowTimpani,	dHiTimpani,	$0C
	smpsFade

music98_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b		$00;			Voice 03
	even
