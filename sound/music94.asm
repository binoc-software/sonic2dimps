; =============================================================================================
; Project Name:		music94
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music94_Header:
	smpsHeaderVoice	music94_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$03

	smpsHeaderDAC	music94_DAC
	smpsHeaderFM	music94_FM1,	smpsPitch01lo,	$0B
	smpsHeaderFM	music94_FM2,	smpsPitch01lo,	$0B
	smpsHeaderFM	music94_FM3,	smpsPitch02lo,	$0E
	smpsHeaderFM	music94_FM4,	smpsPitch01lo,	$10
	smpsHeaderFM	music94_FM5,	smpsPitch01lo,	$10
	smpsHeaderPSG	music94_PSG1,	smpsPitch04lo,	$06,	$00
	smpsHeaderPSG	music94_PSG2,	smpsPitch01lo,	$05,	$00
	smpsHeaderPSG	music94_PSG3,	smpsPitch00+$02,	$03,	$04

; FM1 Data
music94_FM1:
	smpsFMvoice	$00
music94_Loop01:
	dc.b		nBb5,	$0C,	nF5
	smpsAlterVol	$05
	smpsLoop	$00,	$04,	music94_Loop01
	smpsAlterVol	$EC
	smpsLoop	$01,	$02,	music94_Loop01
	smpsPan		panLeft,	$00
	smpsAlterVol	$FE
music94_Loop02:
	smpsCall	music94_Call01
	smpsLoop	$00,	$02,	music94_Loop02
	smpsAlterVol	$02
	smpsPan		panCentre,	$00
	smpsCall	music94_Call02
	smpsPan		panLeft,	$00
music94_Loop03:
	smpsCall	music94_Call03
	smpsLoop	$00,	$02,	music94_Loop03
	smpsCall	music94_Call04
	smpsLoop	$01,	$02,	music94_Loop03
	smpsPan		panCentre,	$00
	smpsJump	music94_Loop01

music94_Call01:
	dc.b		nRst,	$60,	nRst,	nRst,	$0C,	nG6,	$06,	nA6
	dc.b		nE6,	$48,	nRst,	$0C,	nG6,	$06,	nAb6,	nE6
	dc.b		$48
	smpsReturn

music94_Call02:
	dc.b		nC6,	$06,	nB5,	nC6,	nRst,	nC6,	nB5,	nC6
	dc.b		nRst,	nD6,	$12,	$06,	nRst,	$18,	nD6,	$06
	dc.b		nC6,	nD6,	nRst,	nD6,	nC6,	nD6,	nRst,	nE6
	dc.b		$12,	$06,	nRst,	$18,	nE6,	$06,	nD6,	nE6
	dc.b		nRst,	nE6,	nD6,	nE6,	nRst,	nE6,	$12,	$06
	dc.b		nRst,	$18,	nA6,	$24,	$03,	nRst,	nAb6,	$36
	dc.b		$06,	nRst,	nAb6,	nRst,	nAb6,	nRst,	nAb6,	nRst
	dc.b		nAb6,	nRst,	$2A
	smpsReturn

music94_Call03:
	dc.b		nE6,	$06,	nC6,	nRst,	nE6,	nC6,	nRst,	nE6
	dc.b		nC6,	nE6,	nC6,	nRst,	nE6,	nC6,	nRst,	$12
	smpsReturn

music94_Call04:
	dc.b		nRst,	$0C,	nA5,	$06,	nB5,	nC6,	$48,	nRst
	dc.b		$0C,	nB5,	$06,	nC6,	nD6,	$48
	smpsReturn

; FM2 Data
music94_FM2:
	smpsFMvoice	$00
music94_Loop04:
	dc.b		nA5,	$0C,	nE5
	smpsAlterVol	$05
	smpsLoop	$00,	$04,	music94_Loop04
	smpsAlterVol	$EC
	smpsLoop	$01,	$02,	music94_Loop04
	smpsFMvoice	$02
	smpsPan		panLeft,	$00
	smpsAlterNote	$03
	smpsAlterVol	$08
