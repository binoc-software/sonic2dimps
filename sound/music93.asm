; =============================================================================================
; Project Name:		GayCircus
; Created:		25th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

GayCircus_Header:
	smpsHeaderVoice	GayCircus_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$04

	smpsHeaderDAC	GayCircus_DAC
	smpsHeaderFM	GayCircus_FM1,	smpsPitch01hi,	$09
	smpsHeaderFM	GayCircus_FM2,	smpsPitch01hi,	$19
	smpsHeaderFM	GayCircus_FM3,	smpsPitch01hi,	$19
	smpsHeaderFM	GayCircus_FM4,	smpsPitch00,	$0C
	smpsHeaderFM	GayCircus_FM5,	smpsPitch00,	$0C
	smpsHeaderPSG	GayCircus_PSG1,	smpsPitch02lo,	$03,	$00
	smpsHeaderPSG	GayCircus_PSG2,	smpsPitch03lo,	$03,	$00
	smpsHeaderPSG	GayCircus_PSG3,	smpsPitch02hi+$0B,	$00,	$00

; FM1 Data
GayCircus_FM1:
	smpsFMvoice	$00
	smpsPan		panCentre,	$00
	smpsModSet	$07,	$01,	$03,	$05
	dc.b		nEb2,	$06,	nRst,	nEb2,	nEb2,	nFs2,	nRst,	nFs2
	dc.b		nRst,	nG2,	$18,	nC3,	nG1,	$06,	nRst,	nG2
	dc.b		nG2,	nG2,	nRst,	nG1,	nG1,	nG1,	nRst,	nG2
	dc.b		nG2,	nG2,	nAb2,	nG2,	nG2
GayCircus_Loop01:
	smpsCall	GayCircus_Call01
	smpsCall	GayCircus_Call02
	smpsLoop	$00,	$02,	GayCircus_Loop01
	dc.b		nBb1,	nRst,	nF1,	nRst,	nBb1,	$18,	nRst,	$0C
	dc.b		nF1,	nAb1,	nRst,	nEb2,	nRst,	nG2,	nD2,	nB1
	dc.b		nG1
	smpsCall	GayCircus_Call01
	dc.b		nAb1,	$18,	nRst,	$0C,	nEb1,	$06,	nEb1,	nEb2
	dc.b		$0C,	nAb1,	nBb1,	nB1
	smpsCall	GayCircus_Call01
	smpsCall	GayCircus_Call02
	dc.b		nBb1,	nRst,	nF1,	nRst,	nBb1,	$18,	nRst,	$0C
	dc.b		nF1,	nAb1,	nRst,	nEb2,	nRst,	nG2,	nEb2,	nB1
	dc.b		nFs1
	smpsJump	GayCircus_Loop01

GayCircus_Call01:
	dc.b		nC2,	$0C,	nRst,	nG1,	nRst,	nC2,	$18,	nRst
	dc.b		$0C,	nG1
	smpsReturn

GayCircus_Call02:
	dc.b		nAb1,	nRst,	nEb2,	nRst,	nC2,	nEb1,	nF1,	nEb1
	smpsReturn

; FM2 Data
GayCircus_FM2:
	smpsFMvoice	$03
	smpsPan		panLeft,	$00
	smpsAlterVol	$FB
	smpsModSet	$07,	$01,	$03,	$05
	dc.b		nEb3,	$03,	nRst,	nEb3,	nRst,	nEb3,	nRst,	nEb3
	dc.b		nRst,	nEb3,	nRst,	$09,	nEb3,	$03,	nRst,	$09
	dc.b		nEb3,	$12,	nRst,	$06,	nG3,	$12,	nRst,	$06
	dc.b		nG3,	$12,	nC4,	$03,	nRst,	nB3,	$12,	nAb3
	dc.b		$03,	nRst,	nG3,	nRst,	$09,	nB3,	$03,	nRst
	dc.b		$09
	smpsModSet	$0C,	$01,	$09,	$07
	dc.b		nD4,	$18
	smpsModSet	$07,	$01,	$03,	$05
	smpsFMvoice	$01
	smpsPan		panCentre,	$00
	smpsAlterVol	$05
