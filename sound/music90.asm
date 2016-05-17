; =============================================================================================
; Project Name:		music90
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music90_Header:
	smpsHeaderVoice	music90_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$07

	smpsHeaderDAC	music90_DAC
	smpsHeaderFM	music90_FM1,	smpsPitch00,	$0C
	smpsHeaderFM	music90_FM2,	smpsPitch01hi,	$10
	smpsHeaderFM	music90_FM3,	smpsPitch00,	$14
	smpsHeaderFM	music90_FM4,	smpsPitch00,	$14
	smpsHeaderFM	music90_FM5,	smpsPitch01lo,	$14
	smpsHeaderPSG	music90_PSG1,	smpsPitch02lo,	$06,	$00
	smpsHeaderPSG	music90_PSG2,	smpsPitch02lo,	$08,	$08
	smpsHeaderPSG	music90_PSG3,	smpsPitch01lo,	$08,	$08

; FM5 Data
music90_FM5:
	smpsPan		panRight,	$00
	smpsModSet	$18,	$01,	$FE,	$04
	smpsFMvoice	$03
	smpsAlterNote	$02
	smpsJump	music90_Jump01

; FM4 Data
music90_FM4:
	smpsModSet	$0C,	$01,	$FD,	$05
	smpsFMvoice	$00
	smpsAlterNote	$02
	dc.b		nRst,	$06
	smpsJump	music90_Jump02

; PSG1 Data
music90_PSG1:
	smpsModSet	$0C,	$01,	$01,	$04
	smpsJump	music90_Jump02

; PSG2 Data
music90_PSG2:
	smpsModSet	$0C,	$01,	$FF,	$04
	smpsAlterNote	$FF
	dc.b		nRst,	$06
	smpsJump	music90_Jump02

; FM1 Data
music90_FM1:
	smpsModSet	$0C,	$01,	$03,	$05
	smpsFMvoice	$00
music90_Jump02:
	dc.b		nRst,	$18
music90_Loop01:
	dc.b		nF4,	$06,	nG4,	nA4,	$18,	nG4,	$0C,	nA4
	dc.b		$18,	nC5,	$0C,	nB4,	nA4,	nG4,	nA4,	$18
	dc.b		nF4,	$06,	nG4,	nA4,	$18,	nG4,	$0C,	nA4
	dc.b		$18,	nC5,	$0C,	nD5,	nB4,	nG4,	nA4,	$18
	dc.b		nF4,	$0C,	nG4,	$18,	nF4,	$0C,	nG4,	$18
	dc.b		nC5,	$0C,	nA4,	$24,	nG4,	$18,	nF4,	$0C
	dc.b		nA4,	$24,	nB4,	nC5,	nB4,	$18
	smpsLoop	$01,	$02,	music90_Loop01
	dc.b		smpsNoAttack,	nB4,	$0C,	nF5,	$24,	$0C,	nG5,	nF5
	dc.b		nE5,	$24,	nCs5,	$18
	smpsJump	music90_Loop01

; FM2 Data
music90_FM2:
	smpsFMvoice	$01
music90_Loop02:
	dc.b		nRst,	$18,	nA1,	$0C,	nD2,	$06,	nRst,	$12
	dc.b		nA1,	$0C
music90_Jump03:
	dc.b		nD2,	$06,	nRst,	$12,	nA1,	$0C,	nG1,	$06
	dc.b		nRst,	$12,	nG1,	$0C,	nD2,	$06,	nRst,	$12
	dc.b		nA1,	$0C,	nD2,	$06,	nRst,	$12,	nA1,	$0C
	dc.b		nD2,	$06,	nRst,	$12,	nA1,	$0C,	nG1,	$06
	dc.b		nRst,	$12,	nG1,	$0C,	nD2,	$06,	nRst,	$12
	dc.b		nD2,	$0C,	nG1,	$06,	nRst,	$12,	nD2,	$0C
	dc.b		nG1,	$06,	nRst,	$12,	nG1,	$0C,	nF1,	$06
	dc.b		nRst,	$12,	nC2,	$0C,	nF1,	$06,	nRst,	$12
	dc.b		nC2,	$0C,	nD2,	$06,	nRst,	$12,	nA1,	$0C
	dc.b		nD2,	$06,	nRst,	$12,	nA1,	$0C,	nD2,	$06
	dc.b		nRst,	$12,	nA1,	$0C
	smpsLoop	$00,	$02,	music90_Loop02
	dc.b		nD2,	$06,	nRst,	$12,	nA1,	$0C,	nBb1,	$18
	dc.b		$0C,	$18,	$0C,	nC2,	$18,	$0C,	nCs2,	$18
	dc.b		nA1,	$0C,	nD2,	$06,	nRst,	$12,	nA1,	$0C
	smpsJump	music90_Jump03

