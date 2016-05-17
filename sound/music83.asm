; =============================================================================================
; Project Name:		music83
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music83_Header:
	smpsHeaderVoice	music83_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$09

	smpsHeaderDAC	music83_DAC
	smpsHeaderFM	music83_FM1,	smpsPitch00,	$10
	smpsHeaderFM	music83_FM2,	smpsPitch02hi,	$0A
	smpsHeaderFM	music83_FM3,	smpsPitch00,	$12
	smpsHeaderFM	music83_FM4,	smpsPitch00,	$18
	smpsHeaderFM	music83_FM5,	smpsPitch00,	$18
	smpsHeaderPSG	music83_PSG1,	smpsPitch03lo,	$05,	$00
	smpsHeaderPSG	music83_PSG2,	smpsPitch02lo,	$04,	$04
	smpsHeaderPSG	music83_PSG3,	smpsPitch03lo,	$04,	$00

music83_Call01:
	dc.b		nG4,	$08,	nA4,	nB4
	smpsReturn

music83_Call02:
	dc.b		nF4,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	nF4,	nRst,	$18
	dc.b		nG4,	$08,	nA4,	nB4,	nF4,	$30,	smpsNoAttack,	$30
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$24
	smpsReturn

music83_Call04:
	dc.b		nRst,	$30,	nRst,	nB4,	$06,	nC5,	nB4,	nG4
	dc.b		nA4,	nF4,	$0C,	nG4,	nD4,	nD4,	$06,	nF4
	dc.b		$0C,	nG4
	smpsReturn

music83_Call03:
	dc.b		nB4,	$30,	smpsNoAttack,	$30,	nC5,	$30,	smpsNoAttack,	$24
	dc.b		nB4,	$06,	nC5,	nD5,	$30,	smpsNoAttack,	$30,	nB4
	dc.b		$30,	smpsNoAttack,	$30,	nB4,	$30,	smpsNoAttack,	$30,	nC5
	dc.b		$30,	smpsNoAttack,	$24,	nB4,	$06,	nC5,	nD5,	$30
	dc.b		smpsNoAttack,	$30,	nF5,	$30,	smpsNoAttack,	$30,	nG5,	$24
	dc.b		nF5,	nE5,	$18,	nF5,	$24,	nE5,	nC5,	$18
	smpsReturn

; FM2 Data
music83_FM2:
	dc.b		nRst,	$18
	smpsFMvoice	$00
music83_Jump01:
	dc.b		nG1,	$0C,	nD1,	nF1,	nD1,	$06,	nG1,	$05
	dc.b		nG1,	$07,	$06,	nD1,	$0C,	nF1,	nD1
	smpsJump	music83_Jump01

; FM1 Data
music83_FM1:
	smpsFMvoice	$02
	smpsAlterVol	$12
	smpsCall	music83_Call01
music83_Jump02:
	smpsCall	music83_Call02
	smpsModSet	$24,	$01,	$03,	$04
	dc.b		nRst,	$0C
	smpsAlterVol	$E6
	smpsFMvoice	$03
	smpsCall	music83_Call03
	dc.b		$24,	nB4,	nD5,	$18,	smpsNoAttack,	$30,	smpsNoAttack,	$30
	dc.b		nB5,	$24,	nA5,	nG5,	$18,	nA5,	$24,	nG5
	dc.b		nE5,	$18,	nE5,	nF5,	$0C,	nD5,	$30,	smpsNoAttack
	dc.b		$0C,	smpsNoAttack,	$30,	smpsNoAttack,	$24,	nRst,	$0C,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	nC5,	$24,	nE5,	nG5
	dc.b		$18,	nF5,	$24,	nD5,	nB4,	$18,	nB4,	nC5
	dc.b		$0C,	nB4,	$30,	smpsNoAttack,	$0C,	smpsNoAttack,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18,	nC5,	$24,	nE5,	nG5,	$18
	dc.b		nF5,	$24,	nD5,	nB4,	$18,	nB5,	$30,	smpsNoAttack
	dc.b		$30,	smpsNoAttack,	$30,	smpsNoAttack,	$0C,	nRst,	$0C,	smpsModOff
	smpsAlterVol	$1A
	smpsFMvoice	$02
	dc.b		nE4,	$08,	nF4,	nG4
	smpsJump	music83_Jump02

