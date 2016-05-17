; =============================================================================================
; Project Name:		music89
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music89_Header:
	smpsHeaderVoice	music89_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$03,	$06

	smpsHeaderDAC	music89_DAC
	smpsHeaderFM	music89_FM1,	smpsPitch01hi,	$08
	smpsHeaderFM	music89_FM2,	smpsPitch01lo,	$0A
	smpsHeaderFM	music89_FM3,	smpsPitch01lo,	$12
	smpsHeaderFM	music89_FM4,	smpsPitch01lo,	$12
	smpsHeaderFM	music89_FM5,	smpsPitch01lo,	$0F
	smpsHeaderPSG	music89_PSG1,	smpsPitch03lo,	$05,	$00
	smpsHeaderPSG	music89_PSG2,	smpsPitch03lo,	$05,	$00
	smpsHeaderPSG	music89_PSG3,	smpsPitch00,	$04,	$00

; FM1 Data
music89_FM1:
	smpsFMvoice	$00
	dc.b		nRst,	$18
music89_Jump01:
	dc.b		nC3,	$06,	nC2,	nC3,	nC2,	nC3,	nC2,	nC3
	dc.b		nC2,	nRst,	nG1,	$04,	nRst,	$02,	nBb1,	$04
	dc.b		nAb1,	$06,	nG1,	$04,	nRst,	$02,	nG2,	$02
	dc.b		nG1,	$06,	nA1,	nB1,	nC2,	$06,	nB1,	nA1
	dc.b		nG1,	nC2,	nG1,	nC2,	nD2,	nE2,	nD2,	nC2
	dc.b		nB1,	nE1,	nFs1,	nAb1,	nE1,	nA1,	nA1,	nE2
	dc.b		nE2,	nA1,	nB1,	nC2,	nA1,	nAb1,	nBb1,	nC2
	dc.b		nD2,	nEb2,	$04,	$02,	nAb1,	$06,	nC2,	nAb1
	dc.b		nC2,	nC2,	nD2,	nEb2,	nE2,	$04,	$02,	nE1
	dc.b		$06,	nFs1,	nAb1,	nA1,	nA1,	nG1,	nG1,	nF1
	dc.b		nC2,	nF1,	nA1,	nRst,	nC2,	nRst,	nC2,	nRst
	dc.b		nF2,	nRst,	nF2,	nAb1,	$0C,	$06,	nRst,	$04
	dc.b		nG1,	$04,	nRst,	$02,	nG2,	nF2,	$06,	nE2
	dc.b		nD2,	nC2,	$04,	$02,	nE1,	$06,	nF1,	nFs1
	dc.b		nG1,	nB1,	nC2,	nD2,	nE2,	nB1,	nAb1,	nFs1
	dc.b		nE1,	nB1,	nE2,	nE1,	nA1,	nB1,	nC2,	nB1
	dc.b		nA1,	nC2,	nE2,	nA1,	nAb1,	nBb1,	nC2,	nBb1
	dc.b		nAb1,	nA1,	nBb1,	nB1,	nC2,	nB1,	nC2,	nD2
	dc.b		nE2,	$04,	$02,	nB1,	$06,	nE1,	nAb1,	nA1
	dc.b		nB1,	nC2,	nE2,	nF2,	$04,	nA1,	$08,	nBb1
	dc.b		$06,	nB1,	nRst,	nC2,	nRst,	nC2,	nRst,	nF2
	dc.b		nRst,	nF2
	smpsAlterVol	$04
	dc.b		nRst,	nC2,	nRst,	nC2,	nRst,	nF2,	nRst,	nF2
	smpsAlterVol	$FC
	dc.b		nRst,	nC2,	nRst,	nC2,	nRst,	nF2,	nRst,	nF2
	dc.b		$04,	nC2,	$02,	nRst,	$18,	nC2,	$02,	nRst
	dc.b		nC2,	nB1,	$06,	nA1,	nG1
	smpsJump	music89_Jump01

; FM3 Data
music89_FM3:
	smpsFMvoice	$02
	smpsPan		panLeft,	$00
	dc.b		nRst,	$18