GayCircus_Loop02:
	smpsCall	GayCircus_Call03
	smpsLoop	$00,	$02,	GayCircus_Loop02
	smpsModSet	$18,	$01,	$07,	$05
	dc.b		nEb4,	$2A,	nRst,	$06,	nD4,	$12,	nRst,	$06
	dc.b		nEb4,	$12,	nRst,	$06,	nC4,	$30,	nBb3,	$18
	dc.b		nB3
	smpsModSet	$07,	$01,	$03,	$05
	smpsJump	GayCircus_Loop02

GayCircus_Call03:
	dc.b		nC4,	$1E,	nRst,	$06,	nG3,	nRst,	nC4,	$12
	dc.b		nRst,	$06,	nE4,	$12,	nRst,	$06,	nEb4,	nRst
	smpsModSet	$18,	$01,	$09,	$07
	dc.b		nD4,	$4E,	nRst,	$06
	smpsModSet	$07,	$01,	$03,	$05
	smpsReturn

; FM3 Data
GayCircus_FM3:
	smpsFMvoice	$03
	smpsPan		panRight,	$00
	smpsAlterVol	$FB
	smpsModSet	$07,	$01,	$03,	$05
	dc.b		nFs3,	$03,	nRst,	nFs3,	nRst,	nFs3,	nRst,	nFs3
	dc.b		nRst,	nFs3,	nRst,	$09,	nAb3,	$03,	nRst,	$09
	dc.b		nG3,	$12,	nRst,	$06,	nC4,	$12,	nRst,	$06
	dc.b		nB3,	$12,	nAb3,	$03,	nRst,	nD4,	$12,	nC4
	dc.b		$03,	nRst,	nB3,	nRst,	$09,	nD4,	$03,	nRst
	dc.b		$09
	smpsModSet	$0C,	$01,	$09,	$07
	dc.b		nG4,	$18
	smpsModSet	$07,	$01,	$03,	$05
	smpsFMvoice	$01
	smpsPan		panCentre,	$00
	smpsAlterVol	$05
GayCircus_Loop03:
	smpsCall	GayCircus_Call04
	smpsLoop	$00,	$02,	GayCircus_Loop03
	smpsModSet	$18,	$01,	$07,	$05
	dc.b		nBb3,	$2A,	nRst,	$06,	nBb3,	$12,	nRst,	$06
	dc.b		nBb3,	$12,	nRst,	$06,	nAb3,	$30,	nF3,	$18
	dc.b		nF3
	smpsModSet	$07,	$01,	$03,	$05
	smpsJump	GayCircus_Loop03

GayCircus_Call04:
	dc.b		nG3,	$1E,	nRst,	$06,	nE3,	nRst,	nG3,	$12
	dc.b		nRst,	$06,	nC4,	$12,	nRst,	$06,	nC4,	nRst
	smpsModSet	$18,	$01,	$09,	$07
	dc.b		nAb3,	$4E
	smpsModSet	$07,	$01,	$03,	$05
	dc.b		nRst,	$06
	smpsReturn

; FM4 Data
GayCircus_FM4:
	smpsFMvoice	$02
	smpsPan		panLeft,	$00
	smpsModSet	$07,	$01,	$05,	$07
	smpsNoteFill	$04
	dc.b		nFs4,	$0C,	nFs4,	$06,	nFs4,	nFs4,	$0C,	nFs4
	dc.b		nG4,	nC5
	smpsNoteFill	$00
	dc.b		nEb5,	$12,	nRst,	$06,	nB4,	$10,	nRst,	$02
	dc.b		nAb4,	$06,	nG4,	$10,	nRst,	$02,	nF4,	$06
	dc.b		nEb4,	nD4,	nC4,	nB3,	nAb3,	$0C,	nG3
	smpsNoteFill	$04