music94_Loop05:
	smpsCall	music94_Call05
	smpsLoop	$00,	$02,	music94_Loop05
	smpsFMvoice	$00
	smpsAlterNote	$00
	smpsAlterVol	$F8
	smpsPan		panCentre,	$00
	smpsCall	music94_Call06
music94_Loop06:
	smpsCall	music94_Call07
	smpsLoop	$00,	$02,	music94_Loop06
	smpsCall	music94_Call08
	smpsLoop	$01,	$02,	music94_Loop06
	smpsJump	music94_Loop04

music94_Call07:
	dc.b		nC6,	$06,	nA5,	nRst,	nC6,	nA5,	nRst,	nC6
	dc.b		nA5,	nC6,	nA5,	nRst,	nC6,	nA5,	nRst,	$12
	smpsReturn

music94_Call08:
	smpsAlterPitch	$F4
	smpsAlterVol	$03
	dc.b		nRst,	$0C,	nA5,	$06,	nB5,	nC6,	$48,	nRst
	dc.b		$0C,	nB5,	$06,	nC6,	nD6,	$48
	smpsAlterPitch	$0C
	smpsAlterVol	$FD
	smpsReturn

music94_Call06:
	dc.b		nA5,	$06,	nG5,	nA5,	nRst,	nA5,	nG5,	nA5
	dc.b		nRst,	nB5,	$12,	$06,	nRst,	$18,	nB5,	$06
	dc.b		nA5,	nB5,	nRst,	nB5,	nA5,	nB5,	nRst,	nC6
	dc.b		$12,	$06,	nRst,	$18,	nC6,	$06,	nB5,	nC6
	dc.b		nRst,	nC6,	nB5,	nC6,	nRst,	nC6,	$12,	$06
	dc.b		nRst,	$18,	nE6,	$24,	$03,	nRst,	nE6,	$36
	dc.b		$06,	nRst,	nE6,	nRst,	nE6,	nRst,	nE6,	nRst
	dc.b		nE6,	nRst,	$2A
	smpsReturn

; FM3 Data
music94_FM3:
	smpsFMvoice	$01
	smpsModSet	$13,	$01,	$03,	$05
music94_Jump01:
	dc.b		nRst,	$60,	nRst
music94_Loop07:
	smpsCall	music94_Call09
	smpsLoop	$00,	$02,	music94_Loop07
	smpsCall	music94_Call0A
	smpsCall	music94_Call0B
	dc.b		nF4,	$54,	nG4,	$06,	nA4,	nE4,	$60
	smpsCall	music94_Call0B
	dc.b		nF4,	$60,	nG4
	smpsJump	music94_Jump01

music94_Call0B:
	dc.b		nA4,	$18,	nE4,	$0C,	nA4,	nAb4,	$18,	nE4
	dc.b		nG4,	nA4,	$0C,	nG4,	nFs4,	$18,	nD4
	smpsReturn

music94_Call09:
	dc.b		nA4,	$0C,	nC5,	nE5,	nA4,	nAb4,	nC5,	nE5
	dc.b		nAb4,	nG4,	nB4,	nD5,	nG4,	nFs4,	nA4,	nC5
	dc.b		nFs4,	nF4,	nA4,	nC5,	nA4,	nE5,	nA4,	nC5
	dc.b		nF4,	nE4,	nAb4,	nB4,	nAb4,	nD5,	nAb4,	nB4
	dc.b		nE4
	smpsReturn

music94_Call0A:
	dc.b		nF4,	$24,	nC5,	$0C,	nB4,	$24,	nA4,	$0C
	dc.b		nG4,	$24,	nD5,	$0C,	nC5,	$24,	$06,	nD5
	dc.b		nE5,	$24,	$06,	$2A,	nC5,	$06,	nD5,	nE5
	dc.b		$24,	nF5,	$06,	nE5,	$36,	smpsNoAttack,	$30,	nRst
	smpsReturn

