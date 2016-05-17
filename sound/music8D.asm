; =============================================================================================
; Project Name:		music8D
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8D_Header:
	smpsHeaderVoice	music8D_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$03

	smpsHeaderDAC	music8D_DAC
	smpsHeaderFM	music8D_FM1,	smpsPitch01lo,	$12
	smpsHeaderFM	music8D_FM2,	smpsPitch01lo,	$0A
	smpsHeaderFM	music8D_FM3,	smpsPitch01lo,	$0D
	smpsHeaderFM	music8D_FM4,	smpsPitch01lo,	$13
	smpsHeaderFM	music8D_FM5,	smpsPitch03lo,	$24
	smpsHeaderPSG	music8D_PSG1,	smpsPitch01lo,	$0C,	$00
	smpsHeaderPSG	music8D_PSG2,	smpsPitch00+$07,	$09,	$00
	smpsHeaderPSG	music8D_PSG3,	smpsPitch00,	$04,	$04

; FM4 Data
music8D_FM4:
	smpsFMvoice	$01
music8D_Loop01:
	smpsCall	music8D_Call01
	smpsLoop	$00,	$02,	music8D_Loop01
music8D_Jump01:
	smpsPan		panRight,	$00
	smpsAlterNote	$FE
	smpsAlterVol	$14
	smpsAlterPitch	$E8
	smpsFMvoice	$01
	smpsCall	music8D_Call02
	smpsFMvoice	$01
	smpsAlterPitch	$18
	smpsAlterVol	$EC
	smpsAlterNote	$00
	smpsPan		panCentre,	$00
music8D_Loop02:
	smpsCall	music8D_Call01
	smpsLoop	$00,	$08,	music8D_Loop02
	smpsJump	music8D_Jump01

music8D_Call01:
	dc.b		nB6,	$06,	nG6,	nA6,	nD6,	nB6,	nG6,	nA6
	dc.b		nD6
	smpsReturn

; FM5 Data
music8D_FM5:
	smpsFMvoice	$01
	dc.b		nRst,	$60
music8D_Jump02:
	smpsPan		panLeft,	$00
	smpsAlterNote	$02
	smpsCall	music8D_Call02
	smpsAlterNote	$00
	smpsPan		panCentre,	$00
	smpsAlterVol	$FB
	smpsCall	music8D_Call03
	dc.b		nD6,	$03,	$03,	$06,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	nRst,	$12,	nC6,	$06,	nD6
	smpsAlterVol	$FA
	smpsCall	music8D_Call03
	dc.b		nD6,	$30
	smpsAlterVol	$05
	smpsJump	music8D_Jump02

music8D_Call02:
	dc.b		nG6,	$30,	nD6
	smpsLoop	$00,	$04,	music8D_Call02
	smpsReturn

music8D_Call03:
	dc.b		nG6,	$03,	$03,	$06,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	nRst,	$1E
	smpsAlterVol	$FA
	dc.b		nD6,	$03,	$03,	$06,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	nRst,	$1E
	smpsAlterVol	$FA
	dc.b		nC6,	$03,	$03,	$06,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	smpsNoAttack
	smpsAlterVol	$02
	dc.b		$02,	nRst,	$1E
	smpsAlterVol	$FA
	smpsReturn

; FM1 Data
music8D_FM1:
	smpsFMvoice	$01
	dc.b		nRst,	$06,	nG4,	$03,	nA4,	nG4,	$0C,	nB4
	dc.b		$03,	nC5,	nB4,	$0C,	nD5,	$03,	nE5,	nD5
	dc.b		$30
music8D_Jump03:
	dc.b		nRst,	$12,	nE6,	$03,	nFs6,	nG6,	$06,	nFs6
	dc.b		nE6,	nD6,	nB5,	$30,	nRst,	$12,	nE6,	$03
	dc.b		nG6,	nA6,	$06,	nG6,	nFs6,	nE6,	nD6,	$03
	dc.b		nE6,	nD6,	nB5,	$27,	nRst,	$12,	nE6,	$03
	dc.b		nG6,	nFs6,	$06,	nD6,	nB5,	nE6,	nD6,	$30
	dc.b		nRst,	$12,	nE6,	$03,	nG6,	nA6,	$06,	nG6
	dc.b		nFs6,	nE6,	nD6,	$03,	nE6,	nD6,	nB5,	$27
	smpsFMvoice	$01
	smpsCall	music8D_Call04
	dc.b		nB4,	$0C,	nG4,	nA4,	nG4,	$06,	nA4
	smpsCall	music8D_Call04
	dc.b		nB4,	$30
	smpsJump	music8D_Jump03

