; =============================================================================================
; Project Name:		music97
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music97_Header:
	smpsHeaderVoice	music97_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$09

	smpsHeaderDAC	music97_DAC
	smpsHeaderFM	music97_FM1,	smpsPitch01lo,	$11
	smpsHeaderFM	music97_FM2,	smpsPitch01lo,	$09
	smpsHeaderFM	music97_FM3,	smpsPitch02lo,	$0F
	smpsHeaderFM	music97_FM4,	smpsPitch02lo,	$0F
	smpsHeaderFM	music97_FM5,	smpsPitch01lo,	$11
	smpsHeaderPSG	music97_PSG1,	smpsPitch01lo,	$02,	$08
	smpsHeaderPSG	music97_PSG2,	smpsPitch03lo,	$05,	$05
	smpsHeaderPSG	music97_PSG3,	smpsPitch00,	$03,	$04

; FM5 Data
music97_FM5:
	smpsAlterNote	$03

; FM1 Data
music97_FM1:
	dc.b		nRst,	$30
	smpsFMvoice	$00
music97_Loop01:
	dc.b		nRst,	$0C,	nCs6,	$15,	nRst,	$03,	nCs6,	$06
	dc.b		nRst,	nD6,	$0F,	nRst,	$03,	nB5,	$18,	nRst
	dc.b		$06,	nCs6,	$06,	nRst,	nCs6,	nRst,	nCs6,	nRst
	dc.b		nA5,	nRst,	nG5,	$0F,	nRst,	$03,	nB5,	$18
	dc.b		nRst,	$06
	smpsLoop	$00,	$02,	music97_Loop01
	smpsAlterVol	$FD
	dc.b		nRst,	$30,	nRst,	nA5,	$04,	nB5,	nCs6,	nD6
	dc.b		nE6,	nFs6,	nB5,	nCs6,	nEb6,	nE6,	nFs6,	nAb6
	dc.b		nCs6,	nEb6,	nF6,	nFs6,	nAb6,	nBb6,	nF6,	nFs6
	dc.b		nAb6,	nBb6,	nC7,	nCs7
	smpsAlterVol	$03
	smpsJump	music97_Loop01

; FM2 Data
music97_FM2:
	smpsE2		$01
	smpsFMvoice	$01
	dc.b		nRst,	$30
music97_Loop02:
	dc.b		nA3,	$06,	nRst,	nA3,	nRst,	nE3,	nRst,	nE3
	dc.b		nRst,	nG3,	$12,	nFs3,	$0C,	nG3,	$06,	nFs3
	dc.b		$0C,	nA3,	$06,	nRst,	nA3,	nRst,	nE3,	nRst
	dc.b		nE3,	nRst,	nD4,	$12,	nCs4,	$0C,	nD4,	$06
	dc.b		nCs4,	$0C
	smpsLoop	$00,	$02,	music97_Loop02
music97_Loop03:
	dc.b		nB2,	$06,	nG2,	$12,	nA2,	$06,	nRst,	nB2
	dc.b		nRst
	smpsLoop	$00,	$02,	music97_Loop03
	dc.b		nA2,	$0C,	nB2,	nCs3,	nEb3,	nB2,	$06,	nCs3
	dc.b		nEb3,	nF3,	nCs3,	nEb3,	nF3,	nFs3
	smpsE2		$01
	smpsJump	music97_Loop02

; FM3 Data
music97_FM3:
	smpsFMvoice	$00
	dc.b		nRst,	$30
music97_Loop04:
	dc.b		nE6,	$06,	nRst,	nE6,	nRst,	nCs6,	nRst,	nCs6
	dc.b		nRst,	nD6,	$12,	nFs6,	nA6,	$0C,	nE6,	$06
	dc.b		nRst,	nE6,	nRst,	nCs6,	nRst,	nCs6,	nRst,	nG6
	dc.b		$12,	nG6,	$1E
	smpsLoop	$00,	$02,	music97_Loop04
music97_Loop05:
	dc.b		nRst,	$06,	nG5,	$12,	nA5,	$06,	nRst,	$12
	smpsLoop	$00,	$04,	music97_Loop05
	smpsJump	music97_Loop04

; FM4 Data
music97_FM4:
	smpsFMvoice	$00
	dc.b		nRst,	$30
music97_Loop06:
	dc.b		nCs6,	$06,	nRst,	nCs6,	nRst,	nA5,	nRst,	nA5
	dc.b		nRst,	nB5,	$12,	nD6,	nFs6,	$0C,	nCs6,	$06
	dc.b		nRst,	nCs6,	nRst,	nA5,	nRst,	nA5,	nRst,	nD6
	dc.b		$12,	nD6,	$1E
	smpsLoop	$00,	$02,	music97_Loop06
music97_Loop07:
	dc.b		nRst,	$06,	nB5,	$12,	nCs6,	$06,	nRst,	$12
	smpsLoop	$00,	$04,	music97_Loop07
	smpsJump	music97_Loop06

; PSG1 Data
music97_PSG1:

; PSG2 Data
music97_PSG2:
	smpsStop

; PSG3 Data
music97_PSG3:
	smpsPSGform	$E7
	dc.b		nRst,	$30
music97_Jump01:
	smpsNoteFill	$03
	dc.b		nA5,	$0C
	smpsNoteFill	$0C
	dc.b		$0C
	smpsNoteFill	$03
	dc.b		$0C
	smpsNoteFill	$0C
	dc.b		$0C
	smpsJump	music97_Jump01

; DAC Data
music97_DAC:
	dc.b		dSnare,	$06,	dSnare,	dKick,	dKick,	dSnare,	dSnare,	dSnare
	dc.b		dSnare
music97_Loop08:
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	$0C,	dSnare
	dc.b		dKick,	dSnare,	dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick
	dc.b		$0C,	dSnare,	dKick,	$04,	nRst,	dSnare,	dSnare,	$0C
	smpsLoop	$00,	$02,	music97_Loop08
	dc.b		dKick,	$06,	dSnare,	$12,	dKick,	$0C,	dSnare,	dSnare
	dc.b		$06,	dKick,	$12,	dKick,	$0C,	dSnare,	dSnare,	$06
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$0C,	dSnare,	dSnare
	dc.b		$04,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare
	dc.b		dSnare,	dSnare,	dSnare,	dSnare
	smpsJump	music97_Loop08
	smpsStop

music97_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b		$20,$7A,$31,$00,$00,$9F,$D8,$DC,$DF,$10,$0A,$04,$04,$0F,$08,$08
	dc.b		$08,$5F,$5F,$BF,$BF,$14,$2B,$17,$80;			Voice 01
	even