; FM4 Data
music94_FM4:
	smpsFMvoice	$00
	smpsModSet	$12,	$01,	$05,	$05
music94_Jump02:
	dc.b		nRst,	$60,	nRst
music94_Loop08:
	smpsCall	music94_Call05
	smpsLoop	$00,	$02,	music94_Loop08
music94_Loop09:
	dc.b		nRst,	$60
	smpsLoop	$00,	$05,	music94_Loop09
	smpsCall	music94_Call0C
	dc.b		nC6,	$54,	nD6,	$06,	nC6,	nB5,	$60
	smpsCall	music94_Call0C
	dc.b		nC6,	$60,	nD6
	smpsJump	music94_Jump02

music94_Call0C:
	dc.b		nA5,	$24,	nAb5,	$06,	nA5,	nB5,	$24,	nA5
	dc.b		$06,	nB5,	nC6,	$24,	nB5,	$06,	nC6,	nD6
	dc.b		$24,	nC6,	$06,	nD6
	smpsReturn

music94_Call05:
	dc.b		nA5,	$18,	nC6,	nD6,	$24,	nB5,	$0C,	nC6
	dc.b		$24,	nA5,	$0C,	nB5,	$18,	nG5,	nA5,	$60
	dc.b		nRst
	smpsReturn

; FM5 Data
music94_FM5:
	smpsFMvoice	$00
	smpsAlterNote	$01
	smpsPan		panRight,	$00
	smpsModSet	$13,	$01,	$03,	$05
	dc.b		nRst,	$60,	nRst
music94_Loop0A:
	smpsCall	music94_Call09
	smpsLoop	$00,	$02,	music94_Loop0A
	smpsCall	music94_Call0A
	smpsPan		panLeft,	$00
	smpsFMvoice	$02
	smpsAlterNote	$03
	smpsCall	music94_Call0C
	dc.b		nC6,	$54,	nD6,	$06,	nC6,	nB5,	$60
	smpsCall	music94_Call0C
	dc.b		nC6,	$60,	nD6
	smpsJump	music94_FM5

; PSG1 Data
music94_PSG1:
	smpsAlterNote	$02
music94_Jump03:
	dc.b		nRst,	$60,	nRst,	$60
music94_Loop0B:
	smpsCall	music94_Call01
	smpsLoop	$00,	$02,	music94_Loop0B
music94_Loop0C:
	dc.b		nRst,	$60
	smpsLoop	$00,	$05,	music94_Loop0C
music94_Loop0D:
	dc.b		nRst,	$60,	nRst,	nRst,	$0C,	nA5,	$06,	nB5
	dc.b		nC6,	$48,	nRst,	$0C,	nB5,	$06,	nC6,	nD6
	dc.b		$48
	smpsLoop	$00,	$02,	music94_Loop0D
	smpsJump	music94_Jump03

; PSG2 Data
music94_PSG2:
	smpsPSGvoice	$08
	smpsModSet	$0C,	$01,	$02,	$01
music94_Jump04:
	dc.b		nRst,	$60
	smpsLoop	$00,	$0F,	music94_PSG2
	smpsCall	music94_Call0B
	dc.b		nF4,	$54,	nG4,	$06,	nA4,	nE4,	$60
	smpsCall	music94_Call0B
	dc.b		nF4,	$60,	nG4
	smpsJump	music94_Jump04

; PSG3 Data
music94_PSG3:
	smpsPSGform	$E7
	smpsNoteFill	$06
music94_Jump05:
	dc.b		nBb5,	$18,	$18,	$18,	$0C,	$0C
	smpsJump	music94_Jump05

; DAC Data
music94_DAC:
	dc.b		dVLowTimpani,	$0C,	dSnare,	$04,	dSnare,	dSnare
	smpsLoop	$00,	$03,	music94_DAC
	dc.b		dMidTimpani,	$0C,	dLowTimpani
	smpsJump	music94_DAC

music94_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