music8D_Call04:
	dc.b		nB4,	$0C,	nG4,	nA4,	nD4
	smpsLoop	$00,	$03,	music8D_Call04
	smpsReturn

; FM3 Data
music8D_FM3:
	smpsAlterNote	$02
	smpsFMvoice	$01
	dc.b		nRst,	$06,	nB4,	$03,	nC5,	nB4,	$0C,	nD5
	dc.b		$03,	nE5,	nD5,	$0C,	nG5,	$03,	nA5,	nG5
	dc.b		$30
music8D_Jump04:
	smpsFMvoice	$01
	smpsAlterVol	$12
	dc.b		nRst,	$12,	nE6,	$03,	nFs6,	nG6,	$06,	nFs6
	dc.b		nE6,	nD6,	nB5,	$18
	smpsFMvoice	$01
	smpsAlterVol	$EE
	smpsNoteFill	$0B
	dc.b		nG5,	$06,	nD5,	nE5,	$03,	nG5,	$06
	smpsNoteFill	$00
	dc.b		$15
	smpsFMvoice	$01
	smpsAlterVol	$12
	dc.b		nE6,	$03,	nG6,	nA6,	$06,	nG6,	nFs6,	nE6
	dc.b		nD6,	$03,	nE6,	nD6,	nB5,	$0F
	smpsFMvoice	$01
	smpsAlterVol	$EE
	dc.b		nA5,	$0C,	nB5,	nG5,	$12
	smpsFMvoice	$01
	smpsAlterVol	$12
	dc.b		nE6,	$03,	nG6,	nFs6,	$06,	nD6,	nB5,	nE6
	dc.b		nD6,	$18
	smpsFMvoice	$01
	smpsAlterVol	$EE
	smpsNoteFill	$0B
	dc.b		nG5,	$06,	nD5,	nE5,	$03,	nG5,	$06
	smpsNoteFill	$00
	dc.b		$15
	smpsFMvoice	$01
	smpsAlterVol	$12
	dc.b		nE6,	$03,	nG6,	nA6,	$06,	nG6,	nFs6,	nE6
	dc.b		nD6,	$03,	nE6
	smpsFMvoice	$01
	smpsAlterVol	$EE
	dc.b		nB4,	$03,	nC5,	nB4,	$0C,	nD5,	$03,	nE5
	dc.b		nD5,	$0C,	nG5,	$03,	nA5
	smpsAlterVol	$FC
	smpsCall	music8D_Call05
	dc.b		nG5,	$2A,	nA5,	$03,	nB5,	$33
	smpsCall	music8D_Call05
	dc.b		nG5,	$24,	nA5,	$0C,	nG5,	$30
	smpsAlterVol	$04
	smpsJump	music8D_Jump04

music8D_Call05:
	dc.b		nRst,	$12,	nG5,	$03,	nA5,	nB5,	$0C,	nC6
	dc.b		$03,	nB5,	nC6,	nD6,	$27,	nE6,	$0C
	smpsReturn

; FM2 Data
music8D_FM2:
	smpsFMvoice	$00
	dc.b		nRst,	$51,	nG3,	$03,	nA3,	$06,	nB3
music8D_Loop03:
	dc.b		nC4,	$03,	$0F,	$03,	$0C,	nG4,	$03,	nA4
	dc.b		$06,	nG4,	nG3,	$03,	$0F,	$0F,	nD4,	$03
	dc.b		nE4,	$06,	nD4
	smpsLoop	$00,	$04,	music8D_Loop03
	smpsCall	music8D_Call06
	dc.b		nA3,	$03,	$0F,	$0C,	$09,	$09,	nG3,	$03
	dc.b		$0F,	$0C,	$06,	nA3,	nB3
	smpsCall	music8D_Call06
	dc.b		nA3,	$03,	$0F,	$0C,	$06,	nB3,	nA3,	nG3
	dc.b		$30
	smpsJump	music8D_Loop03