; PSG1 Data
music83_PSG1:
	smpsAlterNote	$02
	dc.b		nRst,	$1B
music83_Jump03:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst
	smpsCall	music83_Call03
	dc.b		$24,	nB4,	nD5,	$18,	smpsNoAttack,	$30,	smpsNoAttack,	$30
	dc.b		nB5,	$24,	nA5,	nG5,	$18,	nA5,	$24,	nG5
	dc.b		nE5,	$18,	nE5,	nF5,	$0C,	nD5,	$30,	smpsNoAttack
	dc.b		$0C,	smpsNoAttack,	$30,	smpsNoAttack,	$24,	nRst,	$0C,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	nC5,	$24,	nE5,	nG5
	dc.b		$18,	nF5,	$24,	nD5,	nB4,	$18,	nB4,	nC5
	dc.b		$0C,	nB4,	$30,	smpsNoAttack,	$0C,	smpsNoAttack,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18,	nC5,	$24,	nE5,	nG5,	$18
	dc.b		nF5,	$24,	nD5,	nB4,	$18,	nB5,	$30,	smpsNoAttack
	dc.b		$30,	smpsNoAttack,	$30,	smpsNoAttack,	$0C,	nRst,	$24
	smpsJump	music83_Jump03

; PSG3 Data
music83_PSG3:
	dc.b		nRst,	$18
music83_Jump04:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		nRst
	smpsCall	music83_Call03
	dc.b		$24,	nB4,	nD5,	$18,	smpsNoAttack,	$30,	smpsNoAttack,	$30
	smpsAlterVol	$FE
	dc.b		nG5,	$24,	nF5,	nE5,	$18,	nF5,	$24,	nE5
	dc.b		nC5,	$18,	nC5,	nD5,	$0C,	nB4,	$30,	smpsNoAttack
	dc.b		$0C,	smpsNoAttack,	$30,	smpsNoAttack,	$24,	nRst,	$0C,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	nA4,	$24,	nC5,	nE5
	dc.b		$18,	nD5,	$24,	nB4,	nG4,	$18,	nF4,	nD4
	dc.b		$0C,	nG4,	$30,	smpsNoAttack,	$0C,	smpsNoAttack,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18,	nA4,	$24,	nC5,	nE5,	$18
	dc.b		nD5,	$24,	nB4,	nG4,	$18,	nG5,	$30,	smpsNoAttack
	dc.b		$30,	smpsNoAttack,	$30,	smpsNoAttack,	$0C,	nRst,	$24
	smpsAlterVol	$02
	smpsJump	music83_Jump04

; FM4 Data
music83_FM4:
	smpsFMvoice	$02
	smpsAlterNote	$02
	smpsPan		panLeft,	$00
	smpsCall	music83_Call01