GayCircus_Loop04:
	smpsCall	GayCircus_Call05
	smpsLoop	$00,	$02,	GayCircus_Loop04
	smpsCall	GayCircus_Call06
	dc.b		nRst,	nG4,	$04,	nRst,	$14,	nG4,	$04,	nRst
	dc.b		$14,	nC5,	$06,	nC5,	nC5,	$0C,	nC5,	nRst
	dc.b		nEb4,	$06,	nEb4,	nEb4,	$0C,	nEb4,	$04,	nRst
	dc.b		$14,	nAb4,	$06,	nAb4,	nAb4,	$0C,	nAb4
	smpsCall	GayCircus_Call05
	smpsCall	GayCircus_Call06
	smpsJump	GayCircus_Loop04

GayCircus_Call05:
	dc.b		nRst,	nG4,	$04,	nRst,	$14,	nG4,	$04,	nRst
	dc.b		$14,	nC5,	$06,	nC5,	nC5,	$0C,	nC5,	nRst
	dc.b		nEb4,	$04,	nRst,	$14,	nEb4,	$04,	nRst,	$14
	dc.b		nEb4,	$06,	nEb4,	nEb4,	$0C,	nEb4
	smpsReturn

GayCircus_Call06:
	dc.b		nRst,	nF4,	$04,	nRst,	$14,	nF4,	$04,	nRst
	dc.b		$14,	nF4,	$06,	nF4,	nF4,	$0C,	nF4,	nRst
	dc.b		nEb4,	$04,	nRst,	$14,	nEb4,	$04,	nRst,	$14
	dc.b		nD4,	$06,	nD4,	nF4,	$0C,	nF4
	smpsReturn

; FM5 Data
GayCircus_FM5:
	smpsFMvoice	$02
	smpsPan		panRight,	$00
	smpsModSet	$07,	$01,	$06,	$08
	smpsNoteFill	$04
	dc.b		nC5,	$0C,	nC5,	$06,	nC5,	nC5,	$0C,	nC5
	dc.b		nEb5,	nG5
	smpsNoteFill	$00
	dc.b		nG5,	$12,	nRst,	$06,	nG5,	$10,	nRst,	$02
	dc.b		nF5,	$06,	nEb5,	$10,	nRst,	$02,	nD5,	$06
	dc.b		nC5,	nB4,	nAb4,	nG4,	nF4,	$0C,	nEb4
	smpsNoteFill	$04
GayCircus_Loop05:
	smpsCall	GayCircus_Call07
	smpsLoop	$00,	$02,	GayCircus_Loop05
	smpsCall	GayCircus_Call08
	dc.b		nRst,	nC5,	$04,	nRst,	$14,	nC5,	$04,	nRst
	dc.b		$14,	nE5,	$06,	nE5,	nE5,	$0C,	nE5,	nRst
	dc.b		nAb4,	$06,	nAb4,	nAb4,	$0C,	nAb4,	nRst,	nEb5
	dc.b		$06,	nEb5,	nEb5,	$0C,	nEb5
	smpsCall	GayCircus_Call07
	smpsCall	GayCircus_Call08
	smpsJump	GayCircus_Loop05

GayCircus_Call07:
	dc.b		nRst,	nC5,	$04,	nRst,	$14,	nC5,	$04,	nRst
	dc.b		$14,	nE5,	$06,	nE5,	nE5,	$0C,	nE5,	nRst
	dc.b		nAb4,	$04,	nRst,	$14,	nAb4,	$04,	nRst,	$14
	dc.b		nAb4,	$06,	nAb4,	nAb4,	$0C,	nAb4
	smpsReturn

GayCircus_Call08:
	dc.b		nRst,	nBb4,	$04,	nRst,	$14,	nBb4,	$04,	nRst
	dc.b		$14,	nBb4,	$06,	nBb4,	nBb4,	$0C,	nBb4,	nRst
	dc.b		nAb4,	$04,	nRst,	$14,	nAb4,	$04,	nRst,	$14
	dc.b		nG4,	$06,	nG4,	nBb4,	$0C,	nB4
	smpsReturn