music8D_Call06:
	dc.b		nC4,	$03,	$0F,	$0C,	$09,	$09,	nB3,	$03
	dc.b		nB3,	$0F,	$0C,	$06,	nC4,	nB3
	smpsReturn

; DAC Data
music8D_DAC:
	smpsCall	music8D_Call07
	smpsLoop	$00,	$02,	music8D_DAC
music8D_Loop04:
	smpsCall	music8D_Call07
	smpsLoop	$00,	$03,	music8D_Loop04
	smpsCall	music8D_Call08
	smpsLoop	$01,	$03,	music8D_Loop04
music8D_Loop05:
	smpsCall	music8D_Call07
	smpsLoop	$00,	$03,	music8D_Loop05
	dc.b		dKick,	$0C,	nRst,	nRst,	dSnare,	$06,	dSnare,	$03
	dc.b		dSnare
	smpsJump	music8D_Loop04

music8D_Call07:
	dc.b		dKick,	$03,	dKick,	nRst,	$06,	dSnare,	dKick,	nRst
	dc.b		dKick,	dSnare,	$03,	dKick,	$09
	smpsReturn

music8D_Call08:
	dc.b		dKick,	$03,	dKick,	nRst,	$06,	dSnare,	dKick,	nRst
	dc.b		dKick,	dSnare,	dSnare,	$03,	dSnare
	smpsReturn

; PSG1 Data
music8D_PSG1:
	dc.b		nRst,	$60
music8D_Loop06:
	dc.b		nG4,	$30,	nFs4
	smpsLoop	$00,	$04,	music8D_Loop06
	smpsAlterVol	$FE
	dc.b		nG4,	$03,	$03,	$06,	nRst,	$24,	nFs4,	$03
	dc.b		$03,	$06,	nRst,	$24,	nE4,	$03,	$03,	$06
	dc.b		nRst,	$24,	nD4,	$03,	$03,	$06,	nRst,	$18
	dc.b		nE4,	$06,	nFs4,	nG4,	$03,	$03,	$06,	nRst
	dc.b		$24,	nFs4,	$03,	$03,	$06,	nRst,	$24,	nE4
	dc.b		$03,	$03,	$06,	nRst,	$24,	nFs4,	$30
	smpsAlterVol	$02
	smpsJump	music8D_Loop06

; PSG2 Data
music8D_PSG2:
	dc.b		nRst,	$60
	smpsPSGvoice	$08
music8D_Jump05:
	dc.b		nRst,	$12,	nD6,	$03,	nD6,	nD6,	$06,	nD6
	dc.b		nD6,	nD6,	nD6,	$30,	nRst,	$12,	nD6,	$03
	dc.b		nD6,	nD6,	$06,	nD6,	nD6,	nD6,	nD6,	$03
	dc.b		nD6,	nD6,	nD6,	$27,	nRst,	$12,	nD6,	$03
	dc.b		nD6,	nD6,	$06,	nD6,	nD6,	nD6,	nD6,	$30
	dc.b		nRst,	$12,	nD6,	$03,	nD6,	nD6,	$06,	nD6
	dc.b		nD6,	nD6,	nD6,	$03,	nD6,	nD6,	nD6,	$27
	smpsAlterVol	$01
	dc.b		nB4,	$03,	$03,	$06,	nRst,	$24,	nA4,	$03
	dc.b		$03,	$06,	nRst,	$24,	nG4,	$03,	$03,	$06
	dc.b		nRst,	$24,	nFs4,	$03,	$03,	$06,	nRst,	$18
	dc.b		nG4,	$06,	nA4,	nB4,	$03,	$03,	$06,	nRst
	dc.b		$24,	nA4,	$03,	$03,	$06,	nRst,	$24,	nG4
	dc.b		$03,	$03,	$06,	nRst,	$24,	nD4,	$30
	smpsAlterVol	$FF
	smpsJump	music8D_Jump05

; PSG3 Data
music8D_PSG3:
	smpsPSGform	$E7
	smpsNoteFill	$09
music8D_Jump06:
	dc.b		nA5,	$0C
	smpsJump	music8D_Jump06

music8D_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80

	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