; FM3 Data
music90_FM3:
	smpsPan		panLeft,	$00
	smpsAlterPitch	$F4
	smpsModSet	$18,	$01,	$02,	$04
	smpsFMvoice	$02
music90_Jump01:
	dc.b		nD4,	$0C,	nA4,	nF4
music90_Jump04:
	dc.b		nC5,	$24,	smpsNoAttack,	nC5,	nB4,	nE5,	$18,	nA4
	dc.b		$0C,	nC5,	$24,	smpsNoAttack,	nC5,	nB4,	nD5,	nRst
	dc.b		$0C,	nG4,	nA4,	nB4,	$18,	nA4,	$0C,	nRst
	dc.b		nA4,	nB4,	nC5,	nB4,	nC5,	nD5,	$24,	smpsNoAttack
	dc.b		$18,	nE5,	$0C,	nD5,	$24
	smpsLoop	$00,	$02,	music90_Jump01
	smpsAlterPitch	$0C
	dc.b		smpsNoAttack,	nD4,	$24,	nD4,	nBb3,	$0C,	nD4,	nA4
	dc.b		nG4,	$24
	smpsAlterPitch	$F4
	dc.b		nE4,	$0C,	nA4,	nF4
	smpsJump	music90_Jump04

; PSG3 Data
music90_PSG3:
	dc.b		nRst,	$24
	smpsNoteFill	$10
music90_Loop03:
	smpsAlterVol	$FE
	dc.b		nF4,	$06
	smpsAlterVol	$02
	dc.b		nC5,	nC5,	nF4,	nA4,	nF4
	smpsAlterVol	$FE
	dc.b		nB4
	smpsAlterVol	$02
	dc.b		nF4,	nC5,	nF4,	nB4,	nF4
	smpsLoop	$01,	$10,	music90_Loop03
music90_Loop04:
	dc.b		nA5,	$06,	nF5,	nE5,	nD5
	smpsLoop	$01,	$04,	music90_Loop04
	dc.b		nA5,	$06,	nF5,	nE5,	nCs5,	nA5,	nG5,	nE5
	dc.b		nCs5
	smpsJump	music90_Loop03

music90_Call01:
	dc.b		dKick,	$12,	dSnare,	$06,	$8E,	$0C,	dKick,	$0C
	dc.b		dSnare,	$12,	$8E,	$06
	smpsReturn

; DAC Data
music90_DAC:
	dc.b		dSnare,	$06,	$8C,	$0C,	$8D,	$06,	$8E,	$0C
music90_Loop05:
	smpsCall	music90_Call01
	smpsLoop	$00,	$07,	music90_Loop05
	dc.b		dKick,	$12,	dSnare,	$06,	$8E,	$0C,	dKick,	$06
	dc.b		$8C,	$0C,	$8D,	$06,	dKick,	$0C
music90_Loop06:
	smpsCall	music90_Call01
	smpsLoop	$00,	$08,	music90_Loop06
	dc.b		dKick,	$12,	dSnare,	$06,	dKick,	$0C,	dKick,	$0C
	dc.b		dKick,	dSnare,	dKick,	$12,	dSnare,	$06,	dKick,	$0C
	smpsJump	music90_DAC

music90_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b		$3B,$32,$32,$32,$72,$4F,$18,$1A,$11,$0E,$16,$0B,$00,$04,$00,$00
	dc.b		$00,$50,$10,$00,$0A,$1B,$1F,$1E,$00;			Voice 02
	dc.b		$38,$32,$52,$32,$72,$17,$18,$1A,$11,$17,$16,$0B,$00,$00,$00,$00
	dc.b		$00,$10,$10,$00,$0A,$20,$11,$21,$00;			Voice 03
	even
