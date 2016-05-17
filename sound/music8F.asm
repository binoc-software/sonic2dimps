; =============================================================================================
; Project Name:		music8F
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8F_Header:
	smpsHeaderVoice	music8F_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$02

	smpsHeaderDAC	music8F_DAC
	smpsHeaderFM	music8F_FM1,	smpsPitch00,	$08
	smpsHeaderFM	music8F_FM2,	smpsPitch00,	$06
	smpsHeaderFM	music8F_FM3,	smpsPitch01hi,	$06
	smpsHeaderFM	music8F_FM4,	smpsPitch02hi,	$08
	smpsHeaderFM	music8F_FM5,	smpsPitch00,	$06
	smpsHeaderPSG	music8F_PSG1,	smpsPitch00,	$00,	$00
	smpsHeaderPSG	music8F_PSG2,	smpsPitch00,	$00,	$00
	smpsHeaderPSG	music8F_PSG3,	smpsPitch00,	$00,	$00

; PSG1 Data
music8F_PSG1:

; PSG2 Data
music8F_PSG2:

; PSG3 Data
music8F_PSG3:
	smpsStop

; FM5 Data
music8F_FM5:
	smpsFMvoice	$00
	smpsAlterNote	$01
	dc.b		nRst,	$12
music8F_Jump01:
	smpsPan		panLeft,	$00
	smpsAlterVol	$06
music8F_Loop01:
	dc.b		nE5,	$03,	nE5,	nCs5,	nCs5,	nA4,	nA4,	nCs5
	dc.b		nCs5,	nA4,	nA4,	nE4,	nE4
	smpsLoop	$00,	$07,	music8F_Loop01
	dc.b		nE5,	nE5,	nCs5,	nCs5,	nA4,	nA4
	smpsPan		panCentre,	$00
	smpsAlterVol	$FA
	smpsAlterPitch	$F4
	dc.b		nCs4,	$0C,	nD4,	$06,	nE4,	$12,	nA4,	$12
	dc.b		nAb4,	$12,	nFs4,	$12,	nE4,	$12,	nD4,	$0C
	dc.b		nCs4,	$06,	nD4,	$12,	nD4,	$0C,	nE4,	$06
	dc.b		nFs4,	$12,	nB4,	nA4,	nFs4,	nFs4,	$12,	nAb4
	dc.b		$0C,	nFs4,	$06,	nE4,	$24
	smpsAlterPitch	$0C
	smpsPan		panLeft,	$00
	smpsAlterVol	$06
music8F_Loop02:
	dc.b		nBb4,	$03,	nA4
	smpsLoop	$00,	$30,	music8F_Loop02
	smpsAlterPitch	$F4
	smpsAlterVol	$FA
	smpsPan		panCentre,	$00
	dc.b		nB3,	$12,	nCs4,	nD4,	nE4,	nFs4,	nAb4,	nA4
	dc.b		nB4,	nCs4,	nD4,	nE4,	nFs4,	nAb4,	nA4,	nB4
	dc.b		nCs5,	nD5,	$48,	nEb5,	nFs5,	$24,	nE5,	nA5
	dc.b		nAb5,	$24
	smpsAlterPitch	$0C
	smpsJump	music8F_Jump01

; FM1 Data
music8F_FM1:
	smpsFMvoice	$00
	smpsAlterNote	$FF
	dc.b		nRst,	$12
music8F_Jump02:
	smpsPan		panRight,	$00
	smpsAlterVol	$06