music83_Jump05:
	smpsCall	music83_Call02
	smpsAlterNote	$00
	smpsFMvoice	$01
	smpsAlterVol	$F2
	smpsAlterPitch	$F4
	dc.b		nA3,	$0C,	nB3,	$06,	nRst,	$30,	nRst,	$2A
	dc.b		nRst,	$30,	nRst,	$24,	nC4,	$0C,	nB3,	$06
	dc.b		nRst,	$30,	nRst,	$2A,	nRst,	$30,	nRst,	$24
	dc.b		nA3,	$0C,	nB3,	$06,	nRst,	$30,	nRst,	$2A
	dc.b		nRst,	$30,	nRst,	$24,	nC4,	$0C,	nB3,	$06
	dc.b		nRst,	$30,	nRst,	$2A,	nRst,	$30,	nRst,	nRst
	dc.b		nRst,	nG4,	$24,	nF4,	nE4,	$18,	nF4,	$24
	dc.b		nE4,	nC4,	$18,	$24,	nB3,	nD4,	$18,	smpsNoAttack
	dc.b		$30,	smpsNoAttack,	$30,	nB4,	$24,	nA4,	nG4,	$18
	dc.b		nA4,	$24,	nG4,	nE4,	$18,	nE4,	nF4,	$0C
	dc.b		nD4,	$24
	smpsAlterVol	$0E
	smpsAlterPitch	$0C
	smpsFMvoice	$02
	smpsCall	music83_Call01
	dc.b		nF4,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$18
	dc.b		nRst,	$18
	smpsAlterVol	$F2
	smpsAlterPitch	$F4
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	$24,	nG4,	$06
	dc.b		nF4,	nG4,	$0C,	nG4,	nF4,	$06,	nG4,	$0C
	dc.b		$06,	nRst,	$24,	$06,	nF4,	nG4,	$0C,	nG4
	dc.b		nF4,	$06,	nG4,	$0C,	$06,	nRst,	$30,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	$24,	$06,	nF4,	nG4
	dc.b		$0C,	nG4,	nF4,	$06,	nG4,	$0C,	$06,	nRst
	dc.b		$24,	$06,	nF4,	nG4,	$0C,	nG4,	nF4,	$06
	dc.b		nG4,	$0C,	$06,	nRst,	$18
	smpsAlterVol	$0E
	smpsAlterPitch	$0C
	smpsFMvoice	$02
	smpsCall	music83_Call01
	smpsJump	music83_Jump05

; FM5 Data
music83_FM5:
	dc.b		nRst,	$01
	smpsFMvoice	$02
	smpsAlterNote	$FE
	smpsPan		panRight,	$00
	smpsCall	music83_Call01
music83_Jump06:
	smpsCall	music83_Call02
	smpsAlterNote	$FA
	smpsAlterVol	$F2
	smpsAlterPitch	$F4
	smpsFMvoice	$01
	dc.b		nF3,	$0B,	nG3,	$06,	nRst,	$30,	nRst,	$2A
	dc.b		nRst,	$30,	nRst,	$24,	nA3,	$0C,	nG3,	$06
	dc.b		nRst,	$30,	nRst,	$2A,	nRst,	$30,	nRst,	$24
	dc.b		nF3,	$0C,	nG3,	$06,	nRst,	$30,	nRst,	$2A
	dc.b		nRst,	$30,	nRst,	$24,	nA3,	$0C,	nG3,	$06
	dc.b		nRst,	$30,	nRst,	$2A,	nRst,	$30,	nRst,	nRst
	dc.b		nRst,	nG4,	$24,	nF4,	nE4,	$18,	nF4,	$24
	dc.b		nE4,	nC4,	$18,	$24,	nB3,	nD4,	$18,	smpsNoAttack
	dc.b		$30,	smpsNoAttack,	$30,	nG4,	$24,	nF4,	nE4,	$18
	dc.b		nF4,	$24,	nE4,	nC4,	$18,	nC4,	nD4,	$0C
	dc.b		nB3,	$24
	smpsAlterVol	$0E
	smpsAlterPitch	$0C
	smpsFMvoice	$02
	smpsCall	music83_Call01
	dc.b		nF4,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$18
	dc.b		nRst,	$18
	smpsAlterVol	$F2
	smpsAlterPitch	$F4
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$30,	nRst,	$30,	nRst,	$24
	dc.b		nD4,	$06,	nC4,	nD4,	$0C,	nD4,	nC4,	$06
	dc.b		nD4,	$0C,	$06,	nRst,	$24,	$06,	nC4,	nD4
	dc.b		$0C,	nD4,	nC4,	$06,	nD4,	$0C,	$06,	nRst
	dc.b		$30,	nRst,	$30,	nRst,	nRst,	nRst,	$24,	$06
	dc.b		nC4,	nD4,	$0C,	nD4,	nC4,	$06,	nD4,	$0C
	dc.b		$06,	nRst,	$24,	$06,	nC4,	nD4,	$0C,	nD4
	dc.b		nD4,	$06,	nC4,	$0C,	$06,	nRst,	$19
	smpsAlterVol	$0E
	smpsAlterPitch	$0C
	smpsFMvoice	$02
	smpsCall	music83_Call01
	smpsJump	music83_Jump06