music89_Jump02:
	smpsFMvoice	$02
	dc.b		nRst,	$06,	nG5,	nRst,	nG5,	nRst,	nG5,	nRst
	dc.b		nG5,	nRst,	nF5,	$02,	nRst,	$04,	nF5,	$04
	dc.b		$02,	nRst,	$04,	nF5,	$02,	nRst,	$18
	smpsCall	music89_Call01
	smpsFMvoice	$01
	smpsAlterPitch	$F4
	smpsAlterVol	$FC
	smpsCall	music89_Call02
	dc.b		nE6,	$18,	nD6,	$0C,	nE6,	$06,	nD6,	nC6
	dc.b		$18,	nF6,	nRst,	$06,	nG5,	nRst,	nG5,	nRst
	dc.b		nA5,	nRst,	nA5
	smpsAlterVol	$04
	dc.b		nRst,	nG5,	nRst,	nG5,	nRst,	nA5,	nRst,	nA5
	smpsAlterVol	$FC
	dc.b		nRst,	nG5,	nRst,	nG5,	nRst,	nA5,	$0C,	$04
	dc.b		nG5,	$02,	nRst,	$30
	smpsAlterPitch	$0C
	smpsAlterVol	$04
	smpsJump	music89_Jump02

music89_Call01:
	dc.b		nRst,	$06,	nG4,	$02,	nRst,	$08,	nG4,	$02
	dc.b		nRst,	$06,	nG4,	$08,	nRst,	$02,	nG4,	$06
	dc.b		nRst,	$02,	nG4,	$04,	$02,	nRst,	$06,	nAb4
	dc.b		$02,	nRst,	$08,	nAb4,	$02,	nRst,	$06,	nAb4
	dc.b		$08,	nRst,	$02,	nAb4,	$06,	nRst,	$02,	nAb4
	dc.b		$04,	$02,	nRst,	$06,	nA4,	$02,	nRst,	$08
	dc.b		nA4,	$02,	nRst,	$06,	nA4,	$08,	nRst,	$02
	dc.b		nA4,	$06,	nRst,	$02,	nA4,	$04,	$02,	nRst
	dc.b		$06,	nAb4,	$02,	nRst,	$08,	nAb4,	$02,	nRst
	dc.b		$06,	nAb4,	$08,	nRst,	$02,	nAb4,	$06,	nRst
	dc.b		$02,	nAb4,	$04,	$02,	nRst,	$06,	nG4,	$02
	dc.b		nRst,	$08,	nG4,	$02,	nRst,	$06,	nAb4,	$08
	dc.b		nRst,	$02,	nAb4,	$06,	nRst,	$02,	nAb4,	$04
	dc.b		$02,	nRst,	$06,	nA4,	$02,	nRst,	$08,	nA4
	dc.b		$02,	nRst,	$06,	nA4,	$08,	nRst,	$02,	nA4
	dc.b		$06,	nRst,	$02,	nA4,	$04,	$02,	nRst,	$06
	dc.b		nG4,	nRst,	nG4,	nRst,	nA4,	nRst,	nA4,	nC5
	dc.b		$0C,	$06,	$04,	nB4,	$02,	nRst,	$18
	smpsReturn

music89_Call02:
	dc.b		nRst,	$06,	nE6,	$02,	nRst,	$08,	nE6,	$02
	dc.b		nRst,	$06,	nE6,	$06,	nF6,	$04,	nE6,	$02
	dc.b		nRst,	$0C,	nRst,	$06,	nD6,	$02,	nRst,	$08
	dc.b		nD6,	$02,	nRst,	$06,	nD6,	$06,	nE6,	$04
	dc.b		nD6,	$02,	nRst,	$0C,	nRst,	$06,	nC6,	$02
	dc.b		nRst,	$08,	nC6,	$02,	nRst,	$06,	nC6,	$06
	dc.b		nD6,	$04,	nC6,	$02,	nRst,	$0C,	nRst,	$06
	dc.b		nC6,	$02,	nRst,	$08,	nC6,	$02,	nRst,	$06
	dc.b		nC6,	$06,	nD6,	$04,	nC6,	$02,	nRst,	$0C
	smpsReturn

; FM4 Data
music89_FM4:
	smpsFMvoice	$02
	smpsPan		panRight,	$00
	dc.b		nRst,	$18
