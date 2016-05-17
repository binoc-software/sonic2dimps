; =============================================================================================
; Project Name:		music92
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music92_Header:
	smpsHeaderVoice	music92_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$00

	smpsHeaderDAC	music92_DAC
	smpsHeaderFM	music92_FM1,	smpsPitch01hi,	$0A
	smpsHeaderFM	music92_FM2,	smpsPitch00,	$05
	smpsHeaderFM	music92_FM3,	smpsPitch00,	$0E
	smpsHeaderFM	music92_FM4,	smpsPitch00,	$0E
	smpsHeaderFM	music92_FM5,	smpsPitch00,	$0F
	smpsHeaderPSG	music92_PSG1,	smpsPitch03lo,	$02,	$00
	smpsHeaderPSG	music92_PSG2,	smpsPitch03lo,	$04,	$00
	smpsHeaderPSG	music92_PSG3,	smpsPitch00,	$01,	$00

; FM1 Data
music92_FM1:
	smpsAlterVol	$08
	smpsAlterPitch	$E8
	smpsPan		panRight,	$00
	smpsFMvoice	$02
	smpsCall	music92_Call01
	smpsAlterPitch	$18
	smpsPan		panCentre,	$00
	smpsAlterVol	$F8
	smpsFMvoice	$03
music92_Loop01:
	dc.b		nE2,	$06,	nE3,	nAb1,	$0C,	nA1,	nBb1,	nG2
	dc.b		$06,	nG3,	nCs2,	$0C,	nD2,	nEb2,	nE2,	$06
	dc.b		nE3,	nAb1,	$0C,	nA1,	nBb1,	nG2,	$06,	nG3
	dc.b		nCs2,	$0C,	nD2,	nEb2,	nE2,	$06,	nE3,	nAb1
	dc.b		$0C,	nA1,	nBb1,	nG2,	$06,	nG3,	nCs2,	$0C
	dc.b		nD2,	nEb2,	nE2,	$06,	nE3,	nAb1,	$0C,	nA1
	dc.b		nBb1,	nB1,	$06,	nB2,	nCs2,	$0C,	nD2,	nEb2
	smpsLoop	$00,	$07,	music92_Loop01
	smpsJump	music92_Loop01

; FM2 Data
music92_FM2:
	smpsFMvoice	$06
	smpsAlterVol	$0A
	smpsAlterPitch	$F4
	smpsPan		panLeft,	$00
	smpsModSet	$06,	$01,	$02,	$04
	smpsCall	music92_Call01
	dc.b		nAb5,	$06,	nRst,	$30,	nRst,	$2A
	smpsAlterPitch	$0C
	smpsAlterVol	$F6
	smpsPan		panCentre,	$00
	dc.b		nRst,	$30,	$30
	smpsFMvoice	$05
	dc.b		nG4,	$12,	nAb4,	nA4,	$0C,	nBb4,	$12,	nB4
	dc.b		nC5,	$0C,	nB4,	$12,	nC5,	nCs5,	$0C,	nC5
	dc.b		$12,	nCs5,	nD5,	$0C
	smpsAlterVol	$02
music92_Loop02:
	smpsFMvoice	$00
	smpsPan		panCentre,	$00
	smpsModSet	$01,	$01,	$08,	$04
	dc.b		nE5,	$18,	nAb5,	$0C,	nB5,	$18,	nA5,	nAb5
	dc.b		$0C,	smpsNoAttack,	nAb5,	nFs5,	$18,	nE5,	nAb5,	$0C
	smpsModSet	$18,	$01,	$10,	$04
	dc.b		nFs5,	nE5,	nD5,	$30,	smpsNoAttack,	$30
	smpsModSet	$01,	$01,	$08,	$04
	dc.b		nRst,	$30,	nRst,	nE5,	$18,	nAb5,	$0C,	nB5
	dc.b		$18,	nA5,	nAb5,	$0C,	smpsNoAttack,	nAb5,	nFs5,	$18
	dc.b		nE5,	nAb5,	$0C
	smpsModSet	$18,	$01,	$10,	$04
	dc.b		nFs5,	nE5,	nD6,	$30,	smpsNoAttack,	$30,	nRst,	$30
	dc.b		nRst
	smpsLoop	$00,	$02,	music92_Loop02
	smpsAlterVol	$FE
	smpsPan		panRight,	$00
music92_Loop03:
	smpsFMvoice	$05
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nE5,	$0C,	nRst,	nE5,	nRst,	nB4,	$06,	nRst
	dc.b		nB4,	nRst,	nCs5,	nB4,	$12,	nAb4,	$18,	nRst
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nE5,	$06,	nRst,	nE5,	nRst,	nCs5,	nE5,	$12
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nAb4,	$18,	nRst
	smpsLoop	$00,	$02,	music92_Loop03
	smpsAlterVol	$02
	smpsJump	music92_Loop02

