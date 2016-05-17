; =============================================================================================
; Project Name:		music86
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music86_Header:
	smpsHeaderVoice	music86_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$04

	smpsHeaderDAC	music86_DAC
	smpsHeaderFM	music86_FM1,	smpsPitch01hi,	$0C
	smpsHeaderFM	music86_FM2,	smpsPitch01hi,	$07
	smpsHeaderFM	music86_FM3,	smpsPitch01hi,	$0C
	smpsHeaderFM	music86_FM4,	smpsPitch00,	$10
	smpsHeaderFM	music86_FM5,	smpsPitch00,	$10
	smpsHeaderPSG	music86_PSG1,	smpsPitch00,	$06,	$00
	smpsHeaderPSG	music86_PSG2,	smpsPitch00,	$05,	$00
	smpsHeaderPSG	music86_PSG3,	smpsPitch00,	$00,	$00

; PSG1 Data
music86_PSG1:

; PSG2 Data
music86_PSG2:

; PSG3 Data
music86_PSG3:
	smpsStop

; FM1 Data
music86_FM1:
	smpsFMvoice	$01
	smpsAlterNote	$06
	dc.b		nRst,	$60
	smpsModSet	$08,	$01,	$02,	$40
	dc.b		nD4,	$30
	smpsModSet	$08,	$01,	$03,	$20
	dc.b		smpsNoAttack,	nD4,	$18
	smpsModSet	$08,	$01,	$03,	$20
	dc.b		smpsNoAttack,	nD4,	$18,	smpsModOff,	nC4,	$0C,	nRst,	$54
	smpsCall	music86_Call01
	smpsFMvoice	$01
	smpsCall	music86_Call02
	smpsAlterPitch	$F4
	smpsCall	music86_Call03
	smpsAlterPitch	$0C
	smpsFMvoice	$01
	smpsCall	music86_Call04
	smpsAlterPitch	$F4
	smpsCall	music86_Call05
	smpsAlterPitch	$0C
	smpsFMvoice	$01
	smpsCall	music86_Call02
	smpsAlterPitch	$F4
	smpsCall	music86_Call03
	smpsAlterPitch	$0C
	smpsFMvoice	$01
	smpsCall	music86_Call04
	smpsAlterPitch	$F4
	smpsCall	music86_Call06
	smpsAlterPitch	$0C
	smpsAlterNote	$FE
	dc.b		nRst,	$0C
	smpsFMvoice	$03
	dc.b		nBb2,	$06,	nA2,	nBb2,	nC3,	nRst,	$0C,	nBb2
	dc.b		$06,	nA2,	nBb2,	nC3,	nRst,	$24,	nA2,	$06
	dc.b		nG2,	nA2,	nC3,	nRst,	$0C,	nF2,	$06,	nE2
	dc.b		nF2,	nG2,	nRst,	$18
	smpsCall	music86_Call07
	dc.b		nE3,	$03,	nRst,	nE3,	$12,	nF3,	$03,	nRst
	dc.b		$09,	nF3,	$0C,	nFs3,	$03,	nRst,	$09,	nFs3
	dc.b		$0C,	nG3,	nRst,	$18,	nBb2,	$06,	nA2,	nBb2
	dc.b		nC3,	nRst,	$0C,	nBb2,	$06,	nA2,	nBb2,	nC3
	dc.b		nRst,	$24,	nA2,	$06,	nG2,	nA2,	nC3,	nRst
	dc.b		$0C,	nF2,	$06,	nE2,	nF2,	nG2,	nRst,	$18
	smpsCall	music86_Call07
	dc.b		nE3,	$03,	nRst,	nE3,	$06,	nRst,	$54
	smpsJump	music86_FM1

music86_Call07:
	dc.b		nE3,	$03,	nRst,	$09,	nE3,	$0C,	nF3,	$03
	dc.b		nRst,	$09,	nF3,	$0C,	nFs3,	$03,	nRst,	$09
	dc.b		nFs3,	$0C,	nG3,	$18
	smpsReturn

music86_Call02:
	dc.b		nRst,	$06,	nG3,	$06,	nA3,	nRst,	nC4,	nRst
	dc.b		nD4,	nRst,	nEb4,	nRst,	nD4,	nRst,	nC4,	nD4
	dc.b		nRst,	nC4
	smpsReturn

music86_Call04:
	dc.b		nRst,	$06,	nG4,	$12,	nEb4,	$06,	nRst,	nD4
	dc.b		nRst,	nEb4,	nRst,	nD4,	nRst,	nC4,	nA3,	nRst
	dc.b		nC4
	smpsReturn