music89_Jump03:
	smpsFMvoice	$02
	dc.b		nRst,	$06,	nEb5,	nRst,	nEb5,	nRst,	nEb5,	nRst
	dc.b		nEb5,	nRst,	nD5,	$02,	nRst,	$04,	nD5,	$04
	dc.b		$02,	nRst,	$04,	nD5,	$02,	nRst,	$18
	smpsCall	music89_Call03
	smpsFMvoice	$01
	smpsAlterPitch	$F4
	smpsAlterVol	$FC
	smpsCall	music89_Call04
	dc.b		nC6,	$18,	nB5,	$0C,	nC6,	$06,	nB5,	nA5
	dc.b		$18,	nC6,	nRst,	$06,	nE5,	nRst,	nE5,	nRst
	dc.b		nF5,	nRst,	nF5
	smpsAlterVol	$04
	dc.b		nRst,	nE5,	nRst,	nE5,	nRst,	nF5,	nRst,	nF5
	smpsAlterVol	$FC
	dc.b		nRst,	nE5,	nRst,	nE5,	nRst,	nF5,	$0C,	$04
	dc.b		nE5,	$02,	nRst,	$30
	smpsAlterPitch	$0C
	smpsAlterVol	$04
	smpsJump	music89_Jump03

music89_Call03:
	dc.b		nRst,	$06,	nE4,	$02,	nRst,	$08,	nE4,	$02
	dc.b		nRst,	$06,	nE4,	$08,	nRst,	$02,	nE4,	$06
	dc.b		nRst,	$02,	nE4,	$04,	$02
	smpsLoop	$00,	$03,	music89_Call03
	dc.b		nRst,	$06,	nEb4,	$02,	nRst,	$08,	nEb4,	$02
	dc.b		nRst,	$06,	nEb4,	$08,	nRst,	$02,	nEb4,	$06
	dc.b		nRst,	$02,	nEb4,	$04,	$02,	nRst,	$06,	nE4
	dc.b		$02,	nRst,	$08,	nE4,	$02,	nRst,	$06,	nE4
	dc.b		$08,	nRst,	$02,	nE4,	$06,	nRst,	$02,	nE4
	dc.b		$04,	$02,	nRst,	$06,	nE4,	$02,	nRst,	$08
	dc.b		nE4,	$02,	nRst,	$06,	nF4,	$08,	nRst,	$02
	dc.b		nF4,	$06,	nRst,	$02,	nF4,	$04,	$02,	nRst
	dc.b		$06,	nE4,	nRst,	nE4,	nRst,	nF4,	nRst,	nF4
	dc.b		nAb4,	$0C,	$06,	$04,	nG4,	$02,	nRst,	$18
	smpsReturn

music89_Call04:
	dc.b		nRst,	$06,	nC6,	$02,	nRst,	$08,	nC6,	$02
	dc.b		nRst,	$06,	nC6,	$06,	nD6,	$04,	nC6,	$02
	dc.b		nRst,	$0C,	nRst,	$06,	nB5,	$02,	nRst,	$08
	dc.b		nB5,	$02,	nRst,	$06,	nB5,	$06,	nC6,	$04
	dc.b		nB5,	$02,	nRst,	$0C,	nRst,	$06,	nA5,	$02
	dc.b		nRst,	$08,	nA5,	$02,	nRst,	$06,	nA5,	$06
	dc.b		nB5,	$04,	nA5,	$02,	nRst,	$0C,	nRst,	$06
	dc.b		nAb5,	$02,	nRst,	$08,	nAb5,	$02,	nRst,	$06
	dc.b		nAb5,	$06,	nBb5,	$04,	nAb5,	$02,	nRst,	$0C
	smpsReturn

; FM2 Data
music89_FM2:
	smpsFMvoice	$01
	smpsModSet	$1C,	$01,	$06,	$04
	dc.b		nRst,	$18