music92_Call01:
	dc.b		nE5,	$06
	smpsAlterVol	$10
	dc.b		$06,	nRst,	$0C
	smpsAlterVol	$F0
	dc.b		nAb5,	$08,	nE5,	nAb5,	nB5,	$06
	smpsAlterVol	$10
	dc.b		$06,	nRst,	$0C
	smpsAlterVol	$F0
	dc.b		nA5,	$06
	smpsAlterVol	$10
	dc.b		$06,	nRst,	$0C
	smpsAlterVol	$F0
	dc.b		nAb5,	$24,	nFs5,	$06
	smpsAlterVol	$10
	dc.b		$06
	smpsAlterVol	$F0
	dc.b		nE5
	smpsAlterVol	$10
	dc.b		$06,	nRst,	$0C
	smpsAlterVol	$F0
	dc.b		nEb5,	$18,	smpsNoAttack,	$30,	smpsNoAttack,	$24,	nRst,	$0C
	smpsReturn

; FM3 Data
music92_FM3:
	smpsFMvoice	$02
	smpsAlterNote	$F8
	smpsPan		panLeft,	$00
	smpsCall	music92_Call01
	smpsPan		panCentre,	$00
	smpsFMvoice	$05
	smpsAlterNote	$00
	dc.b		nAb5,	$06,	nRst,	$30,	nRst,	$2A,	nRst,	$30
	dc.b		nRst,	nG4,	$12,	nAb4,	nA4,	$0C,	nBb4,	$12
	dc.b		nB4,	nC5,	$0C,	nB4,	$12,	nC5,	nCs5,	$0C
	dc.b		nC5,	$12,	nCs5,	nD5,	$0C
music92_Loop05:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
music92_Loop04:
	smpsPan		panRight,	$00
	dc.b		nAb4,	$06,	nRst,	$0C,	nAb4,	$06,	nRst,	$0C
	dc.b		nAb4,	$06,	nRst,	nFs4,	$12,	nAb4,	$06,	nRst
	dc.b		$18
	smpsLoop	$01,	$02,	music92_Loop04
	smpsPan		panCentre,	$00
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nAb4,	$06,	nRst
	dc.b		$0C,	$06,	nRst,	$0C,	nAb4,	$06,	nRst,	nAb4
	dc.b		nRst,	$0C,	$06,	nRst,	$0C,	nAb4,	$06,	nRst
	dc.b		nAb4,	nRst,	$0C,	$06,	nRst,	$0C,	nAb4,	$06
	dc.b		nRst,	nAb4,	nRst,	$2A
	smpsLoop	$00,	$02,	music92_Loop05
	smpsPan		panLeft,	$00
	smpsAlterNote	$FE
	smpsAlterVol	$F8
music92_Loop06:
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nE5,	$0C,	nRst,	nE5,	nRst,	nB4,	$06,	nRst
	dc.b		nB4,	nRst,	nCs5,	nB4,	$12,	nAb4,	$18,	nRst
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nE5,	$06,	nRst,	nE5,	nRst,	nCs5,	nE5,	$12
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nCs5,	nB4,	$12
	dc.b		nAb4,	$18,	nRst
	smpsLoop	$00,	$02,	music92_Loop06
	smpsAlterNote	$00
	smpsAlterVol	$08
	smpsJump	music92_Loop05

; FM4 Data
music92_FM4:
	smpsFMvoice	$06
	smpsAlterNote	$08
	smpsPan		panRight,	$00
	smpsCall	music92_Call01
	smpsPan		panCentre,	$00
	smpsFMvoice	$05
	smpsAlterNote	$00
	dc.b		nE5,	$06,	nRst,	$30,	nRst,	$2A,	nRst,	$30
	dc.b		nRst,	nEb4,	$12,	nE4,	nF4,	$0C,	nFs4,	$12
	dc.b		nG4,	nAb4,	$0C,	nG4,	$12,	nAb4,	nA4,	$0C
	dc.b		nAb4,	$12,	nA4,	nBb4,	$0C
music92_Loop08:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
music92_Loop07:
	dc.b		nE4,	$06,	nRst,	$0C,	nE4,	$06,	nRst,	$0C
	dc.b		nE4,	$06,	nRst,	nD4,	$12,	nE4,	$06,	nRst
	dc.b		$18
	smpsLoop	$01,	$02,	music92_Loop07
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nE4,	$06,	nRst
	dc.b		$0C,	$06,	nRst,	$0C,	nE4,	$06,	nRst,	nE4
	dc.b		nRst,	$0C,	$06,	nRst,	$0C,	nE4,	$06,	nRst
	dc.b		nE4,	nRst,	$0C,	$06,	nRst,	$0C,	nE4,	$06
	dc.b		nRst,	nE4,	nRst,	$2A
	smpsLoop	$00,	$02,	music92_Loop08