music8F_Loop03:
	dc.b		nE5,	$03,	nE5,	nCs5,	nCs5,	nA4,	nA4,	nCs5
	dc.b		nCs5,	nA4,	nA4,	nE4,	nE4
	smpsLoop	$00,	$07,	music8F_Loop03
	dc.b		nE5,	nE5,	nCs5,	nCs5,	nA4,	nA4
	smpsPan		panCentre,	$00
	smpsAlterVol	$FA
	dc.b		nCs4,	$0C,	nD4,	$06,	nE4,	$0C,	nRst,	$06
	dc.b		nA4,	$0C,	nRst,	$06,	nAb4,	$09,	nRst,	nFs4
	dc.b		$0C,	nRst,	$06,	nE4,	$0C,	nRst,	$06,	nD4
	dc.b		$0C,	nCs4,	$06,	nD4,	$0C,	nRst,	$06,	nD4
	dc.b		$0C,	nE4,	$06,	nFs4,	$09,	nRst,	nB4,	nRst
	dc.b		nA4,	nRst,	nFs4,	nRst,	nFs4,	$12,	nAb4,	$0C
	dc.b		nFs4,	$06,	nE4,	$24
	smpsPan		panRight,	$00
	smpsAlterVol	$06
music8F_Loop04:
	dc.b		nBb4,	$03,	nA4
	smpsLoop	$00,	$30,	music8F_Loop04
	smpsPan		panCentre,	$00
	smpsAlterVol	$FA
	dc.b		nB3,	$12,	nCs4,	nD4,	nE4,	nFs4,	nAb4,	nA4
	dc.b		nB4,	nCs4,	nD4,	nE4,	nFs4,	nAb4,	nA4,	nB4
	dc.b		nCs5,	nD5,	$48,	nEb5,	nFs5,	$24,	nE5,	nA5
	dc.b		nAb5,	$24
	smpsJump	music8F_Jump02

; FM2 Data
music8F_FM2:
	smpsFMvoice	$01
	dc.b		nRst,	$12
music8F_Jump03:
	dc.b		nRst,	$5A
	smpsCall	music8F_Call01
	dc.b		nRst,	$5A
	smpsCall	music8F_Call01
	dc.b		nRst,	$12,	nCs3,	$03,	nRst,	nCs3,	nRst,	nCs3
	dc.b		nRst,	nCs3,	$0C,	nRst,	$06,	nCs3,	$0F,	nRst
	dc.b		$15
	smpsCall	music8F_Call02
	dc.b		nRst,	$12
	smpsCall	music8F_Call02
	dc.b		nRst,	$12
	smpsCall	music8F_Call02
music8F_Loop05:
	dc.b		nB3,	$06,	nG3,	$0C,	nBb3,	$06,	nF3,	$0C
	dc.b		nAb3,	$06,	nE3,	$66
	smpsLoop	$00,	$02,	music8F_Loop05
	dc.b		nRst,	$12,	nD3,	$03,	nRst,	nD3,	nRst,	nD3
	dc.b		nRst,	nD3,	$24,	nRst,	$12,	nD3,	$03,	nRst
	dc.b		nB2,	nRst,	nD3,	nRst,	nFs3,	$24,	nRst,	$12
	dc.b		nE3,	$03,	nRst,	nE3,	nRst,	nE3,	nRst,	nE3
	dc.b		$24,	nRst,	$12,	nE3,	$03,	nRst,	nCs3,	nRst
	dc.b		nE3,	nRst,	nAb3,	$24,	nRst,	$12,	nFs3,	$03
	dc.b		nRst,	nFs3,	nRst,	nFs3,	nRst,	nFs3,	$24,	nRst
	dc.b		$12,	nFs3,	$03,	nRst,	nFs3,	nRst,	nFs3,	nRst
	dc.b		nFs3,	$24,	nRst,	$12,	nA3,	$03,	nRst,	nA3
	dc.b		nRst,	nA3,	nRst,	nA3,	$24,	nB3,	$0C,	nRst
	dc.b		$06,	nB3,	$0C,	nRst,	$06,	nB3,	$0C,	nRst
	dc.b		$06,	nB3,	$12
	smpsJump	music8F_Jump03

music8F_Call01:
	dc.b		nB2,	$03,	nRst,	nCs3,	nRst,	nD3,	nRst,	nCs3
	dc.b		$24
	smpsReturn

music8F_Call02:
	dc.b		nD3,	$03,	nRst,	nD3,	nRst,	nD3,	nRst,	nD3
	dc.b		$09,	nRst,	nD3,	$12
	smpsReturn