; FM3 Data
music83_FM3:
	smpsFMvoice	$04
	dc.b		nRst,	$18
music83_Jump07:
	smpsAlterVol	$FC
	smpsCall	music83_Call04
	smpsCall	music83_Call04
	smpsAlterVol	$04
music83_Loop01:
	dc.b		nB4,	$0C,	nB4,	nB4,	$06,	nRst,	$12,	nA4
	dc.b		$0C,	nA4,	nB4,	$06,	nRst,	$12,	$0C,	$06
	dc.b		nB4,	$0C,	nB4,	nB4,	$06,	nA4,	$0C,	nC5
	dc.b		nB4,	$06,	nRst,	$12
	smpsLoop	$00,	$09,	music83_Loop01
music83_Loop02:
	dc.b		nA4,	$0C,	nA4,	nA4,	$06,	nRst,	$12,	nG4
	dc.b		$0C,	nG4,	nA4,	$06,	nRst,	$12,	nG4,	$0C
	dc.b		$06,	nG4,	$0C,	nG4,	nG4,	$06,	nG4,	$0C
	dc.b		nE4,	nG4,	$06,	nRst,	$12,	nB4,	$0C,	nB4
	dc.b		nB4,	$06,	nRst,	$12,	nA4,	$0C,	nA4,	nB4
	dc.b		$06,	nRst,	$12,	$0C,	$06,	nB4,	$0C,	nB4
	dc.b		nB4,	$06,	nA4,	$0C,	nC5,	nB4,	$06,	nRst
	dc.b		$12
	smpsLoop	$00,	$02,	music83_Loop02
	smpsJump	music83_Jump07

; PSG2 Data
music83_PSG2:
	smpsNoteFill	$08
	dc.b		nRst,	$18
music83_Jump08:
	smpsCall	music83_Call04
	smpsCall	music83_Call04
music83_Loop03:
	dc.b		nG4,	$0C,	nG4,	nG4,	$06,	nRst,	$12,	nF4
	dc.b		$0C,	nF4,	nG4,	$06,	nRst,	$12,	$0C,	$06
	dc.b		nG4,	$0C,	nG4,	nG4,	$06,	nF4,	$0C,	nA4
	dc.b		nG4,	$06,	nRst,	$12
	smpsLoop	$00,	$09,	music83_Loop03
music83_Loop04:
	dc.b		nF4,	$0C,	nF4,	nF4,	$06,	nRst,	$12,	nE4
	dc.b		$0C,	nE4,	nF4,	$06,	nRst,	$12,	nE4,	$0C
	dc.b		$06,	nE4,	$0C,	nE4,	nE4,	$06,	nE4,	$0C
	dc.b		nC4,	nE4,	$06,	nRst,	$12,	nG4,	$0C,	nG4
	dc.b		nG4,	$06,	nRst,	$12,	nF4,	$0C,	nF4,	nG4
	dc.b		$06,	nRst,	$12,	$0C,	$06,	nG4,	$0C,	nG4
	dc.b		nG4,	$06,	nF4,	$0C,	nA4,	nG4,	$06,	nRst
	dc.b		$12
	smpsLoop	$00,	$02,	music83_Loop04
	smpsJump	music83_Jump08

; DAC Data
music83_DAC:
	dc.b		nRst,	$18
music83_Jump09:
	dc.b		dKick,	$0C,	$8F,	$06,	$90,	dSnare,	$0C,	$90
	dc.b		$06,	$91,	dKick,	$0C,	$8F,	$06,	$91,	dSnare
	dc.b		$0C,	$8F,	$06,	$91
	smpsJump	music83_Jump09

music83_Voices:
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
	even