; FM3 Data
music86_FM3:
	smpsFMvoice	$01
	dc.b		nRst,	$60,	nRst,	nRst,	nRst,	nRst,	$60
	smpsCall	music86_Call03
	dc.b		nRst,	$60
	smpsCall	music86_Call05
	dc.b		nRst,	$60
	smpsCall	music86_Call03
	dc.b		nRst,	$60
	smpsCall	music86_Call06
	smpsFMvoice	$01
	smpsCall	music86_Call08
	dc.b		nC4,	$30,	smpsNoAttack,	nC4,	$30,	smpsNoAttack,	nC4,	$0C
	dc.b		nRst,	$60
	smpsCall	music86_Call08
	dc.b		nC4,	$30,	smpsNoAttack,	nC4,	$30,	smpsNoAttack,	nC4,	$0C
	dc.b		nG4,	$03,	nRst,	nG4,	$06,	nRst,	$54
	smpsJump	music86_FM3

music86_Call08:
	dc.b		nRst,	$0C,	nBb3,	$12,	nRst,	$06,	nC4,	nRst
	dc.b		nD4,	$12,	nRst,	$06,	nE4,	$12,	nRst,	$06
	dc.b		nF4,	$12,	nRst,	$06,	nE4,	$12,	nRst,	$06
	dc.b		nD4,	nRst,	nBb3,	$12,	nRst,	$06
	smpsReturn

music86_Call01:
	dc.b		nRst,	$06
	smpsAlterVol	$17
	dc.b		nEb4,	$05,	smpsNoAttack,	nD4,	$05
	smpsAlterVol	$FE
	dc.b		nEb4,	$04,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$04,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$04,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$04,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$04,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$04
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$03
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$03
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$03
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$03
	smpsAlterVol	$FE
	dc.b		nEb4,	$03,	smpsNoAttack,	nD4,	$03
	smpsAlterVol	$FF
	dc.b		nEb4,	$03
	smpsReturn

music86_Call03:
	dc.b		nRst,	$0C
	smpsFMvoice	$03
	dc.b		nG3,	$06,	nA3,	nC4,	nRst,	$12,	nG3,	$06
	dc.b		nA3,	nC4,	nRst,	nEb4,	nC4,	nRst,	nC4
	smpsReturn

music86_Call05:
	dc.b		nRst,	$06
	smpsFMvoice	$03
	dc.b		nBb3,	$12,	nA3,	$06,	nRst,	$12,	nBb3,	$06
	dc.b		nRst,	nA3,	nRst,	nBb3,	nC4,	nRst,	nC4
	smpsReturn

music86_Call06:
	dc.b		nRst,	$06
	smpsFMvoice	$03
	dc.b		nBb3,	$12,	nA3,	$06,	nRst,	$12,	nBb3,	$06
	dc.b		nRst,	nA3,	nRst,	nBb3,	$03,	nRst,	nC4,	$12
	smpsReturn

; FM5 Data
music86_FM5:
	smpsFMvoice	$02
	smpsAlterNote	$04
music86_Jump01:
	dc.b		nRst,	$60,	nRst,	nRst,	nRst
music86_Loop01:
	dc.b		nG4,	$03,	smpsNoAttack,	nA4,	$5D,	nF4,	$03,	smpsNoAttack
	dc.b		nG4,	$5D,	nEb4,	$03,	smpsNoAttack,	nF4,	$5D,	nF4
	dc.b		$03,	smpsNoAttack,	nG4,	$5D
	smpsLoop	$00,	$02,	music86_Loop01
	smpsCall	music86_Call09
	smpsCall	music86_Call09
	dc.b		nRst,	$60,	nRst
	smpsCall	music86_Call09
	smpsCall	music86_Call09
	dc.b		nRst,	$60
music86_Loop02:
	dc.b		nC5,	$06
	smpsLoop	$00,	$0F,	music86_Loop02
	dc.b		nRst,	$06
	smpsJump	music86_Jump01

music86_Call09:
	dc.b		nA4,	$06,	nRst,	nA4,	nRst,	nG4,	nRst,	$12
	dc.b		nA4,	$06,	nRst,	nA4,	nRst,	nG4,	nRst,	$12
	smpsReturn

; FM4 Data
music86_FM4:
	smpsFMvoice	$02
music86_Jump02:
	dc.b		nRst,	$60,	nRst,	nRst,	nRst
music86_Loop03:
	dc.b		nEb4,	$03,	smpsNoAttack,	nF4,	$5D,	nD4,	$03,	smpsNoAttack
	dc.b		nE4,	$5D,	nC4,	$03,	smpsNoAttack,	nD4,	$5D,	nD4
	dc.b		$03,	smpsNoAttack,	nE4,	$5D
	smpsLoop	$00,	$02,	music86_Loop03
	smpsCall	music86_Call0A
	smpsCall	music86_Call0A
	dc.b		nRst,	$60,	nRst
	smpsCall	music86_Call0A
	smpsCall	music86_Call0A
	dc.b		nRst,	$60
music86_Loop04:
	dc.b		nBb4,	$06
	smpsLoop	$00,	$0F,	music86_Loop04
	dc.b		nRst,	$06
	smpsJump	music86_Jump02

