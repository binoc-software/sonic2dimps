; =============================================================================================
; Project Name:		music9A
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music9A_Header:
	smpsHeaderVoice	music9A_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$03

	smpsHeaderDAC	music9A_DAC
	smpsHeaderFM	music9A_FM1,	smpsPitch02lo,	$0A
	smpsHeaderFM	music9A_FM2,	smpsPitch03lo,	$0A
	smpsHeaderFM	music9A_FM3,	smpsPitch01lo,	$15
	smpsHeaderFM	music9A_FM4,	smpsPitch01lo,	$15
	smpsHeaderFM	music9A_FM5,	smpsPitch01lo,	$14
	smpsHeaderPSG	music9A_PSG1,	smpsPitch04lo,	$05,	$05
	smpsHeaderPSG	music9A_PSG2,	smpsPitch03lo,	$07,	$05
	smpsHeaderPSG	music9A_PSG3,	smpsPitch03lo,	$00,	$04

; FM1 Data
music9A_FM1:
	smpsFMvoice	$00

; PSG1 Data
music9A_PSG1:
	dc.b		nRst,	$06,	nG4,	nA4,	nB4,	nC5,	nD5,	nE5
	dc.b		nF5,	nG5,	$0C,	nB6,	$02,	smpsNoAttack,	nC7,	$01
	dc.b		nB6,	$03,	nG6
	smpsModSet	$0C,	$01,	$08,	$04
	dc.b		nA6,	$33
	smpsStop

; FM2 Data
music9A_FM2:
	smpsFMvoice	$01
	smpsNoteFill	$0B
	smpsE2		$01
	dc.b		nG5,	$03,	nG5,	nG4,	$06,	nG4,	nG5,	$03
	dc.b		nG5,	nG4,	$06,	nG4,	nG5,	$03,	nG5,	nRst
	dc.b		$06,	nRst,	$0C,	nG4,	$09
	smpsNoteFill	$00
	dc.b		nA4,	$33
	smpsE2		$01
	smpsStop

; FM3 Data
music9A_FM3:
	smpsPan		panLeft,	$00
	smpsFMvoice	$02
	smpsNoteFill	$06
	dc.b		nC6,	$03,	nC6,	nRst,	$0C,	nC6,	$03,	nC6
	dc.b		nRst,	$0C,	nC6,	$03,	nC6,	nRst,	$12
	smpsNoteFill	$00
	dc.b		nC6,	$09,	nD6,	$33
	smpsStop

; FM4 Data
music9A_FM4:
	smpsPan		panRight,	$00
	smpsFMvoice	$02
	smpsNoteFill	$06
	dc.b		nA5,	$03,	nA5,	nRst,	$0C,	nA5,	$03,	nA5
	dc.b		nRst,	$0C,	nA5,	$03,	nA5,	nRst,	$12
	smpsNoteFill	$00
	dc.b		nA5,	$09,	nB5,	$33
	smpsStop

; FM5 Data
music9A_FM5:
	smpsFMvoice	$03
	smpsModSet	$0D,	$01,	$02,	$05

; PSG2 Data
music9A_PSG2:
	dc.b		nG5,	$06,	nC6,	nB5,	nG5,	nC6,	nB5,	nG5
	dc.b		nC6,	nB5,	$0C,	nC6,	$09,	nB5,	$33

; PSG3 Data
music9A_PSG3:
	smpsStop

; DAC Data
music9A_DAC:
	dc.b		dSnare,	$03,	dSnare,	dKick,	$06,	dKick,	dSnare,	$03
	dc.b		dSnare,	dKick,	$06,	dKick,	dSnare,	$03,	dSnare,	dHiTimpani
	dc.b		dHiTimpani,	dVLowTimpani,	dVLowTimpani,	$03,	dVLowTimpani,	dVLowTimpani,	dSnare,	$09
	dc.b		$33
	smpsStop

music9A_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
		dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
		dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
		dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b		$00;			Voice 05
	even