; FM3 Data
music8F_FM3:
	smpsFMvoice	$02
	dc.b		nRst,	$12
music8F_Jump04:
	smpsAlterVol	$FC
music8F_Loop06:
	dc.b		nA3,	$06,	nRst,	$03,	nA3,	nA3,	nRst,	nA3
	dc.b		nRst,	nE3,	nRst,	nA3,	nRst,	nCs4,	nRst,	nB3
	dc.b		nRst,	nA3,	nRst,	nB3,	nRst,	nCs4,	nRst,	nD4
	dc.b		nRst,	nCs4,	$48
	smpsLoop	$00,	$02,	music8F_Loop06
	smpsAlterVol	$04
	dc.b		nRst,	$12,	nE3,	$03,	nRst,	nE3,	nRst,	nE3
	dc.b		nRst,	nE3,	$09,	nRst,	nE3,	$0F,	nRst,	$15
	dc.b		nFs3,	$03,	nRst,	nFs3,	nRst,	nFs3,	nRst,	nFs3
	dc.b		$09,	nRst,	nFs3,	$0F,	nRst,	$15,	nFs3,	$03
	dc.b		nRst,	nFs3,	nRst,	nFs3,	nRst,	nFs3,	$09,	nRst
	dc.b		nFs3,	$0F,	nRst,	$15,	nAb3,	$03,	nRst,	nAb3
	dc.b		nRst,	nAb3,	nRst,	nAb3,	$09,	nRst,	nAb3,	$0C
	dc.b		nRst,	$60,	nRst,	nRst,	nRst,	$18,	nB3,	$03
	dc.b		nRst,	nB3,	nRst,	nB3,	nRst,	nB3,	$24,	nRst
	dc.b		$12,	nB3,	$03,	nRst,	nFs3,	nRst,	nB3,	nRst
	dc.b		nD4,	$24,	nRst,	$12,	nCs4,	$03,	nRst,	nCs4
	dc.b		nRst,	nCs4,	nRst,	nCs4,	$24,	nRst,	$12,	nCs4
	dc.b		$03,	nRst,	nAb3,	nRst,	nCs4,	nRst,	nE4,	$24
	dc.b		nRst,	$12,	nD4,	$03,	nRst,	nD4,	nD4,	nD4
	dc.b		nRst,	nD4,	nRst,	nA3,	nRst,	nB3,	nRst,	nD4
	dc.b		$15,	nRst,	$0F,	nEb4,	$03,	nRst,	nEb4,	nEb4
	dc.b		nEb4,	nRst,	nEb4,	nRst,	nA3,	nRst,	nB3,	nRst
	dc.b		nEb4,	$15,	nRst,	$0F,	nE4,	$03,	nRst,	nE4
	dc.b		$09,	nRst,	$03,	nE4,	nRst,	nE4,	nRst,	nE4
	dc.b		nRst,	nE4,	nRst,	nE4,	nRst,	nE4,	nRst,	nE4
	dc.b		$12,	nE4,	$0C,	nRst,	$06,	nE4,	$0C,	nRst
	dc.b		$06,	nE4,	$12
	smpsJump	music8F_Jump04

; DAC Data
music8F_DAC:
	dc.b		dVLowTimpani,	$06,	dVLowTimpani,	dVLowTimpani