music89_Jump04:
	smpsFMvoice	$01
	dc.b		nRst,	$06,	nEb5,	$0C,	nC5,	$02,	nRst,	$04
	dc.b		nFs5,	nF5,	$02,	nRst,	$04,	nEb5,	$02,	nRst
	dc.b		$04,	nC5,	$08,	nRst,	$06,	nG4,	$02,	nRst
	dc.b		$04,	nBb4,	nAb4,	$02,	nRst,	$04,	nG4,	$02
	dc.b		nRst,	$0C,	nE4,	$04,	nRst,	$02,	nE4,	$04
	dc.b		nRst,	$02,	nE4,	$18,	nRst,	$06,	nE4,	$04
	dc.b		nRst,	$02,	nF4,	$04,	nE4,	$08,	nAb4,	$04
	dc.b		$02,	nRst,	$04,	nE4,	$1A,	nRst,	$06,	nE4
	dc.b		nA4,	$04,	$02,	nRst,	$04,	nE4,	$02,	nC4
	dc.b		$12,	nRst,	$06,	nC4,	$04,	nRst,	$02,	nD4
	dc.b		$04,	nC4,	$02,	nEb4,	$06,	nD4,	$04,	nC4
	dc.b		$26,	nRst,	$06,	nE4,	$04,	nRst,	$02,	nF4
	dc.b		$04,	nRst,	$02,	nE4,	$04,	nRst,	$02,	nAb4
	dc.b		$04,	$02,	nRst,	$04,	nE4,	$0E,	nRst,	$06
	dc.b		nA4,	$0C,	nB4,	$04,	nA4,	$02,	nC5,	$0C
	dc.b		nRst,	$06,	nA4,	$02,	nRst,	$04,	nG4,	$0C
	dc.b		nE4,	nC4,	nD4,	nEb4,	nF4,	$04,	nEb4,	$02
	dc.b		nF4,	$04,	nG4,	$02,	nRst,	$10,	nG3,	$02
	dc.b		nA3,	$04,	nC4,	$02,	nE4,	$18,	nRst,	$06
	dc.b		nE4,	$04,	nRst,	$02,	nF4,	$04,	nE4,	$08
	dc.b		nAb4,	$04,	$02,	nRst,	$04,	nE4,	$1A,	nRst
	dc.b		$06,	nE4,	nA4,	$04,	$02,	nRst,	$04,	nE4
	dc.b		$02,	nC4,	$12,	nRst,	$06,	nC4,	$04,	nRst
	dc.b		$02,	nD4,	$04,	nC4,	$02,	nEb4,	$06,	nD4
	dc.b		$04,	nC4,	$26,	nRst,	$06,	nE4,	$04,	nRst
	dc.b		$02,	nF4,	$04,	nRst,	$02,	nE4,	$04,	nRst
	dc.b		$02,	nAb4,	$04,	$02,	nRst,	$04,	nE4,	$0E
	dc.b		nRst,	$06,	nA4,	$0C,	nB4,	$04,	nA4,	$02
	dc.b		nC5,	$0C,	nRst,	$06,	nA4,	$02,	nRst,	$04
	dc.b		nG4,	$0C,	nE4,	nC4,	nD4,	$06
	smpsAlterVol	$04
	dc.b		nA4,	$02,	nRst,	$04,	nG4,	$0C,	nE4,	nC4
	dc.b		nD4,	$06
	smpsAlterVol	$FC
	dc.b		nA4,	$02,	nRst,	$04,	nG4,	$0C,	nE4,	nC4
	dc.b		nD4,	$0A,	nC4,	$02,	nRst,	$30
	smpsJump	music89_Jump04

; FM5 Data
music89_FM5:
	smpsFMvoice	$01
	dc.b		nRst,	$18
	smpsModSet	$1C,	$01,	$06,	$04