; PSG1 Data
GayCircus_PSG1:
	smpsPSGvoice	$03
	smpsSetVol	$FF
	dc.b		nRst,	$12,	nFs3,	$04,	nRst,	$02,	nEb3,	$04
	dc.b		nRst,	$08,	nFs3,	$04,	nRst,	$08,	nG3,	$04
	dc.b		nRst,	$08,	nC4,	$04,	nRst,	$08,	nC4,	$12
	dc.b		nRst,	$06
	smpsSetVol	$03
	dc.b		nG3,	$04,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3
	smpsSetVol	$FF
	dc.b		nAb3,	nG3,	nAb3
	smpsSetVol	$02
GayCircus_Jump01:
	dc.b		nC4,	$04,	nRst,	$2C,	nC4,	$04,	nRst,	$2C
	dc.b		nAb3,	$04,	nRst,	$14,	nAb3,	$04,	nRst,	$14
	dc.b		nAb3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nC3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nC4,	$04,	nRst,	$2C,	nC4,	$04,	nRst,	$2C
	dc.b		nAb3,	$04,	nRst,	$14,	nEb3,	$18,	nC3,	nEb2
	dc.b		nBb2,	$04,	nRst,	$2C,	nBb2,	$04,	nRst,	$2C
	dc.b		nAb2,	$04,	nRst,	$14,	nAb2,	$04,	nRst,	$14
	dc.b		nG2,	$0C,	nF2,	nFs2,	nG2
	smpsSetVol	$FF
	dc.b		nC4,	$02,	nD4,	nE4,	$14,	nC4,	$18,	nG3
	dc.b		nE3,	nAb2,	$06,	nRst,	$0C,	nAb2,	$06,	nC3
	dc.b		nRst,	nEb3,	nRst,	nAb3,	nRst,	nAb3,	nRst,	nAb3
	dc.b		nRst,	nEb3,	nRst
	smpsSetVol	$01
	dc.b		nE3,	$04,	nRst,	$2C,	nE3,	$04,	nRst,	$2C
	dc.b		nAb3,	$04,	nRst,	$14,	nAb3,	$04,	nRst,	$14
	dc.b		nAb3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nC3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nBb3,	$04,	nRst,	$2C,	nBb3,	$04,	nRst,	$2C
	dc.b		nAb3,	$04,	nRst,	$14,	nEb3,	$18,	nB2,	nFs2
	smpsJump	GayCircus_Jump01

; PSG2 Data
GayCircus_PSG2:
	smpsPSGvoice	$00
	smpsAlterPitch	$0C
	smpsSetVol	$FF
	dc.b		nRst,	$12,	nEb3,	$04,	nRst,	$02,	nAb3,	$04
	dc.b		nRst,	$08,	nEb3,	$04,	nRst,	$08,	nEb3,	$04
	dc.b		nRst,	$08,	nG3,	$04,	nRst,	$08,	nG3,	$12
	dc.b		nRst,	$06
	smpsSetVol	$03
	dc.b		nG3,	$04,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3,	nAb3,	nG3,	nAb3
	smpsSetVol	$FF
	dc.b		nG3,	nAb3,	nG3
	smpsSetVol	$FF
	dc.b		nAb3,	nG3,	nAb3
	smpsSetVol	$02
	smpsAlterPitch	$F4