music92_Loop09:
	dc.b		nAb4,	$06,	nRst,	nAb4,	nRst,	nA4,	nAb4,	$12
	dc.b		nB4,	$0C,	nRst,	nB4,	nRst,	nAb4,	$06,	nRst
	dc.b		nAb4,	nRst,	nA4,	nAb4,	$12,	nE4,	$18,	nRst
	dc.b		nAb4,	$06,	nRst,	nAb4,	nRst,	nA4,	nAb4,	$12
	dc.b		nB4,	$06,	nRst,	nB4,	nRst,	nA4,	nB4,	$12
	dc.b		nAb4,	$06,	nRst,	nAb4,	nRst,	nA4,	nAb4,	$12
	dc.b		nE4,	$18,	nRst
	smpsLoop	$00,	$02,	music92_Loop09
	smpsJump	music92_Loop08

; FM5 Data
music92_FM5:
	smpsAlterPitch	$F4
	smpsPan		panCentre,	$00
	smpsFMvoice	$06
	smpsAlterNote	$FA
	smpsCall	music92_Call01
	smpsAlterPitch	$0C
	smpsFMvoice	$01
	smpsModSet	$06,	$01,	$02,	$03
music92_Loop0A:
	smpsPan		panCentre,	$00
	dc.b		nAb5,	$0C,	nE5
	smpsPan		panLeft,	$00
	dc.b		nFs5,	nD5,	$06
	smpsPan		panCentre,	$00
	dc.b		nAb5,	$0C,	$06
	smpsPan		panRight,	$00
	dc.b		nE5,	$0C,	nFs5
	smpsPan		panCentre,	$00
	dc.b		nD5
	smpsLoop	$00,	$1C,	music92_Loop0A
	smpsJump	music92_Loop0A

; PSG1 Data
music92_PSG1:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
music92_Loop0B:
	dc.b		nE5,	$18,	nAb5,	$0C,	nB5,	$18,	nA5,	nAb5
	dc.b		$0C,	smpsNoAttack,	nAb5,	nFs5,	$18,	nE5,	nAb5,	$0C
	dc.b		nFs5,	nE5,	nD5,	$30,	smpsNoAttack,	$30,	nRst,	$30
	dc.b		nRst,	nE5,	$18,	nAb5,	$0C,	nB5,	$18,	nA5
	dc.b		nAb5,	$0C,	smpsNoAttack,	nAb5,	nFs5,	$18,	nE5,	nAb5
	dc.b		$0C,	nFs5,	nE5,	nD6,	$30,	smpsNoAttack,	$30,	nRst
	dc.b		$30,	nRst
	smpsLoop	$00,	$02,	music92_Loop0B
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst
	smpsSetVol	$FF
	smpsAlterPitch	$F4
	dc.b		nB6,	$06,	nRst,	nB6,	nRst,	nCs7,	nB6,	$12
	dc.b		nE7,	$0C,	nRst,	nE7,	nRst,	nB6,	$06,	nRst
	dc.b		nB6,	nRst,	nCs7,	nB6,	$12,	nAb6,	$18,	nRst
	dc.b		nB6,	$06,	nRst,	nB6,	nRst,	nCs7,	nB6,	$12
	dc.b		nE7,	$06,	nRst,	nE7,	nRst,	nCs7,	nE7,	$12
	dc.b		nB6,	$06,	nRst,	nB6,	nRst,	nCs7,	nB6,	$12
	dc.b		nAb6,	$18,	nRst
	smpsAlterPitch	$0C
	smpsSetVol	$01
	smpsJump	music92_Loop0B