music89_Jump05:
	smpsFMvoice	$01
	dc.b		nRst,	$06,	nC5,	$0C,	nG4,	$02,	nRst,	$04
	dc.b		nEb5,	nD5,	$02,	nRst,	$04,	nC5,	$02,	nRst
	dc.b		$04,	nG4,	$08,	nRst,	$06,	nD4,	$02,	nRst
	dc.b		$04,	nF4,	nEb4,	$02,	nRst,	$04,	nD4,	$02
	dc.b		nRst,	$0C,	nA3,	$04,	nRst,	$02,	nB3,	$04
	dc.b		nRst,	$02,	nC4,	$18,	nRst,	$06,	nC4,	$04
	dc.b		nRst,	$02,	nD4,	$04,	nC4,	$08,	nE4,	$04
	dc.b		nE4,	$02,	nRst,	$04,	nB3,	$1A,	nRst,	$06
	dc.b		nB3,	nE4,	$04,	$02,	nRst,	$04,	nC4,	$02
	dc.b		nA3,	$12,	nRst,	$06,	nA3,	$04,	nRst,	$02
	dc.b		nB3,	$04,	nA3,	$02,	nC4,	$06,	nBb3,	$04
	dc.b		nAb3,	$26,	nRst,	$06,	nC4,	$04,	nRst,	$02
	dc.b		nD4,	$04,	nRst,	$02,	nC4,	$04,	nRst,	$02
	dc.b		nE4,	$04,	nE4,	$02,	nRst,	$04,	nB3,	$0E
	dc.b		nRst,	$06,	nE4,	$0C,	nG4,	$04,	nE4,	$02
	dc.b		nA4,	$0C,	nRst,	$06,	nF4,	$02,	nRst,	$04
	dc.b		nE4,	$0C,	nC4,	nA3,	nB3,	nC4,	nD4,	$04
	dc.b		nC4,	$02,	nD4,	$04,	nD4,	$02,	nRst,	$10
	dc.b		nD3,	$02,	nE3,	$04,	nG3,	$02,	nC4,	$18
	dc.b		nRst,	$06,	nC4,	$04,	nRst,	$02,	nD4,	$04
	dc.b		nC4,	$08,	nE4,	$04,	nE4,	$02,	nRst,	$04
	dc.b		nB3,	$1A,	nRst,	$06,	nB3,	nE4,	$04,	$02
	dc.b		nRst,	$04,	nC4,	$02,	nA3,	$12,	nRst,	$06
	dc.b		nA3,	$04,	nRst,	$02,	nB3,	$04,	nA3,	$02
	dc.b		nC4,	$06,	nBb3,	$04,	nAb3,	$26,	nRst,	$06
	dc.b		nC4,	$04,	nRst,	$02,	nD4,	$04,	nRst,	$02
	dc.b		nC4,	$04,	nRst,	$02,	nE4,	$04,	nE4,	$02
	dc.b		nRst,	$04,	nB3,	$0E,	nRst,	$06,	nE4,	$0C
	dc.b		nG4,	$04,	nE4,	$02,	nA4,	$0C,	nRst,	$06
	dc.b		nF4,	$02,	nRst,	$04,	nE4,	$0C,	nC4,	nA3
	dc.b		nB3,	$06
	smpsAlterVol	$04
	dc.b		nF4,	$02,	nRst,	$04,	nE4,	$0C,	nC4,	nA3
	dc.b		nB3,	$06
	smpsAlterVol	$F8
	dc.b		nF4,	$02,	nRst,	$04,	nE4,	$0C,	nC4,	nA3
	dc.b		nF3,	$0A,	nE3,	$02,	nRst,	$30
	smpsAlterVol	$04
	smpsJump	music89_Jump05

; PSG1 Data
music89_PSG1:
	dc.b		nRst,	$18
music89_Jump06:
	dc.b		nRst,	$06,	nG4,	$0C,	nEb4,	$02,	nRst,	$04
	dc.b		nA4,	nAb4,	$02,	nRst,	$04,	nG4,	$02,	nRst
	dc.b		$04,	nEb4,	$08,	nRst,	$06,	nB3,	$02,	nRst
	dc.b		$04,	nD4,	nC4,	$02,	nRst,	$04,	nB3,	$02
	dc.b		nRst,	$18
	smpsPSGvoice	$01
	smpsSetVol	$FF
	smpsCall	music89_Call01
	smpsSetVol	$01
	smpsPSGvoice	$00
	smpsAlterPitch	$E8
	smpsCall	music89_Call02
	smpsAlterPitch	$18
	smpsSetVol	$02
	dc.b		nE4,	$18,	nD4,	$0C,	nE4,	$06,	nD4,	nC4
	dc.b		$18,	nF4
	smpsSetVol	$FE
	dc.b		nRst,	$06,	nG4,	nRst,	nG4,	nRst,	nA4,	nRst
	dc.b		nA4
	smpsSetVol	$03
	dc.b		nG5,	$0C,	nE5,	nC5,	nD5,	$06,	nRst
	smpsSetVol	$FC
	dc.b		nRst,	nG4,	nRst,	nG4,	nRst,	nA4,	$0C,	$04
	dc.b		nG4,	$02,	nRst,	$30
	smpsSetVol	$01
	smpsJump	music89_Jump06