music86_Call0A:
	dc.b		nF4,	$06,	nRst,	nF4,	nRst,	nE4,	nRst,	$12
	dc.b		nF4,	$06,	nRst,	nF4,	nRst,	nE4,	nRst,	$12
	smpsReturn

; FM2 Data
music86_FM2:
	smpsFMvoice	$00
music86_Jump03:
	smpsCall	music86_Call0B
	dc.b		nEb3,	$06,	nE3,	nB2,	nC3,	nRst,	$1E,	nA1
	dc.b		$06,	nA1,	$0C,	nBb1,	nB1
	smpsCall	music86_Call0B
	dc.b		nEb3,	$06,	nE3,	nRst,	$54
	smpsCall	music86_Call0C
	smpsCall	music86_Call0D
	dc.b		nB1,	$0C,	nB2,	$06,	nRst
	smpsCall	music86_Call0C
	smpsCall	music86_Call0D
	dc.b		nB1,	$0C,	nB2,	$06,	nRst
	smpsCall	music86_Call0C
	smpsCall	music86_Call0D
	dc.b		nB1,	$0C,	nB2,	$06,	nRst
	smpsCall	music86_Call0C
	smpsCall	music86_Call0D
	dc.b		nC2,	$0C,	nC3,	$06,	nRst
	smpsCall	music86_Call0E
	dc.b		nC2,	$06,	nC2,	$12,	nD2,	$06,	nRst,	nD2
	dc.b		$0C,	nEb2,	$06,	nRst,	nEb2,	$0C,	nE2,	$06
	dc.b		nRst,	nE2,	$0C
	smpsCall	music86_Call0E
	dc.b		nC2,	$06,	nC2,	nRst,	$54
	smpsJump	music86_Jump03

music86_Call0B:
	dc.b		nC2,	$06,	nG2,	nA2,	nRst,	nC3,	nRst,	nC3
	dc.b		nRst,	nC3,	nRst,	nC3,	nRst,	nD3,	nC3,	$12
	smpsReturn

music86_Call0C:
	dc.b		nC2,	$0C,	nC3,	$06,	nRst,	nA1,	$0C,	nA2
	dc.b		$06,	nRst,	nBb1,	$0C,	nBb2,	$06,	nRst,	nB1
	dc.b		$0C,	nEb3,	$06,	nD3
	smpsReturn

music86_Call0D:
	dc.b		nC2,	$06,	nC2,	$12,	nA1,	$0C,	nA2,	$06
	dc.b		nRst,	nBb1,	$0C,	nBb2,	$06,	nRst
	smpsReturn

music86_Call0E:
	dc.b		nBb1,	$0C,	nBb2,	$06,	nBb2,	nBb1,	$0C,	nBb2
	dc.b		$06,	nBb2,	nBb1,	$0C,	nBb2,	$06,	nBb2,	nBb1
	dc.b		$0C,	nBb2,	$06,	nBb2,	nA1,	nA1,	$12,	nA1
	dc.b		$0C,	nA2,	$06,	nA2,	nG1,	$0C,	nG2,	$06
	dc.b		nG2,	nG1,	$0C,	nG2,	$06,	nG2,	nC2,	nRst
	dc.b		nC2,	$0C,	nD2,	$06,	nRst,	nD2,	$0C,	nEb2
	dc.b		$06,	nRst,	nEb2,	$0C,	nE2,	nG1,	$06,	nA1
	smpsReturn

; DAC Data
music86_DAC:
	dc.b		dKick,	$24,	dKick,	$0C,	dKick,	$30,	dKick,	$06
	dc.b		dKick,	$1E,	dKick,	$0C,	dKick,	$18,	dSnare,	dKick
	dc.b		$24,	dKick,	$0C,	dKick,	$30,	dKick,	$06,	dKick
	dc.b		$1E,	dKick,	$0C,	dKick,	$18,	dSnare,	$0C,	dSnare
	dc.b		$06,	dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare,	$0C,	dSnare,	$06,	dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare,	$0C,	dSnare,	$06,	dSnare
	smpsCall	music86_Call0F
	dc.b		dKick,	$06,	dKick,	$12,	dSnare,	$0C,	dKick,	dKick
	dc.b		dSnare,	dSnare,	dSnare,	$06,	dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare,	$0C,	dSnare,	$06,	dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare
	smpsCall	music86_Call0F
	smpsCall	music86_Call10
	dc.b		dSnare,	$0C,	dSnare,	$06,	dSnare
	smpsCall	music86_Call0F
	dc.b		dSnare,	$06,	dKick,	$0C,	dKick,	$06,	dKick,	$0C
	dc.b		dSnare,	$06,	dSnare,	$0C,	dKick,	dKick,	$06,	dKick
	dc.b		$0C,	dSnare,	$06,	dSnare
	smpsJump	music86_DAC

music86_Call0F:
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	dKick,	$18,	dSnare
	smpsReturn

music86_Call10:
	dc.b		dKick,	$06,	dKick,	$12,	dSnare,	$0C,	dKick,	dKick
	dc.b		$18
	smpsReturn

music86_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