music8F_Jump05:
	smpsCall	music8F_Call03
	dc.b		dMidTimpani,	$06
	smpsCall	music8F_Call03
	dc.b		dVLowTimpani,	$06,	dVLowTimpani,	$36,	dMidTimpani,	$12,	dVLowTimpani,	$36
	dc.b		dMidTimpani,	$12,	dVLowTimpani,	$36,	dMidTimpani,	$06,	dMidTimpani,	dMidTimpani
	dc.b		dVLowTimpani,	$36,	dVLowTimpani,	$06,	dVLowTimpani,	dVLowTimpani,	$60
	smpsCall	music8F_Call04
	dc.b		dVLowTimpani,	$5A
	smpsCall	music8F_Call04
	dc.b		dVLowTimpani,	$36,	dVLowTimpani,	$06,	dVLowTimpani,	dVLowTimpani,	dMidTimpani,	$36
	dc.b		dMidTimpani,	$12,	dVLowTimpani,	$36,	dMidTimpani,	$06,	dMidTimpani,	dMidTimpani
	dc.b		dVLowTimpani,	$36,	dMidTimpani,	$06,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	$36
	dc.b		dVLowTimpani,	$06,	dVLowTimpani,	dVLowTimpani,	dMidTimpani,	$36,	dMidTimpani,	$06
	dc.b		dVLowTimpani,	$0C,	dMidTimpani,	$12,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani
	dc.b		$09,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani,	dVLowTimpani
	dc.b		$09
	smpsJump	music8F_Jump05

music8F_Call03:
	dc.b		dMidTimpani,	$5A,	dMidTimpani,	$06,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani
	dc.b		dVLowTimpani,	dMidTimpani,	dVLowTimpani
	smpsReturn

music8F_Call04:
	dc.b		dMidTimpani,	$06,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani,	dVLowTimpani,	dMidTimpani
	dc.b		dVLowTimpani,	dMidTimpani
	smpsReturn

; FM4 Data
music8F_FM4:
	smpsFMvoice	$03
	smpsCall	music8F_Call05
music8F_Jump06:
	dc.b		nA1,	$78,	nRst,	$06
	smpsCall	music8F_Call05
	dc.b		nA1,	$78,	nRst,	$06
	smpsCall	music8F_Call05
	dc.b		nA1,	$36,	nBb1,	$12,	nB1,	$36,	nFs1,	$12
	dc.b		nB1,	$36,	nFs1,	$12,	nE1,	$3C,	nRst,	$0C
	dc.b		nE1,	$06,	nF1,	nG1,	nA1,	nG1,	nF1,	nE1
	dc.b		$36,	nD1,	$06,	nE1,	nF1,	nE1,	$1E,	nRst
	dc.b		$06,	nE1,	nF1,	nG1,	nA1,	nG1,	nF1,	nE1
	dc.b		$36,	nB1,	$06,	nAb1,	nF1,	nE1,	$0C,	nRst
	dc.b		$06
	smpsCall	music8F_Call05
	dc.b		nB1,	$36,	nFs1,	$03,	nRst,	nFs1,	nRst,	nFs1
	dc.b		nRst,	nB1,	$36,	nB1,	$03,	nRst,	nFs1,	nRst
	dc.b		nB1,	nRst,	nCs2,	$36,	nAb1,	$03,	nRst,	nAb1
	dc.b		nRst,	nAb1,	nRst,	nCs2,	$36,	nCs2,	$03,	nRst
	dc.b		nAb1,	nRst,	nCs2,	nRst,	nD1,	$36,	nD1,	$03
	dc.b		nRst,	nD1,	nRst,	nD1,	nRst,	nEb1,	$36,	nEb1
	dc.b		$03,	nRst,	nD1,	nRst,	nEb1,	nRst,	nE1,	$36
	dc.b		nB1,	$03,	nRst,	nAb1,	nRst,	nFs1,	nRst,	nE1
	dc.b		$36
	smpsCall	music8F_Call05
	smpsJump	music8F_Jump06

music8F_Call05:
	dc.b		nE1,	$06,	nE1,	nE1
	smpsReturn

music8F_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b		$3D,$01,$01,$02,$01,$4C,$0F,$50,$12,$0B,$05,$01,$02,$01,$00,$00
	dc.b		$00,$20,$24,$24,$14,$1D,$84,$88,$8A;			Voice 01
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b		$3A,$20,$23,$60,$01,$1E,$1F,$1F,$1F,$0A,$0A,$0B,$0A,$05,$07,$0A
	dc.b		$08,$AF,$8F,$9F,$7F,$21,$25,$28,$82;			Voice 03
	even