GayCircus_Jump02:
	smpsNoteFill	$04
	dc.b		nC3,	$18,	nE3,	nC3,	nE3,	nC4
	smpsNoteFill	$00
	smpsSetVol	$FF
	dc.b		nAb4,	$18,	nEb4,	nC4
	smpsSetVol	$01
	smpsNoteFill	$04
	dc.b		nC3,	$18,	nE3,	nC3,	nE3
	smpsNoteFill	$00
	smpsSetVol	$FF
	dc.b		nAb4,	$18,	nEb4,	$04,	nRst,	$10,	nEb4,	$04
	dc.b		$0C,	nC4,	nAb3,	nEb3
	smpsSetVol	$01
	smpsNoteFill	$04
	dc.b		nD4,	$18,	nF4,	nD4,	nF4,	nC4
	smpsNoteFill	$00
	smpsSetVol	$FF
	dc.b		nAb4,	$18,	nD4,	nEb4
	smpsSetVol	$01
	smpsNoteFill	$04
	dc.b		nC3,	$18,	nE3,	nC3,	nE3
	smpsSetVol	$FF
	smpsNoteFill	$00
	dc.b		nC4,	$30,	nRst,	$0C,	nAb4,	$04,	nRst,	$02
	dc.b		nAb4,	$04,	nRst,	$02,	nAb4,	$04,	nRst,	$08
	dc.b		nAb4,	$04,	nRst,	$08
	smpsSetVol	$01
	smpsNoteFill	$04
	dc.b		nC3,	$18,	nE3,	nC3,	nE3,	nC4
	smpsNoteFill	$00
	smpsSetVol	$FF
	dc.b		nAb4,	$18,	nEb4,	nC4
	smpsSetVol	$01
	smpsNoteFill	$04
	dc.b		nD4,	$18,	nF4,	nD4,	nF4
	smpsNoteFill	$00
	smpsSetVol	$FF
	dc.b		nAb4,	$18,	nEb4,	$06,	nRst,	$0C,	nEb4,	$04
	dc.b		nRst,	$02,	nD4,	$0C,	nB3,	$06,	nRst,	nB3
	dc.b		$0C,	nFs3,	$06,	nRst
	smpsSetVol	$01
	smpsJump	GayCircus_Jump02

; PSG3 Data
GayCircus_PSG3:
	smpsPSGform	$E7
	smpsPSGvoice	$02
	dc.b		nC4,	$30
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4,	$18,	$48
GayCircus_Jump03:
	smpsPSGvoice	$02
	dc.b		nC4,	$30
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$01
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsPSGvoice	$02
	dc.b		nC4
	smpsJump	GayCircus_Jump03

; DAC Data
GayCircus_DAC:
	dc.b		dKick,	$0C,	dSnare,	$03,	dSnare,	dSnare,	dSnare,	dSnare
	dc.b		$18,	dKick,	$0C,	dSnare,	$03,	dSnare,	dSnare,	dSnare
	dc.b		dSnare,	$18,	dKick,	$0C,	dSnare,	$04,	dSnare,	dSnare
	dc.b		dSnare,	$06,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare
	dc.b		dSnare,	dSnare,	$0C,	$06,	dSnare
GayCircus_Loop06:
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dSnare
	dc.b		dSnare,	dKick,	dSnare,	dHiTimpani,	dMidTimpani,	dHiTimpani,	dMidTimpani,	dHiTimpani
	dc.b		dMidTimpani
	smpsLoop	$00,	$02,	GayCircus_Loop06
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dSnare
	dc.b		dSnare,	dKick,	dSnare,	dHiTimpani,	dMidTimpani,	dHiTimpani,	dMidTimpani,	dHiTimpani
	dc.b		dSnare,	$04,	dSnare,	dSnare,	dKick,	$0C,	dSnare,	dKick
	dc.b		dSnare,	dKick,	dSnare,	dSnare,	dSnare,	dKick,	dSnare,	dSnare
	dc.b		$0F,	$03,	dSnare,	dSnare,	dKick,	$0C,	dSnare,	dSnare
	dc.b		$0F,	$03,	dSnare,	dSnare,	dKick,	$0C,	dSnare,	dKick
	dc.b		dSnare,	dKick,	dSnare,	dSnare,	dSnare,	dKick,	dSnare,	dHiTimpani
	dc.b		dMidTimpani,	dHiTimpani,	dMidTimpani,	dHiTimpani,	dSnare,	$04,	dSnare,	dSnare
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dSnare
	dc.b		dSnare,	dKick,	dSnare,	dHiTimpani,	dMidTimpani,	dHiTimpani,	$18,	dSnare
	dc.b		$0C,	$06,	dSnare
	smpsJump	GayCircus_Loop06

GayCircus_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b		$15,$71,$72,$01,$31,$0F,$14,$14,$14,$00,$05,$02,$02,$00,$00,$00
	dc.b		$00,$0F,$1F,$1F,$1F,$2D,$80,$80,$80;			Voice 03
	even