; PSG2 Data
music92_PSG2:
	smpsAlterNote	$FF
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
music92_Jump01:
	dc.b		nRst,	$12,	nE5,	$18,	nAb5,	$0C,	nB5,	$18
	dc.b		nA5,	nAb5,	$0C,	smpsNoAttack,	nAb5,	nFs5,	$18,	nE5
	dc.b		nAb5,	$0C,	nFs5,	nE5,	nD5,	$30,	smpsNoAttack,	$30
	dc.b		nRst,	$30,	nRst,	nE5,	$18,	nAb5,	$0C,	nB5
	dc.b		$18,	nA5,	nAb5,	$0C,	smpsNoAttack,	nAb5,	nFs5,	$18
	dc.b		nE5,	nAb5,	$0C,	nFs5,	nE5,	nD6,	$30,	smpsNoAttack
	dc.b		$30,	nRst,	$30,	nRst,	$1E
	smpsSetVol	$FC
	dc.b		nAb5,	$18,	nB5,	$0C,	nEb6,	$18,	nCs6,	nB5
	dc.b		$0C,	smpsNoAttack,	nB5,	nA5,	$18,	nAb5,	nB5,	$0C
	dc.b		nA5,	nAb5,	nFs5,	$30,	smpsNoAttack,	$30,	nRst,	$30
	dc.b		nRst,	nAb5,	$18,	nB5,	$0C,	nEb6,	$18,	nCs6
	dc.b		nB5,	$0C,	smpsNoAttack,	nB5,	nA5,	$18,	nAb5,	nB5
	dc.b		$0C,	nA5,	nAb5,	nFs6,	$30,	smpsNoAttack,	$30,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst,	nRst
	smpsAlterPitch	$E8
	dc.b		nAb6,	$06,	nRst,	nAb6,	nRst,	nA6,	nAb6,	$12
	dc.b		nB6,	$0C,	nRst,	nB6,	nRst,	nAb6,	$06,	nRst
	dc.b		nAb6,	nRst,	nA6,	nAb6,	$12,	nE6,	$18,	nRst
	dc.b		nAb6,	$06,	nRst,	nAb6,	nRst,	nA6,	nAb6,	$12
	dc.b		nB6,	$06,	nRst,	nB6,	nRst,	nA6,	nB6,	$12
	dc.b		nAb6,	$06,	nRst,	nAb6,	nRst,	nA6,	nAb6,	$12
	dc.b		nE6,	$18,	nRst
	smpsSetVol	$04
	smpsAlterPitch	$18
	smpsJump	music92_Jump01

; DAC Data
music92_DAC:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst
music92_Loop0C:
	dc.b		dKick,	$18,	dKick,	dKick,	dKick,	$0C,	dSnare
	smpsLoop	$00,	$03,	music92_Loop0C
	dc.b		dKick,	$18,	dKick,	dKick,	dKick,	$0C,	dSnare,	$06
	dc.b		dKick
music92_Loop0D:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dKick
	dc.b		dSnare,	dKick,	dSnare,	$12,	dSnare,	dKick,	$0C,	dSnare
	dc.b		$18,	dKick,	$0C,	dKick,	dSnare,	$12,	dSnare,	dKick
	dc.b		$0C,	dSnare,	dKick,	$06,	dKick
	smpsLoop	$00,	$04,	music92_Loop0D
music92_Loop0E:
	dc.b		dKick,	$18,	dSnare,	$12,	$06,	dKick,	$18,	dSnare
	dc.b		dKick,	dSnare,	$12,	dSnare,	dKick,	$0C,	dSnare,	$18
	dc.b		dKick,	dSnare,	$12,	$06,	dKick,	$18,	dSnare,	dKick
	dc.b		dSnare,	$12,	dSnare,	dKick,	$0C,	dSnare,	$18
	smpsLoop	$00,	$02,	music92_Loop0E
	smpsJump	music92_Loop0D

; PSG3 Data
music92_PSG3:
	smpsPSGform	$E7
	smpsPSGvoice	$04
	smpsNoteFill	$03
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst
music92_Loop0F:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
	dc.b		nA5,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
	smpsLoop	$00,	$03,	music92_Loop0F
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
	dc.b		nA5,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
music92_Loop10:
	dc.b		nA5,	$12,	nA5,	$06,	nA5,	nA5,	nA5,	nA5
	dc.b		$0C,	$06,	$0C,	$06,	$0C,	$06,	$0C,	nA5
	dc.b		$06,	nA5,	nA5,	$0C,	$06,	$0C,	$06,	$0C
	dc.b		$06,	$0C,	$06,	$0C,	nA5,	nA5,	nA5,	nA5
	dc.b		$24,	nA5,	$0C,	nA5,	$06,	nA5,	nA5,	$0C
	dc.b		nA5,	nA5,	nA5,	$18,	nA5,	$0C,	nA5
	smpsLoop	$00,	$04,	music92_Loop10
music92_Loop11:
	dc.b		nA5,	$18,	$06,	nA5,	$0C,	nA5,	nA5,	$06
	dc.b		nA5,	$0C,	nA5,	nA5
	smpsLoop	$00,	$04,	music92_Loop11
music92_Loop12:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
	dc.b		nA5,	$06,	nA5,	nA5,	nA5,	$0C,	nA5
	smpsLoop	$00,	$04,	music92_Loop12
	smpsJump	music92_Loop10

music92_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b		$74;			Voice 07
	even