; PSG2 Data
music89_PSG2:
	dc.b		nRst,	$18
music89_Jump07:
	dc.b		nRst,	$06,	nEb5,	$0C,	nC5,	$02,	nRst,	$04
	dc.b		nFs5,	nF5,	$02,	nRst,	$04,	nEb5,	$02,	nRst
	dc.b		$04,	nC5,	$08,	nRst,	$06,	nG4,	$02,	nRst
	dc.b		$04,	nBb4,	nAb4,	$02,	nRst,	$04,	nG4,	$02
	dc.b		nRst,	$18
	smpsPSGvoice	$01
	smpsSetVol	$FF
	smpsCall	music89_Call03
	smpsSetVol	$01
	smpsPSGvoice	$00
	smpsAlterPitch	$E8
	smpsCall	music89_Call04
	smpsAlterPitch	$18
	smpsSetVol	$02
	dc.b		nC4,	$18,	nB3,	$0C,	nC4,	$06,	nB3,	nA3
	dc.b		$18,	nC4
	smpsSetVol	$FE
	dc.b		nRst,	$06,	nE4,	nRst,	nE4,	nRst,	nF4,	nRst
	dc.b		nF4
	smpsSetVol	$03
	dc.b		nRst,	nC4,	nRst,	nC4,	nRst,	nC4,	nRst,	nC4
	smpsSetVol	$FC
	dc.b		nRst,	nC4,	nRst,	nC4,	nRst,	nC4,	$0C,	$04
	dc.b		nC4,	$02
	smpsSetVol	$01
	dc.b		nRst,	$30
	smpsJump	music89_Jump07
	smpsStop

; PSG3 Data
music89_PSG3:
	smpsPSGform	$E7
	dc.b		nRst,	$18
music89_Loop01:
	smpsCall	music89_Call05
	smpsLoop	$01,	$07,	music89_Loop01
	dc.b		$04,	$02,	$04,	$02
music89_Loop02:
	smpsCall	music89_Call05
	smpsLoop	$01,	$1F,	music89_Loop02
	dc.b		$04,	$02,	$04,	$02
music89_Loop03:
	smpsCall	music89_Call05
	smpsLoop	$01,	$24,	music89_Loop03
	dc.b		nRst,	$30
	smpsJump	music89_Loop01

music89_Call05:
	smpsPSGvoice	$01
	dc.b		nA5,	$06
	smpsPSGvoice	$02
	smpsSetVol	$FF
	dc.b		$04
	smpsPSGvoice	$01
	smpsSetVol	$01
	dc.b		$02
	smpsReturn

; DAC Data
music89_DAC:
	dc.b		dKick,	$06,	dKick,	dKick,	$04,	dSnare,	$02,	$06
music89_Loop04:
	dc.b		dKick,	$06,	dSnare
	smpsLoop	$00,	$04,	music89_Loop04
	dc.b		dKick,	$06,	dSnare,	dSnare,	$04,	$06,	$06,	dKick
	dc.b		$02,	$06,	$06,	dSnare
music89_Loop05:
	dc.b		dKick,	dSnare
	smpsLoop	$00,	$1C,	music89_Loop05
	dc.b		dKick,	dSnare,	dSnare,	$04,	$06,	$06,	dKick,	$02
	dc.b		$06,	$06,	dSnare
music89_Loop06:
	dc.b		dKick,	dSnare
	smpsLoop	$00,	$20,	music89_Loop06
	dc.b		dKick,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dSnare,	$04
	dc.b		$06,	$02,	nRst,	$28,	dSnare,	$02,	$06
	smpsJump	music89_Loop04

music89_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b		$2C,$61,$03,$01,$33,$5F,$94,$5F,$94,$05,$05,$05,$07,$02,$02,$02
	dc.b		$02,$1F,$6F,$1F,$AF,$1E,$80,$1E,$80;			Voice 02
	even
