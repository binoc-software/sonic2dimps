; =============================================================================================
; Project Name:		music9E
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music9E_Header:
	smpsHeaderVoice	music9E_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$F0

	smpsHeaderDAC	music9E_DAC
	smpsHeaderFM	music9E_FM1,	smpsPitch00,	$0E
	smpsHeaderFM	music9E_FM2,	smpsPitch02hi,	$0A
	smpsHeaderFM	music9E_FM3,	smpsPitch00,	$14
	smpsHeaderFM	music9E_FM4,	smpsPitch00,	$16
	smpsHeaderFM	music9E_FM5,	smpsPitch01hi,	$16
	smpsHeaderPSG	music9E_PSG1,	smpsPitch02lo,	$06,	$00
	smpsHeaderPSG	music9E_PSG2,	smpsPitch03lo,	$07,	$00
	smpsHeaderPSG	music9E_PSG3,	smpsPitch00,	$02,	$02

; FM1 Data
music9E_FM1:
	smpsAlterPitch	$F4
	smpsAlterVol	$FE
	smpsCall	music9E_Call01
	smpsAlterPitch	$0C
	smpsAlterVol	$02
music9E_Loop01:
	dc.b		nRst,	$30
	smpsLoop	$00,	$08,	music9E_Loop01
	smpsFMvoice	$03
	smpsCall	music9E_Call02
	dc.b		nA3,	$06,	nA2
	smpsCall	music9E_Call02
	smpsAlterVol	$FD
music9E_Loop02:
	smpsFMvoice	$00
	dc.b		nFs4,	$06,	nA4
	smpsCall	music9E_Call03
	smpsLoop	$00,	$02,	music9E_Loop02
	dc.b		nRst,	$06,	nRst,	nRst,	$30,	nRst
	smpsFMvoice	$0B
	smpsAlterPitch	$18
	smpsAlterVol	$02
music9E_Loop03:
	dc.b		nG1,	$0C,	nD1,	nF1,	nD1,	$06,	nG1,	$05
	dc.b		nG1,	$07,	$06,	nD1,	$0C,	nF1,	nD1
	smpsLoop	$00,	$05,	music9E_Loop03
	dc.b		nRst,	$30,	nRst
	smpsFMvoice	$0E
	smpsAlterVol	$FF
	smpsAlterPitch	$E8
	smpsCall	music9E_Call04
	dc.b		nRst,	$12,	nE1,	nG1,	$06,	nRst,	$18,	nA1
	dc.b		$12,	nCs2,	$06,	nRst,	nRst,	$12,	nD1,	nFs1
	dc.b		$08,	nRst,	$16,	nA1,	$06,	nE1,	nF1,	nG1
	dc.b		nA1
	smpsCall	music9E_Call04
	dc.b		nRst,	$12,	nE2,	nCs2,	$08,	nRst,	$16,	nA1
	dc.b		$12,	nE2,	$08,	nRst,	$04
	smpsFMvoice	$12
	smpsModSet	$18,	$01,	$0A,	$04
	dc.b		nRst,	$30,	nRst
	smpsCall	music9E_Call05
	dc.b		smpsNoAttack,	$24,	smpsNoAttack,	nAb5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack
	dc.b		nFs5,	smpsNoAttack,	nF5,	smpsNoAttack,	nE5,	smpsNoAttack,	nEb5,	smpsNoAttack
	dc.b		nD5,	smpsNoAttack,	nCs5,	smpsNoAttack,	nC5,	smpsNoAttack,	nB4,	smpsNoAttack
	dc.b		nBb4,	smpsNoAttack,	nA4,	nRst,	$60
	smpsFMvoice	$01
	smpsAlterPitch	$F4
	smpsAlterVol	$FA
	dc.b		smpsModOff
	smpsCall	music9E_Call06
	dc.b		nC4,	$03
	smpsCall	music9E_Call06
	dc.b		nRst,	$03,	nRst,	$60
	smpsAlterVol	$04
	smpsAlterNote	$01
	smpsFMvoice	$1B
	smpsAlterVol	$06
	dc.b		nE5,	$0C
	smpsNoteFill	$06
	dc.b		nC5,	$06,	nA4,	nC5,	$0C,	nRst,	nRst
	smpsFMvoice	$1C
	smpsAlterVol	$FA
	smpsNoteFill	$00
	dc.b		nB4,	$0C,	$12,	$06
	smpsFMvoice	$1B
	smpsAlterVol	$06
	smpsNoteFill	$06
	dc.b		nF5,	$06,	nF5,	nRst,	nF5,	nRst,	nF5
	smpsNoteFill	$00
	dc.b		nFs5,	$0C,	nG5,	nRst
	smpsNoteFill	$06
	dc.b		nG5,	$06,	$06,	nA5,	nG5
	smpsNoteFill	$00
	dc.b		nE5,	$0C
	smpsNoteFill	$06
	dc.b		nC5,	$06,	nA4,	nC5,	$0C,	nRst,	nRst
	smpsNoteFill	$00
	smpsFMvoice	$1C
	smpsAlterVol	$FA
	dc.b		nE5,	nG5,	nE5
	smpsFMvoice	$1A
	smpsAlterVol	$06
	smpsNoteFill	$06
	dc.b		nF5,	$06,	nF5,	nRst,	nF5,	nRst,	nF5
	smpsNoteFill	$00
	dc.b		nFs5,	$0C,	nG5,	$06,	nRst,	nRst,	$24,	nRst
	dc.b		$30,	nRst
	smpsFMvoice	$1F
	smpsAlterPitch	$18
	smpsAlterVol	$F7
	smpsAlterNote	$00
	dc.b		nRst,	$06,	nG3,	nA3,	nRst,	nC4,	nRst,	nD4
	dc.b		nRst,	nEb4,	nRst,	nD4,	nRst,	nC4,	nD4,	nRst
	dc.b		nC4
	smpsAlterPitch	$F4
	smpsFMvoice	$00
	dc.b		nRst,	$0C,	nG3,	$06,	nA3,	nC4,	nRst,	$12
	dc.b		nG3,	$06,	nA3,	nC4,	nRst,	nEb4,	nC4,	nRst
	dc.b		nC4
	smpsAlterPitch	$0C
	smpsFMvoice	$1F
	dc.b		nRst,	$06,	nG4,	$12,	nEb4,	$06,	nRst,	nD4
	dc.b		nRst,	nEb4,	nRst,	nD4,	nRst,	nC4,	nA3,	nRst
	dc.b		nC4
	smpsAlterPitch	$F4
	smpsFMvoice	$00
	dc.b		nRst,	$06,	nBb3,	$12,	nA3,	$06,	nRst,	$12
	dc.b		nBb3,	$06,	nRst,	nA3,	nRst,	nBb3,	nC4,	nRst
	dc.b		nC4,	nRst,	$30,	nRst
	smpsFMvoice	$21
	smpsAlterPitch	$0C
	dc.b		nRst,	$30,	nRst,	$08,	nG2,	$04,	nF2,	$0C
	dc.b		nE2,	nD2,	nC2,	$08,	$04,	nE1,	$0C,	nF1
	dc.b		nFs1,	nG1,	nB1,	nC2,	nD2,	nE2,	nB1,	nAb1
	dc.b		nFs1,	nE1,	nB1,	nE2,	nE1,	nA1,	nB1,	nC2
	dc.b		nB1,	nA1,	nC2,	nE2,	nA1,	nAb1,	nBb1,	nC2
	dc.b		nBb1,	nAb1,	nA1,	nBb1,	nB1,	nC2,	nB1,	nC2
	dc.b		nD2,	nE2,	$08,	$04,	nB1,	$0C,	nE1,	nAb1
	dc.b		nA1,	nB1,	nC2,	nE2,	nF2,	$08,	nA1,	$10
	dc.b		nBb1,	$0C,	nB1
	smpsCall	music9E_Call07
	dc.b		nF2
	smpsAlterVol	$04
	smpsCall	music9E_Call07
	dc.b		nF2
	smpsAlterVol	$FC
	smpsCall	music9E_Call07
	dc.b		nF2,	$08,	nC2,	$04
	smpsFMvoice	$23
	smpsAlterPitch	$E8
	smpsAlterVol	$07
	dc.b		nRst,	$60
	smpsCall	music9E_Call08
	dc.b		nRst,	$60
	smpsAlterVol	$FB
	dc.b		nRst,	$0C,	nE6,	$06,	nRst,	nB6,	nE6,	$06
	dc.b		nRst,	$0C,	nE6,	$06,	nRst,	nB6,	nE6,	$06
	dc.b		nRst,	$18
	smpsAlterVol	$05
	dc.b		nRst,	$0C,	nA3,	nRst,	nA3,	nRst,	$24
	smpsAlterNote	$02
	smpsAlterVol	$08
	dc.b		nA2,	$6C
	smpsStop

music9E_Call02:
	dc.b		nC3,	$0C,	nC4,	$06,	nRst,	nC4,	$0C,	nG3
	dc.b		nD4,	$12,	nC4,	$0C,	nG3,	$06,	nA3,	nC4
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nD4,	$0C,	nA3
	dc.b		nE4,	$12,	nD4,	$06,	nRst,	nA3,	nB3,	nD4
	dc.b		nBb2,	$0C,	nBb3,	$06,	nRst,	nBb3,	$0C,	nF3
	dc.b		nC4,	$12,	nBb3,	$0C,	nF3,	$06,	nG3,	nBb3
	dc.b		nA2,	$0C,	nA3,	$06,	nA2,	nB2,	$0C,	nB3
	dc.b		$06,	nB2,	nC3,	$0C,	nC4,	$06,	nC3,	nA2
	dc.b		$0C
	smpsReturn

music9E_Call03:
	dc.b		nCs5,	$0C,	nB4,	$06,	nA4,	nB4,	nA4,	$04
	dc.b		smpsNoAttack,	$08,	nA4,	$04,	nRst,	$0E
	smpsFMvoice	$07
	dc.b		nFs4,	$06,	nCs4,	nE4,	nFs4
	smpsFMvoice	$00
	dc.b		nFs4,	nA4,	nCs5,	$0C,	nB4,	$06,	nA4,	nB4
	dc.b		nA4,	$0C,	nB4,	$04,	nRst,	$08,	nA4,	$04
	dc.b		nRst,	$08,	nB4,	$04,	nRst,	$08,	nCs5,	$12
	dc.b		nA4,	$06,	nFs4,	nRst,	nFs4,	nRst,	$24
	smpsFMvoice	$07
	dc.b		nFs4,	$06,	nCs4,	nE4,	nFs4,	nRst,	$0C,	nRst
	dc.b		$30,	nCs5,	$06,	nCs5,	nA4,	$04,	nRst,	$08
	dc.b		nB4,	$06,	nCs5
	smpsReturn

music9E_Call05:
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D
	smpsAlterPitch	$02
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D
	smpsAlterPitch	$01
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D
	smpsAlterPitch	$FC
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D
	smpsAlterPitch	$01
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D,	smpsNoAttack,	$30,	smpsNoAttack,	$30
	smpsReturn

music9E_Call06:
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nC4,	nRst,	nD4
	dc.b		$0C,	nD3,	$03,	nRst,	$06,	nD3,	$03,	nD4
	dc.b		$0C,	nC4,	nD4,	$09,	nA3,	$03,	nG3,	$06
	dc.b		nRst,	nG3,	$0C,	nA3,	$06,	nRst,	nA3,	$0C
	dc.b		nBb3,	$06,	nRst,	$27
	smpsReturn

music9E_Call08:
	dc.b		nRst,	$0C,	nCs6,	$15,	nRst,	$03,	nCs6,	$06
	dc.b		nRst,	nD6,	$0F,	nRst,	$03,	nB5,	$18,	nRst
	dc.b		$06,	nCs6,	nRst,	nCs6,	nRst,	nCs6,	nRst,	nA5
	dc.b		nRst,	nG5,	$0F,	nRst,	$03,	nB5,	$18,	nRst
	dc.b		$06
	smpsLoop	$00,	$02,	music9E_Call08
	smpsReturn

music9E_Call04:
	dc.b		nRst,	$12,	nG1,	nBb1,	$06,	nRst,	$18,	nC2
	dc.b		$12,	nG1,	$06,	nRst,	nRst,	$12,	nF1,	nA1
	dc.b		$06,	nRst,	$18,	nBb1,	$12,	nF1,	$06,	nRst
	smpsReturn

music9E_Call07:
	dc.b		nRst,	nC2,	nRst,	nC2,	nRst,	nF2,	nRst
	smpsReturn

music9E_Call01:
	smpsFMvoice	$07
	dc.b		nRst,	$54,	nBb5,	$04,	nB5,	nC6,	nCs6,	$24
	dc.b		nE6,	nA6,	$18,	nG6,	$24,	nFs6,	nD6,	$18
	dc.b		nD6,	$0C,	nCs6,	nRst,	nE6,	$60,	smpsNoAttack,	$3C
	dc.b		nCs6,	$24,	nE6,	nA6,	$18,	nB6,	$24,	nG6
	dc.b		nB6,	$18,	nB6,	$24,	nCs7,	$60,	smpsNoAttack,	$3C
	smpsReturn

; FM2 Data
music9E_FM2:
	dc.b		nRst,	$60
	smpsFMvoice	$01
	smpsNoteFill	$06
	smpsCall	music9E_Call09
	smpsCall	music9E_Call09
music9E_Loop04:
	dc.b		nE0,	$0C
	smpsLoop	$00,	$0C,	music9E_Loop04
	dc.b		nA0,	nFs0,	nG0,	nAb0
	smpsCall	music9E_Call09
music9E_Loop05:
	dc.b		nG0
	smpsLoop	$00,	$0B,	music9E_Loop05
music9E_Loop06:
	dc.b		nA0
	smpsLoop	$00,	$0A,	music9E_Loop06
	smpsNoteFill	$00
	smpsAlterVol	$FC
	dc.b		nA0,	nBb0,	nB0
	smpsAlterVol	$04
	smpsNoteFill	$09
music9E_Loop07:
	dc.b		nC1,	$0C
	smpsLoop	$00,	$0C,	music9E_Loop07
	smpsNoteFill	$00
	dc.b		nC1,	nA0,	nBb0,	nB0
	smpsNoteFill	$09
music9E_Loop08:
	dc.b		nC1,	$0C
	smpsLoop	$00,	$0C,	music9E_Loop08
	dc.b		nC1,	$06,	nC2
	smpsNoteFill	$00
	dc.b		nA0,	$0C,	nBb0,	nB0
	smpsAlterPitch	$E8
	smpsAlterVol	$0C
	smpsFMvoice	$04
music9E_Loop09:
	smpsCall	music9E_Call0A
	smpsLoop	$00,	$02,	music9E_Loop09
	smpsAlterVol	$F9
	smpsFMvoice	$08
music9E_Loop0D:
	smpsCall	music9E_Call0B
music9E_Loop0A:
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C
	smpsLoop	$00,	$02,	music9E_Loop0A
	dc.b		$06,	nEb2,	$12,	nE2,	$0C,	nF2
	smpsCall	music9E_Call0B
music9E_Loop0B:
	dc.b		nE2,	$04,	nRst,	$08,	nE2,	$0C
	smpsLoop	$00,	$02,	music9E_Loop0B
music9E_Loop0C:
	dc.b		nEb2,	$04,	nRst,	$08,	nEb2,	$0C
	smpsLoop	$00,	$02,	music9E_Loop0C
	smpsLoop	$01,	$02,	music9E_Loop0D
	dc.b		nRst,	$60,	nRst,	$48
	smpsFMvoice	$0C
	smpsAlterVol	$13
	smpsCall	music9E_Call0C
	dc.b		$24,	nRst,	$60
	smpsFMvoice	$0F
	smpsAlterVol	$F3
	smpsModSet	$04,	$02,	$03,	$02
	smpsCall	music9E_Call0D
	dc.b		nG5,	$18,	nFs5,	$30,	smpsNoAttack,	$18,	nRst,	$0C
	smpsCall	music9E_Call0D
	dc.b		nCs5
	smpsFMvoice	$13
	smpsAlterVol	$F5
	dc.b		smpsModOff,	nRst,	$60
music9E_Loop0E:
	smpsCall	music9E_Call0E
	dc.b		nEb3,	$0C,	nE3,	$08,	nAb2,	$10
	smpsCall	music9E_Call0E
	dc.b		nEb3,	$08,	nE3,	$04,	nRst,	$18
	smpsLoop	$00,	$02,	music9E_Loop0E
	dc.b		nRst,	$60
	smpsFMvoice	$17
	smpsAlterNote	$02
	smpsAlterPitch	$F4
	smpsAlterVol	$0A
	smpsCall	music9E_Call0F
	dc.b		nF6,	$15,	nE6,	$03,	nD6,	$06,	nRst,	nC6
	dc.b		$0C,	nE6,	$06,	nRst,	nC6,	$0C,	nD6,	$06
	dc.b		nRst,	$12,	nRst,	$60
	smpsFMvoice	$1B
	smpsAlterNote	$00
	smpsNoteFill	$06
	dc.b		nRst,	$3C,	nG4,	$06,	$06,	nA4,	nC5,	nC5
	dc.b		nA4
	smpsFMvoice	$1D
	smpsAlterVol	$FA
	smpsNoteFill	$00
	smpsCall	music9E_Call10
	dc.b		nRst
	smpsCall	music9E_Call11
	smpsCall	music9E_Call10
	smpsFMvoice	$1C
	dc.b		nC5
	smpsFMvoice	$1D
	smpsCall	music9E_Call11
	dc.b		nRst,	$30,	nRst
	smpsFMvoice	$01
	smpsAlterPitch	$18
	smpsAlterVol	$F9
music9E_Loop0F:
	dc.b		nC2,	$0C,	nC3,	$06,	nRst,	nA1,	$0C,	nA2
	dc.b		$06,	nRst,	nBb1,	$0C,	nBb2,	$06,	nRst,	nB1
	dc.b		$0C,	nEb3,	$06,	nD3,	nC2,	$06,	nC2,	$12
	dc.b		nA1,	$0C,	nA2,	$06,	nRst,	nBb1,	$0C,	nBb2
	dc.b		$06,	nRst,	nB1,	$0C,	nB2,	$06,	nRst
	smpsLoop	$00,	$02,	music9E_Loop0F
	dc.b		nRst,	$60
	smpsFMvoice	$22
	smpsAlterPitch	$E8
	smpsAlterVol	$03
	smpsModSet	$1C,	$01,	$06,	$04
	dc.b		nRst,	$50,	nG3,	$04,	nA3,	$08,	nC4,	$04
	dc.b		nE4,	$30,	nRst,	$0C,	nE4,	$08,	nRst,	$04
	dc.b		nF4,	$08,	nE4,	$10,	nAb4,	$08,	$04,	nRst
	dc.b		$08,	nE4,	$34,	nRst,	$0C,	nE4,	nA4,	$08
	dc.b		$04,	nRst,	$08,	nE4,	$04,	nC4,	$24,	nRst
	dc.b		$0C,	nC4,	$08,	nRst,	$04,	nD4,	$08,	nC4
	dc.b		$04,	nEb4,	$0C,	nD4,	$08,	nC4,	$4C,	nRst
	dc.b		$0C,	nE4,	$08,	nRst,	$04,	nF4,	$08,	nRst
	dc.b		$04,	nE4,	$08,	nRst,	$04,	nAb4,	$08,	$04
	dc.b		nRst,	$08,	nE4,	$1C,	nRst,	$0C,	nA4,	$18
	dc.b		nB4,	$08,	nA4,	$04,	nC5,	$18,	nRst,	$0C
	dc.b		nA4,	$04,	nRst,	$08,	nG4,	$18,	nE4,	nC4
	dc.b		nD4,	$0C
	smpsAlterVol	$04
	smpsCall	music9E_Call12
	dc.b		nD4,	$0C
	smpsAlterVol	$FC
	smpsCall	music9E_Call12
	dc.b		nD4,	$14,	nC4,	$04
	smpsAlterVol	$FF
	smpsFMvoice	$24
	dc.b		smpsModOff,	nRst,	$60
music9E_Loop10:
	smpsCall	music9E_Call13
	dc.b		nG3,	$12,	nFs3,	$0C,	nG3,	$06,	nFs3,	$0C
	smpsCall	music9E_Call13
	dc.b		nD4,	$12,	nCs4,	$0C,	nD4,	$06,	nCs4,	$0C
	smpsLoop	$00,	$02,	music9E_Loop10
	dc.b		nG3,	$06,	nRst,	nE3,	nRst,	nF3,	nRst,	nFs3
	dc.b		nRst,	nG3,	nG3,	nE3,	nRst,	nF3,	nRst,	nG3
	dc.b		nRst,	nE3,	nRst,	nE3,	nRst,	nAb3,	nRst,	nAb3
	dc.b		nRst,	nB3,	nRst,	nB3,	nRst,	nD4,	nRst,	nD4
	dc.b		nRst,	nRst,	$0C,	nA2,	$12,	nRst,	$06,	nA2
	dc.b		$12,	nAb3,	nA3,	$06,	nRst
	smpsAlterVol	$FD
	dc.b		nA2,	$6C
	smpsStop

music9E_Call0A:
	dc.b		nRst,	$0C,	nG5,	$06,	nRst,	nA5,	nRst,	nG5
	dc.b		nRst,	nC6,	nRst,	nC6,	nRst,	nD6,	nE6,	nRst
	dc.b		$0C,	nRst,	nD6,	$18,	nA5,	$06,	nRst,	nC6
	dc.b		nC6,	nRst,	nD6,	$0C,	nRst,	$12,	nRst,	$1E
	dc.b		nBb5,	$06,	nC6,	nBb5,	nD6,	nRst,	nC6,	nRst
	dc.b		nBb5,	nC6,	nRst,	nA5,	smpsNoAttack,	nA5,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18
	smpsReturn

music9E_Call0B:
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C
	smpsLoop	$00,	$03,	music9E_Call0B
	dc.b		$06,	nFs3,	nFs2,	$0C
	smpsReturn

music9E_Call0C:
	dc.b		nG4,	$08,	nA4,	nB4,	nF4,	$30,	smpsNoAttack,	$30
	dc.b		smpsNoAttack,	nF4,	nRst,	$18,	nG4,	$08,	nA4,	nB4
	dc.b		nF4,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$30,	smpsNoAttack
	smpsReturn

music9E_Call0D:
	dc.b		nD5,	$06,	nC5,	nD5,	$12,	nF5,	nD5,	$0C
	dc.b		nE5,	nRst,	$06,	$12,	nG5,	$0C,	nF5,	$06
	dc.b		nRst,	nC6,	nA5,	$3C,	nRst,	$06,	$0C,	nBb5
	dc.b		$12,	nA5,	nG5,	$06,	nF5,	nE5,	$18
	smpsReturn

music9E_Call0F:
	dc.b		nF6,	$15,	nE6,	$03,	nD6,	$06,	nRst,	nC6
	dc.b		$0C,	nE6,	$06,	nRst,	nC6,	$0C,	nD6,	$06
	dc.b		nRst,	$12,	nRst,	$60
	smpsReturn

music9E_Call0E:
	dc.b		nA2,	$0C,	nA3,	nG3,	$08,	nA3,	$04,	nG3
	dc.b		$08,	nE3,	$04,	nD3,	$08,	$04
	smpsReturn

music9E_Call10:
	dc.b		nRst,	$0C,	nC4,	nA3,	$06,	$06,	nG3,	$0C
	dc.b		nRst,	nB3,	nA3,	$06,	$06,	nG3,	$0C
	smpsReturn

music9E_Call11:
	dc.b		nA3,	nG3,	$06,	$06,	nF3,	$0C,	nRst,	nG3
	dc.b		$0C,	$06,	$06,	nA3,	nG3
	smpsReturn

music9E_Call12:
	dc.b		nA4,	$04,	nRst,	$08,	nG4,	$18,	nE4,	nC4
	smpsReturn

music9E_Call13:
	dc.b		nA3,	$06,	nRst,	nA3,	nRst,	nE3,	nRst,	nE3
	dc.b		nRst
	smpsReturn

music9E_Call09:
	dc.b		nA0,	$0C
	smpsLoop	$00,	$08,	music9E_Call09
	smpsReturn

; FM3 Data
music9E_FM3:
	dc.b		nRst,	$60
	smpsCall	music9E_Call14
	smpsAlterPitch	$18
	smpsFMvoice	$02
	smpsCall	music9E_Call15
	dc.b		nG4,	$3C
	smpsCall	music9E_Call15
	dc.b		nC5,	$3C
	smpsAlterPitch	$E8
	smpsAlterVol	$02
	smpsAlterNote	$03
	smpsFMvoice	$04
	smpsPan		panLeft,	$00
music9E_Loop11:
	smpsCall	music9E_Call0A
	smpsLoop	$00,	$02,	music9E_Loop11
	smpsFMvoice	$09
	smpsAlterPitch	$0C
	smpsAlterVol	$FD
	smpsPan		panRight,	$00
	smpsModSet	$06,	$01,	$05,	$04
	smpsAlterNote	$00
music9E_Loop12:
	dc.b		nFs2,	$0C,	nFs3,	$06,	nRst,	nE3,	nRst,	nFs3
	dc.b		nFs2,	nRst,	nFs2,	nFs3,	nRst,	nE3,	nRst,	nFs3
	dc.b		$0C
	smpsLoop	$00,	$03,	music9E_Loop12
	dc.b		nE2,	$0C,	nE3,	$06,	nRst,	nEb3,	nRst,	nE3
	dc.b		nEb2,	nRst,	nEb2,	nEb3,	nRst,	nCs3,	nRst,	nEb3
	dc.b		$0C
	smpsLoop	$01,	$02,	music9E_Loop12
	dc.b		nRst,	$60
	smpsFMvoice	$0D
	smpsAlterVol	$FB
	smpsPan		panCentre,	$00
	dc.b		smpsModOff,	nRst,	$60
music9E_Loop13:
	smpsCall	music9E_Call16
	smpsLoop	$00,	$02,	music9E_Loop13
	dc.b		nRst,	$60
	smpsFMvoice	$0F
	smpsPan		panLeft,	$00
	smpsAlterVol	$0B
	smpsCall	music9E_Call0D
	dc.b		nG5,	$18,	nFs5,	$48,	nRst,	$0C
	smpsCall	music9E_Call0D
	dc.b		nCs5,	$0C
	smpsModSet	$18,	$01,	$03,	$04
	smpsAlterVol	$F3
	smpsPan		panCentre,	$00
	smpsFMvoice	$14
	dc.b		nA2,	$14,	nB2,	$04,	nC3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nG3,	$08,	nE3,	$10
music9E_Loop14:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0A,	music9E_Loop14
	smpsFMvoice	$18
	smpsAlterPitch	$F4
	smpsAlterVol	$08
	dc.b		smpsModOff
	smpsPan		panRight,	$00
	dc.b		nRst,	$60,	nRst,	$30,	nA5,	$06,	nRst,	nF5
	dc.b		$0C,	nG5,	$09,	nF5,	$03,	nD5,	$0C,	nRst
	dc.b		$60,	nRst,	$3C,	nRst,	$60
	smpsFMvoice	$1B
	smpsAlterVol	$FB
	smpsPan		panCentre,	$00
	smpsNoteFill	$06
	dc.b		nG5,	$06,	$06,	nA5,	nC6,	nC6,	nA5
	smpsNoteFill	$00
	dc.b		nE6,	$0C
	smpsNoteFill	$06
	dc.b		nC6,	$06,	nA5,	nC6,	$0C,	nRst,	nRst,	$12
	smpsFMvoice	$1C
	smpsNoteFill	$00
	dc.b		nC5,	nA4,	$0C
	smpsNoteFill	$06
	smpsFMvoice	$1B
	dc.b		nF6,	$06,	nF6,	nRst,	nF6,	nRst,	nF6
	smpsNoteFill	$00
	dc.b		nFs6,	$0C,	nG6,	nRst
	smpsNoteFill	$06
	dc.b		nG6,	$06,	$06,	nA6,	nG6
	smpsNoteFill	$00
	dc.b		nE6,	$0C
	smpsNoteFill	$06
	dc.b		nC6,	$06,	nA5,	nC6,	$0C
	smpsNoteFill	$00
	smpsFMvoice	$1C
	dc.b		nRst,	$1E,	nF5,	$0C,	nF5,	nC5,	$06,	nRst
	dc.b		$60,	nRst,	$60
	smpsFMvoice	$00
	smpsAlterPitch	$18
	dc.b		nRst,	$60,	nRst,	$0C,	nG3,	$06,	nA3,	nC4
	dc.b		nRst,	$12,	nG3,	$06,	nA3,	nC4,	nRst,	nEb4
	dc.b		nC4,	nRst,	nC4,	nRst,	$60,	nRst,	$06,	nBb3
	dc.b		$12,	nA3,	$06,	nRst,	$12,	nBb3,	$06,	nRst
	dc.b		nA3,	nRst,	nBb3,	nC4,	nRst,	nC4,	nRst,	$60
	smpsFMvoice	$22
	smpsAlterPitch	$DC
	smpsAlterVol	$FF
	smpsPan		panLeft,	$00
	dc.b		nRst,	$60
	smpsCall	music9E_Call17
	dc.b		nE6,	$30,	nD6,	$18,	nE6,	$0C,	nD6,	nC6
	dc.b		$30,	nF6
	smpsCall	music9E_Call18
	smpsAlterVol	$04
	smpsCall	music9E_Call18
	smpsAlterVol	$FC
	dc.b		nRst,	nG5,	nRst,	nG5,	nRst,	nA5,	$18,	$08
	dc.b		nG5,	$04
	smpsAlterPitch	$0C
	smpsAlterVol	$FF
	smpsPan		panCentre,	$00
	smpsFMvoice	$00
	dc.b		nRst,	$60
music9E_Loop15:
	smpsCall	music9E_Call19
	dc.b		nD6,	$12,	nD6,	$1E
	smpsCall	music9E_Call19
	dc.b		nG6,	$12,	nG6,	$1E
	smpsLoop	$00,	$02,	music9E_Loop15
	dc.b		nRst,	$0C,	nD6,	$12,	nRst,	$06,	nD6,	nRst
	dc.b		nCs6,	$12,	nD6,	nCs6,	$0C,	nAb5,	$18,	nB5
	dc.b		nD6,	nAb6,	nRst,	$0C,	nE6,	nRst,	nE6,	$12
	dc.b		nEb6,	nE6,	$06,	nRst
	smpsAlterVol	$F8
	smpsFMvoice	$01
	smpsAlterNote	$03
	dc.b		nA2,	$6C
	smpsStop

music9E_Call16:
	dc.b		nRst,	$60,	nB4,	$06,	nC5,	nB4,	nG4,	nA4
	dc.b		nF4,	$0C,	nG4,	nD4,	nD4,	$06,	nF4,	$0C
	dc.b		nG4
	smpsReturn

music9E_Call17:
	dc.b		nRst,	$0C,	nE6,	$04,	nRst,	$10,	nE6,	$04
	dc.b		nRst,	$0C,	nE6,	$0C,	nF6,	$08,	nE6,	$04
	dc.b		nRst,	$18,	nRst,	$0C,	nD6,	$04,	nRst,	$10
	dc.b		nD6,	$04,	nRst,	$0C,	nD6,	$0C,	nE6,	$08
	dc.b		nD6,	$04,	nRst,	$18
music9E_Loop16:
	dc.b		nRst,	$0C,	nC6,	$04,	nRst,	$10,	nC6,	$04
	dc.b		nRst,	$0C,	nC6,	$0C,	nD6,	$08,	nC6,	$04
	dc.b		nRst,	$18
	smpsLoop	$00,	$02,	music9E_Loop16
	smpsReturn

music9E_Call15:
	dc.b		nRst,	$18,	nG4,	$0B,	nRst,	$0D,	nA4,	$0C
	dc.b		$0B,	nRst,	$19,	nC5,	$0C,	$0B,	nRst,	$0D
	smpsReturn

music9E_Call18:
	dc.b		nRst,	$0C,	nG5,	nRst,	nG5,	nRst,	nA5,	nRst
	dc.b		nA5
	smpsReturn

music9E_Call19:
	dc.b		nE6,	$06,	nRst,	nE6,	nRst,	nCs6,	nRst,	nCs6
	dc.b		nRst
	smpsReturn

music9E_Call14:
	smpsFMvoice	$05
	smpsAlterPitch	$F4
	dc.b		nA5,	$60,	nD6,	nE6,	smpsNoAttack,	nE6,	nA5,	$60
	dc.b		nG6,	nG6,	$24,	nA6,	$60,	smpsNoAttack,	$3C
	smpsReturn

; FM4 Data
music9E_FM4:
	dc.b		nRst,	$60
	smpsAlterPitch	$FB
	smpsAlterVol	$FE
	smpsCall	music9E_Call14
	smpsAlterPitch	$1D
	smpsAlterVol	$02
	smpsFMvoice	$02
	smpsCall	music9E_Call1A
	dc.b		nE4,	$3C
	smpsCall	music9E_Call1A
	dc.b		nG4,	$3C
	smpsAlterVol	$06
	smpsFMvoice	$05
	smpsModSet	$02,	$01,	$FE,	$04
music9E_Loop17:
	dc.b		nE5,	$30,	smpsNoAttack,	$30,	nFs5,	smpsNoAttack,	$30,	nD5
	dc.b		smpsNoAttack,	$30,	nC5,	smpsNoAttack,	$30
	smpsLoop	$00,	$02,	music9E_Loop17
	smpsFMvoice	$0A
	smpsAlterPitch	$F4
	smpsAlterVol	$F7
	smpsModSet	$0C,	$01,	$FB,	$04
music9E_Loop18:
	smpsCall	music9E_Call1B
	dc.b		nRst,	$25,	nFs5,	$06,	nFs5,	nRst,	$0C,	nFs5
	dc.b		$06,	nFs5,	$05,	nRst,	$0D,	nFs5,	$06,	nAb5
	dc.b		$30,	smpsNoAttack,	$06
	smpsCall	music9E_Call1B
	dc.b		nRst,	$31,	nRst,	$60
	smpsLoop	$00,	$02,	music9E_Loop18
	dc.b		nRst,	$60,	nRst,	$48
	smpsFMvoice	$0C
	smpsAlterVol	$05
	dc.b		smpsModOff
	smpsAlterNote	$02
	smpsPan		panLeft,	$00
	smpsCall	music9E_Call0C
	dc.b		$24,	nRst,	$0C,	nRst,	$60
	smpsFMvoice	$10
	smpsAlterVol	$F7
	smpsAlterNote	$00
	smpsPan		panRight,	$00
	smpsCall	music9E_Call1C
	dc.b		nD4,	nFs4,	$06,	nA3,	$0C,	nC4,	nD4,	nFs4
	dc.b		$06,	nRst,	nFs4,	nA3,	$0C,	nC4
	smpsCall	music9E_Call1C
	smpsFMvoice	$15
	smpsAlterVol	$01
	smpsCall	music9E_Call1D
music9E_Loop19:
	smpsFMvoice	$14
	dc.b		nRst,	$4E
	smpsPan		panRight,	$00
	dc.b		nAb2,	$12,	nA2,	$06
	smpsPan		panCentre,	$00
	smpsFMvoice	$16
	dc.b		nRst,	$30,	nRst,	$06,	nA4,	$08,	nAb4,	$04
	dc.b		nG4,	$08,	nFs4,	$04,	nF4,	$08,	nE4,	$04
	smpsLoop	$00,	$02,	music9E_Loop19
	dc.b		nRst,	$60
	smpsFMvoice	$17
	smpsAlterPitch	$F4
	smpsAlterVol	$02
	smpsPan		panCentre,	$00
	smpsModSet	$01,	$01,	$03,	$03
music9E_Loop1A:
	smpsCall	music9E_Call0F
	smpsLoop	$00,	$02,	music9E_Loop1A
	dc.b		nRst,	$60
	smpsFMvoice	$1E
	smpsPan		panRight,	$00
	smpsAlterVol	$FE
	smpsAlterPitch	$F4
	dc.b		smpsModOff
	smpsNoteFill	$06
	dc.b		nRst,	$0C,	nE5,	$06,	$12,	$18,	nG5,	$06
	dc.b		$12,	$0C
	smpsFMvoice	$1C
	smpsPan		panCentre,	$00
	smpsAlterVol	$FA
	smpsNoteFill	$00
	dc.b		nA5
	smpsNoteFill	$06
	smpsAlterVol	$06
	smpsFMvoice	$1E
	smpsPan		panRight,	$00
	dc.b		nF5,	$06,	$12,	$18,	nG5,	$06,	$12,	$18
	dc.b		nE5,	$06,	$12,	$18,	nG5,	$06,	$12,	$0C
	smpsFMvoice	$1A
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	dc.b		nA5,	$06,	nA5,	nRst,	nA5,	nRst,	nA5
	smpsNoteFill	$00
	dc.b		nBb5,	$0C,	nB5,	$06
	smpsFMvoice	$1E
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	dc.b		nRst,	nG5,	$06,	$12,	$0C,	nRst,	$60
	smpsFMvoice	$20
	smpsAlterPitch	$18
	smpsAlterVol	$FA
	smpsPan		panCentre,	$00
	smpsNoteFill	$00
	dc.b		nEb4,	$03,	smpsNoAttack,	nF4,	$5D,	nD4,	$03,	smpsNoAttack
	dc.b		nE4,	$5D,	nC4,	$03,	smpsNoAttack,	nD4,	$5D,	nD4
	dc.b		$03,	smpsNoAttack,	nE4,	$5D,	nRst,	$60
	smpsFMvoice	$22
	smpsPan		panRight,	$00
	smpsAlterPitch	$E8
	smpsAlterVol	$04
	dc.b		nRst,	$30,	nRst
	smpsCall	music9E_Call1E
	dc.b		nC6,	$30,	nB5,	$18,	nC6,	$0C,	nB5,	nA5
	dc.b		$30,	nC6,	nRst,	$0C,	nE5,	nRst,	nE5,	nRst
	dc.b		nF5,	nRst,	nF5
	smpsAlterVol	$04
	dc.b		nRst,	nE5,	nRst,	nE5,	nRst,	nF5,	nRst,	nF5
	smpsAlterVol	$FC
	dc.b		nRst,	nE5,	nRst,	nE5,	nRst,	nF5,	$18,	$08
	dc.b		nE5,	$04
	smpsAlterPitch	$0C
	smpsAlterVol	$FF
	smpsPan		panCentre,	$00
	smpsFMvoice	$00
	dc.b		nRst,	$60
music9E_Loop1B:
	smpsCall	music9E_Call1F
	dc.b		nB5,	$12,	nB5,	$1E
	smpsCall	music9E_Call1F
	dc.b		nD6,	$12,	nD6,	$1E
	smpsLoop	$00,	$02,	music9E_Loop1B
	smpsAlterNote	$03
	smpsAlterVol	$08
	smpsCall	music9E_Call20
	smpsAlterVol	$F0
	smpsFMvoice	$01
	smpsModSet	$00,	$01,	$06,	$04
	dc.b		nA2,	$6C
	smpsStop

music9E_Call1D:
	dc.b		nA2,	$14,	nB2,	$04,	nC3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nG3,	$08,	nE3,	$10
	smpsReturn

music9E_Call1E:
	dc.b		nRst,	$0C,	nC6,	$04,	nRst,	$10,	nC6,	$04
	dc.b		nRst,	$0C,	nC6,	$0C,	nD6,	$08,	nC6,	$04
	dc.b		nRst,	$18,	nRst,	$0C,	nB5,	$04,	nRst,	$10
	dc.b		nB5,	$04,	nRst,	$0C,	nB5,	$0C,	nC6,	$08
	dc.b		nB5,	$04,	nRst,	$18,	nRst,	$0C,	nA5,	$04
	dc.b		nRst,	$10,	nA5,	$04,	nRst,	$0C,	nA5,	$0C
	dc.b		nB5,	$08,	nA5,	$04,	nRst,	$18,	nRst,	$0C
	dc.b		nAb5,	$04,	nRst,	$10,	nAb5,	$04,	nRst,	$0C
	dc.b		nAb5,	$0C,	nBb5,	$08,	nAb5,	$04,	nRst,	$18
	smpsReturn

music9E_Call20:
	smpsFMvoice	$25
	dc.b		nRst,	$0C,	nG6,	nB6,	nD7,	nFs7,	$0C,	nRst
	dc.b		$06,	nFs7,	$0C,	nG7,	$06,	nFs7,	$0C,	nAb7
	dc.b		$60,	nA7,	$0C,	nRst,	nA7,	nRst,	nRst,	$06
	dc.b		nAb7,	$12,	nA7,	$0C
	smpsReturn

music9E_Call1A:
	dc.b		nRst,	$18,	nE4,	$0B,	nRst,	$0D,	nFs4,	$0C
	dc.b		$0B,	nRst,	$19,	nA4,	$0C,	$0B,	nRst,	$0D
	smpsReturn

music9E_Call1B:
	dc.b		nFs5,	$05,	nRst,	$13,	nFs5,	$12,	nFs5,	$05
	smpsReturn

music9E_Call1F:
	dc.b		nCs6,	$06,	nRst,	nCs6,	nRst,	nA5,	nRst,	nA5
	dc.b		nRst
	smpsReturn

music9E_Call1C:
	dc.b		nBb3,	$0C,	nD4,	$06,	nF4,	$0C,	nBb3,	nC4
	dc.b		$06,	nRst,	nC4,	$0C,	nE4,	$06,	nG4,	$0C
	dc.b		nC4,	$06,	nRst,	nF4,	$0C,	nA4,	$06,	nC4
	dc.b		$0C,	nE4,	nF4,	nA4,	$06,	nRst,	nA4,	nBb3
	dc.b		$0C,	nD4,	nE4,	nG4,	$06,	nCs4,	$0C,	nD4
	dc.b		nE4,	nG4,	$06,	nRst,	nG4,	nCs4,	$0C,	nE4
	smpsReturn

; FM5 Data
music9E_FM5:
	smpsAlterPitch	$E8
	smpsAlterVol	$F8
	smpsAlterNote	$05
	smpsCall	music9E_Call01
	smpsAlterPitch	$18
	smpsAlterVol	$08
	smpsAlterNote	$00
	smpsFMvoice	$02
	smpsModSet	$0C,	$01,	$FC,	$04
	smpsCall	music9E_Call21
	dc.b		nC4,	$3C
	smpsCall	music9E_Call21
	dc.b		nE4,	$3C
	smpsAlterPitch	$F4
	smpsAlterVol	$07
	smpsModSet	$30,	$01,	$04,	$04
	smpsFMvoice	$06
music9E_Loop1C:
	dc.b		nG5,	$30,	smpsNoAttack,	$30,	nA5,	smpsNoAttack,	$30,	nF5
	dc.b		smpsNoAttack,	$30,	nE5,	smpsNoAttack,	$30
	smpsLoop	$00,	$02,	music9E_Loop1C
	smpsFMvoice	$0A
	smpsAlterVol	$F6
	smpsModSet	$0C,	$01,	$05,	$04
	smpsPan		panLeft,	$00
music9E_Loop1D:
	smpsCall	music9E_Call22
	dc.b		nRst,	$25,	nA5,	$06,	nA5,	nRst,	$0C,	nA5
	dc.b		$06,	nA5,	$05,	nRst,	$0D,	nA5,	$06,	nB5
	dc.b		$30,	smpsNoAttack,	$06
	smpsCall	music9E_Call22
	dc.b		nRst,	$31,	nRst,	$60
	smpsLoop	$00,	$02,	music9E_Loop1D
	dc.b		nRst,	$60,	nRst,	$48
	smpsAlterVol	$05
	dc.b		smpsModOff,	nRst,	$01
	smpsFMvoice	$0C
	smpsAlterNote	$FE
	smpsPan		panRight,	$00
	smpsCall	music9E_Call0C
	dc.b		$23,	nRst,	$0C,	nRst,	$60
	smpsFMvoice	$11
	smpsAlterPitch	$F4
	smpsAlterVol	$F4
	smpsAlterNote	$00
	smpsPan		panCentre,	$00
	smpsModSet	$06,	$01,	$06,	$05
	dc.b		nRst,	$60,	nRst,	$30,	nF5,	$06,	nF5,	nC6
	dc.b		nA5,	$1E,	nRst,	$60,	nRst,	$06,	nD6,	nRst
	dc.b		nD6,	nC6,	nRst,	nC6,	nRst,	nBb5,	nRst,	nBb5
	dc.b		nRst,	nA5,	$03,	nRst,	nA5,	nRst,	$09,	nRst
	dc.b		$06,	nRst,	$60,	nRst,	$30,	nF5,	$06,	nF5
	dc.b		nC6,	nA5,	$1E,	nRst,	$60
	smpsFMvoice	$16
	smpsAlterPitch	$0C
	smpsAlterVol	$04
	dc.b		smpsModOff
	smpsPan		panLeft,	$00
	dc.b		nRst,	$01
	smpsCall	music9E_Call1D
	dc.b		nRst,	$2F
	smpsCall	music9E_Call23
	dc.b		nRst,	$30
	smpsCall	music9E_Call23
	dc.b		nRst,	$60
	smpsFMvoice	$19
	smpsAlterPitch	$F4
	smpsPan		panCentre,	$00
	smpsCall	music9E_Call24
	dc.b		nRst,	$27,	nC4,	$03
	smpsCall	music9E_Call24
	dc.b		nRst,	$2A,	nRst,	$60
	smpsFMvoice	$1E
	smpsAlterPitch	$F4
	smpsNoteFill	$06
music9E_Loop1E:
	dc.b		nRst,	$0C,	nG5,	$06,	$12,	$18,	nB5,	$06
	dc.b		$12,	$0C,	nRst,	nA5,	$06,	$12,	$18,	nB5
	dc.b		$06,	$12,	$0C
	smpsLoop	$00,	$02,	music9E_Loop1E
	dc.b		nRst,	$60
	smpsFMvoice	$20
	smpsNoteFill	$00
	smpsAlterPitch	$18
	smpsAlterVol	$FA
	dc.b		nG4,	$03,	smpsNoAttack,	nA4,	$5D,	nF4,	$03,	smpsNoAttack
	dc.b		nG4,	$5D,	nEb4,	$03,	smpsNoAttack,	nF4,	$5D,	nF4
	dc.b		$03,	smpsNoAttack,	nG4,	$5D,	nRst,	$60
	smpsFMvoice	$22
	smpsAlterPitch	$F4
	smpsAlterVol	$05
	smpsModSet	$1C,	$01,	$06,	$04
	dc.b		nRst,	$50,	nD3,	$04,	nE3,	$08,	nG3,	$04
	dc.b		nC4,	$30,	nRst,	$0C,	nC4,	$08,	nRst,	$04
	dc.b		nD4,	$08,	nC4,	$10,	nE4,	$08,	nE4,	$04
	dc.b		nRst,	$08,	nB3,	$34,	nRst,	$0C,	nB3,	nE4
	dc.b		$08,	$04,	nRst,	$08,	nC4,	$04,	nA3,	$24
	dc.b		nRst,	$0C,	nA3,	$08,	nRst,	$04,	nB3,	$08
	dc.b		nA3,	$04,	nC4,	$0C,	nBb3,	$08,	nAb3,	$4C
	dc.b		nRst,	$0C,	nC4,	$08,	nRst,	$04,	nD4,	$08
	dc.b		nRst,	$04,	nC4,	$08,	nRst,	$04,	nE4,	$08
	dc.b		nE4,	$04,	nRst,	$08,	nB3,	$1C,	nRst,	$0C
	dc.b		nE4,	$18,	nG4,	$08,	nE4,	$04,	nA4,	$18
	dc.b		nRst,	$0C,	nF4,	$04,	nRst,	$08,	nE4,	$18
	dc.b		nC4,	nA3,	nB3,	$0C
	smpsAlterVol	$04
	dc.b		nF4,	$04,	nRst,	$08,	nE4,	$18,	nC4,	nA3
	dc.b		nB3,	$0C
	smpsAlterVol	$F8
	dc.b		nF4,	$04,	nRst,	$08,	nE4,	$18,	nC4,	nA3
	dc.b		nF3,	$14,	nE3,	$04
	smpsAlterVol	$0C
	smpsFMvoice	$23
	smpsAlterNote	$03
	smpsAlterVol	$F7
	dc.b		nRst,	$60
	smpsCall	music9E_Call08
	smpsAlterVol	$09
	smpsModSet	$00,	$01,	$06,	$04
	smpsCall	music9E_Call20
	smpsStop

music9E_Call23:
	dc.b		nRst,	$1E
	smpsFMvoice	$14
	dc.b		nB2,	$12,	nC3,	$06
	smpsFMvoice	$16
	dc.b		nRst,	$30,	nRst,	$06,	nC5,	$08,	nB4,	$04
	dc.b		nBb4,	$08,	nA4,	$04,	nAb4,	$08,	nG4,	$04
	smpsReturn

music9E_Call21:
	dc.b		nRst,	$18,	nC4,	$0B,	nRst,	$0D,	nD4,	$0C
	dc.b		$0B,	nRst,	$19,	nF4,	$0C,	$0B,	nRst,	$0D
	smpsReturn

music9E_Call22:
	dc.b		nA5,	$05,	nRst,	$13,	nA5,	$12,	nA5,	$05
	smpsReturn

music9E_Call24:
	dc.b		nRst,	$60,	nG3,	$06,	nRst,	nG3,	$0C,	nA3
	dc.b		$06,	nRst,	nA3,	$0C,	nBb3,	$06
	smpsReturn

; PSG1 Data
music9E_PSG1:
	dc.b		nRst,	$30
	smpsLoop	$00,	$1A,	music9E_PSG1
music9E_Loop1F:
	dc.b		nG5,	$30,	smpsNoAttack,	$30,	nA5,	smpsNoAttack,	$30,	nF5
	dc.b		smpsNoAttack,	$30,	nE5,	smpsNoAttack,	$30
	smpsLoop	$00,	$02,	music9E_Loop1F
music9E_Loop20:
	dc.b		nRst,	$30
	smpsLoop	$00,	$10,	music9E_Loop20
	dc.b		nRst,	$60
music9E_Loop21:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0A,	music9E_Loop21
	dc.b		nRst,	$60
	smpsAlterPitch	$F4
	smpsAlterVol	$FE
	smpsPSGvoice	$01
	smpsCall	music9E_Call25
	dc.b		nA3,	nD4,	$06,	nG3,	$0C,	nA3,	nA3,	nD4
	dc.b		$06,	nRst,	nD4,	nFs3,	$0C,	nA3
	smpsCall	music9E_Call25
	smpsPSGvoice	$00
	dc.b		nRst,	$04,	nRst,	$60
	smpsCall	music9E_Call05
	dc.b		smpsNoAttack,	$20,	smpsNoAttack,	nAb5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack
	dc.b		nFs5,	smpsNoAttack,	nF5,	smpsNoAttack,	nE5,	smpsNoAttack,	nEb5,	smpsNoAttack
	dc.b		nD5,	smpsNoAttack,	nCs5,	smpsNoAttack,	nC5,	smpsNoAttack,	nB4,	smpsNoAttack
	dc.b		nBb4,	smpsNoAttack,	nA4,	nRst,	$60
	smpsPSGvoice	$00
	smpsNoteFill	$06
	smpsAlterPitch	$F4
	smpsCall	music9E_Call26
	dc.b		nF5,	nRst,	nF5
	smpsCall	music9E_Call26
	dc.b		nF5,	$04,	nRst,	nF5,	nRst,	$0C,	nF5,	nRst
	dc.b		$60
	smpsPSGvoice	$08
	smpsAlterPitch	$04
	smpsSetVol	$02
	smpsNoteFill	$06
music9E_Loop22:
	smpsCall	music9E_Call27
	smpsLoop	$00,	$02,	music9E_Loop22
music9E_Loop23:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0A,	music9E_Loop23
	dc.b		nRst,	$60
	smpsPSGvoice	$00
	smpsAlterPitch	$F0
	smpsSetVol	$FF
	dc.b		nRst,	$60
	smpsCall	music9E_Call17
	smpsAlterPitch	$18
	smpsSetVol	$02
	dc.b		nE4,	$30,	nD4,	$18,	nE4,	$0C,	nD4,	nC4
	dc.b		$30,	nF4
	smpsSetVol	$FE
	dc.b		nRst,	$0C,	nG4,	nRst,	nG4,	nRst,	nA4,	nRst
	dc.b		nA4
	smpsSetVol	$03
	dc.b		nG5,	$18,	nE5,	nC5,	nD5,	$0C,	nRst
	smpsSetVol	$FC
	dc.b		nRst,	nG4,	nRst,	nG4,	nRst,	nA4,	$18,	$08
	dc.b		nG4,	$04
	smpsAlterPitch	$F4
	smpsSetVol	$01
	smpsPSGvoice	$05
music9E_Loop24:
	dc.b		nRst,	$60
	smpsLoop	$00,	$05,	music9E_Loop24
	dc.b		nRst,	$0C,	nB5,	$12,	nRst,	$06,	nB5,	nRst
	dc.b		nA5,	$12,	nB5,	nA5,	$0C,	nE5,	$18,	nAb5
	dc.b		nB5,	nD6,	nRst,	$0C,	nCs6,	nRst,	nCs6,	$12
	dc.b		nC6,	nCs6,	$06,	nRst,	$09
	smpsAlterPitch	$30
	smpsSetVol	$FC
	smpsJump	music9E_Jump01
	smpsStop

music9E_Call27:
	dc.b		nRst,	$0C,	nC5,	$06,	$12,	$18,	nG5,	$06
	dc.b		$12,	$0C,	nRst,	nF5,	$06,	$12,	$18,	nG5
	dc.b		$06,	$12,	$0C
	smpsReturn

music9E_Call26:
	dc.b		nRst,	$60,	nRst,	$0C,	nF5,	nRst,	nF5,	nRst
	smpsReturn

music9E_Call25:
	dc.b		nG3,	$0C,	nBb3,	$06,	nD4,	$0C,	nG3,	nG3
	dc.b		$06,	nRst,	nG3,	$0C,	nBb3,	$06,	nE4,	$0C
	dc.b		nG3,	$06,	nRst,	$06,	nC4,	$0C,	nF4,	$06
	dc.b		nA3,	$0C,	nC4,	nD4,	nF4,	$06,	nRst,	nF4
	dc.b		nF3,	$0C,	nBb3,	nBb3,	nE4,	$06,	nG3,	$0C
	dc.b		nBb3,	nCs4,	nE4,	$06,	nRst,	nE4,	nA3,	$0C
	dc.b		nCs4
	smpsReturn

; PSG2 Data
music9E_PSG2:
	dc.b		nRst,	$30
	smpsLoop	$00,	$1A,	music9E_PSG2
music9E_Loop25:
	dc.b		nE5,	$30,	smpsNoAttack,	$30,	nFs5,	smpsNoAttack,	$30,	nD5
	dc.b		smpsNoAttack,	$30,	nC5,	smpsNoAttack,	$30
	smpsLoop	$00,	$02,	music9E_Loop25
music9E_Loop26:
	dc.b		nRst,	$30
	smpsLoop	$00,	$10,	music9E_Loop26
	dc.b		nRst,	$60
	smpsAlterPitch	$0C
	smpsSetVol	$FD
	smpsPSGvoice	$04
	dc.b		nRst
music9E_Loop27:
	smpsCall	music9E_Call16
	smpsLoop	$00,	$02,	music9E_Loop27
	dc.b		nRst,	$60
	smpsModSet	$03,	$02,	$01,	$05
	smpsPSGvoice	$00
	smpsAlterPitch	$E8
	smpsSetVol	$02
	dc.b		nRst,	$30,	nRst,	nRst,	nC5,	$06,	nD5,	nA5
	dc.b		nF5,	$1E,	nRst,	$60,	nRst,	$06,	nA5,	nRst
	dc.b		nA5,	nG5,	nRst,	nG5,	nRst,	nFs5,	nRst,	nFs5
	dc.b		nRst,	nD5,	$03,	nRst,	nD5,	nRst,	$09,	nRst
	dc.b		$06,	nRst,	$30,	nRst,	nRst,	nC5,	$06,	nD5
	dc.b		nA5,	nF5,	$1E,	nRst,	$60,	smpsModOff
music9E_Loop28:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0C,	music9E_Loop28
	smpsPSGvoice	$00
	smpsSetVol	$FE
	smpsNoteFill	$06
	dc.b		nRst,	$60,	nRst,	$0C,	nD5,	nRst,	nD5,	nRst
	dc.b		nD5,	nRst,	nD5,	nRst,	$60,	nRst,	$0C,	nD5
	dc.b		nRst,	nD5,	nRst,	nD5,	$04,	nRst,	nD5,	nRst
	dc.b		$0C,	nD5,	nRst,	$60
	smpsSetVol	$02
music9E_Loop29:
	smpsCall	music9E_Call27
	smpsLoop	$00,	$02,	music9E_Loop29
music9E_Loop2A:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0A,	music9E_Loop2A
	dc.b		nRst,	$60
	smpsPSGvoice	$00
	smpsAlterPitch	$F4
	smpsSetVol	$FF
	smpsAlterPitch	$E8
	dc.b		nRst,	$60
	smpsCall	music9E_Call1E
	smpsAlterPitch	$18
	smpsSetVol	$02
	dc.b		nC4,	$30,	nB3,	$18,	nC4,	$0C,	nB3,	nA3
	dc.b		$30,	nC4
	smpsSetVol	$FE
	dc.b		nRst,	$0C,	nE4,	nRst,	nE4,	nRst,	nF4,	nRst
	dc.b		nF4
	smpsSetVol	$03
	dc.b		nRst,	nC4,	nRst,	nC4,	nRst,	nC4,	nRst,	nC4
	smpsSetVol	$FC
	dc.b		nRst,	nC4,	nRst,	nC4,	nRst,	nC4,	$18,	$08
	dc.b		nC4,	$04
	smpsSetVol	$01
	smpsAlterPitch	$18
	smpsPSGvoice	$05
	smpsAlterNote	$01
	dc.b		nRst,	$60,	nRst,	nRst,	nRst,	nRst,	nRst,	nRst
	dc.b		$0C,	nE6,	$06,	nRst,	nB6,	nE6,	nRst,	$0C
	dc.b		nE6,	$06,	nRst,	nB6,	nE6,	nRst,	$18,	nRst
	dc.b		$54
	smpsAlterPitch	$24
	smpsSetVol	$FD
music9E_Jump01:
	smpsPSGvoice	$03
	dc.b		nRst,	$06
music9E_Loop2B:
	dc.b		nD5,	$03,	nE5,	nFs5
	smpsSetVol	$01
	smpsAlterPitch	$FF
	smpsLoop	$00,	$05,	music9E_Loop2B
music9E_Loop2C:
	dc.b		nD5,	$03,	nE5,	nFs5
	smpsSetVol	$01
	smpsAlterPitch	$01
	smpsLoop	$00,	$07,	music9E_Loop2C
	smpsStop

; PSG3 Data
music9E_PSG3:
	smpsPSGform	$E7
	smpsPSGvoice	$02
	dc.b		nRst,	$60
music9E_Loop2D:
	dc.b		nA5,	$0C,	$0C,	$0C,	$06,	$06,	$0C,	$0C
	dc.b		$06,	$06,	$0C
	smpsLoop	$00,	$08,	music9E_Loop2D
music9E_Loop2E:
	dc.b		nRst,	$30
	smpsLoop	$00,	$08,	music9E_Loop2E
music9E_Loop2F:
	dc.b		nA5,	$0C,	$06,	$06
	smpsLoop	$00,	$1F,	music9E_Loop2F
	dc.b		$0C
	smpsPSGvoice	$03
	dc.b		nA5
	smpsPSGvoice	$02
music9E_Loop30:
	dc.b		nA5,	$0C,	$06,	$06
	smpsLoop	$00,	$07,	music9E_Loop30
	dc.b		$06,	$06,	$06,	$06
	smpsLoop	$01,	$04,	music9E_Loop30
music9E_Loop31:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0C,	music9E_Loop31
	smpsPSGvoice	$04
	smpsSetVol	$02
music9E_Loop32:
	smpsNoteFill	$03
	dc.b		nA5,	$06,	$06
	smpsNoteFill	$00
	dc.b		$0C
	smpsLoop	$00,	$04,	music9E_Loop32
	smpsPSGvoice	$02
	smpsSetVol	$FD
music9E_Loop33:
	dc.b		nRst,	$0C,	nA5,	$06,	nRst,	$07,	nA5,	$06
	dc.b		nRst,	$11,	nA5,	$0C,	nRst,	$06,	nA5,	$0C
	dc.b		nRst,	$06,	nA5,	nRst
	smpsLoop	$00,	$07,	music9E_Loop33
	smpsSetVol	$02
music9E_Loop34:
	dc.b		nA5,	$0C,	$08,	$04
	smpsLoop	$00,	$18,	music9E_Loop34
music9E_Loop35:
	dc.b		nA5,	$0C,	$0C,	$0C,	$08,	$04
	smpsLoop	$00,	$08,	music9E_Loop35
	dc.b		nRst,	$60
	smpsPSGvoice	$04
	smpsSetVol	$02
music9E_Loop36:
	dc.b		nA5,	$06,	$06,	$0C
	smpsLoop	$00,	$10,	music9E_Loop36
music9E_Loop37:
	dc.b		nRst,	$30
	smpsLoop	$00,	$0A,	music9E_Loop37
	dc.b		nRst,	$60
	smpsSetVol	$FF
music9E_Loop38:
	smpsPSGvoice	$01
	dc.b		nA5,	$0C
	smpsPSGvoice	$02
	smpsSetVol	$FF
	dc.b		$08
	smpsPSGvoice	$01
	smpsSetVol	$01
	dc.b		$04
	smpsLoop	$00,	$27,	music9E_Loop38
	smpsSetVol	$FF
	smpsPSGvoice	$04
music9E_Loop39:
	smpsNoteFill	$03
	dc.b		nA5,	$0C
	smpsNoteFill	$0C
	dc.b		$0C
	smpsLoop	$00,	$1E,	music9E_Loop39
	smpsNoteFill	$03
	dc.b		nA5,	$06
	smpsNoteFill	$0E
	dc.b		$12
	smpsNoteFill	$03
	dc.b		$0C
	smpsNoteFill	$0F
	dc.b		$0C
	smpsStop

; DAC Data
music9E_DAC:
	dc.b		dSnare,	$06,	dSnare,	dSnare,	dSnare,	dSnare,	$0C,	$06
	dc.b		$0C,	$06,	$0C,	$0C,	$0C
music9E_Loop3A:
	dc.b		dKick,	$18,	dSnare
	smpsLoop	$00,	$0E,	music9E_Loop3A
	dc.b		dKick,	$0C
music9E_Loop3B:
	dc.b		dSnare
	smpsLoop	$00,	$07,	music9E_Loop3B
	smpsSetTempoMod	$EA
	smpsCall	music9E_Call28
	dc.b		dKick,	$0C,	$8D,	dSnare,	dKick,	dKick,	$8E,	dSnare
	dc.b		$84,	$04,	$06,	$02,	dKick,	$0C,	dSnare,	$06
	dc.b		dSnare,	dSnare,	dSnare,	dKick,	$0C,	dSnare,	$06,	dSnare
	dc.b		dKick,	dKick,	dSnare,	dSnare,	dSnare,	dSnare
music9E_Loop3C:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
	smpsLoop	$00,	$07,	music9E_Loop3C
	dc.b		dKick,	$0C,	dSnare,	dSnare,	dSnare,	dSnare,	$06,	dSnare
	dc.b		$8C,	$8C,	$8D,	$8D,	$8E,	$8E
	smpsCall	music9E_Call29
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	$18,	dSnare,	$0C
	dc.b		dSnare,	dSnare,	$06,	dSnare
	smpsCall	music9E_Call29
	dc.b		dKick,	$0C,	dSnare,	dSnare,	dSnare,	$8D,	$06,	$8D
	dc.b		$8E,	$8E,	dSnare,	$06,	dSnare,	$8D,	$0C,	dSnare
	dc.b		$0C,	dSnare,	$06,	dSnare,	nRst,	dSnare,	dSnare,	$0C
	dc.b		dSnare,	$0C,	dSnare,	dSnare,	$06,	dSnare,	$8D,	$8D
music9E_Loop3D:
	dc.b		dKick,	$0C,	$8F,	$06,	$90,	dSnare,	$0C,	$90
	dc.b		$06,	$91,	dKick,	$0C,	$8F,	$06,	$91,	dSnare
	dc.b		$0C,	$8F,	$06,	$91
	smpsLoop	$00,	$04,	music9E_Loop3D
	dc.b		dKick,	$0C,	$8F,	$06,	$91,	dSnare,	$0C,	$8F
	dc.b		$06,	$91,	$8C,	$06,	$03,	$03,	$8D,	$06
	dc.b		$8D,	$8D,	$8E,	$8E,	$8E,	dKick,	$06,	$0C
	dc.b		dSnare,	$06,	nRst,	$0C,	dKick,	dSnare,	$8E,	dSnare
	dc.b		$06,	dSnare,	dSnare,	dSnare
music9E_Loop3E:
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$12,	dKick,	$06
	dc.b		dKick,	$12,	$8C,	$06,	dSnare,	$0C,	dTimpani,	$06
	dc.b		dKick,	nRst
	smpsLoop	$00,	$06,	music9E_Loop3E
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$12,	dKick,	$06
	dc.b		dKick,	$06,	dSnare,	$06,	dKick,	$0C,	$06,	dSnare
	dc.b		$0C,	$08,	$04
	smpsSetTempoMod	$05
	dc.b		dSnare,	$30,	dSnare,	$0C,	dSnare,	dSnare,	dSnare,	$08
	dc.b		$04
	smpsCall	music9E_Call2A
	smpsCall	music9E_Call2A
	dc.b		dKick,	$08,	$0C,	$04,	dSnare,	$0C,	dKick,	$08
	dc.b		$04,	dSnare,	$08,	$04,	$08,	$04,	$04,	$04
	dc.b		$04,	$08,	$04
	smpsSetTempoMod	$05
music9E_Loop3F:
	dc.b		dKick,	$09,	dKick,	$03,	$0C,	dSnare,	dKick,	dKick
	dc.b		$18,	dSnare
	smpsLoop	$00,	$03,	music9E_Loop3F
	dc.b		dKick,	$09,	dKick,	$03,	$0C,	dSnare,	dKick,	dKick
	dc.b		$18,	dSnare,	$0C,	$06,	$06,	dKick,	$0C,	dSnare
	dc.b		$06,	dSnare,	dSnare,	dSnare,	$8D,	$0C,	dSnare,	$0C
	dc.b		$0C,	$0C,	$06,	$06
music9E_Loop40:
	dc.b		dKick,	$0C,	dKick,	dSnare,	nRst,	dKick,	dKick,	dSnare
	dc.b		dTimpani
	smpsLoop	$00,	$03,	music9E_Loop40
	dc.b		dKick,	dSnare,	dSnare,	dSnare,	dSnare,	$06,	$06,	$06
	dc.b		$06,	$0C,	$06,	$06,	dKick,	$06,	dKick,	dSnare
	dc.b		dSnare,	dKick,	dSnare,	dKick,	dKick,	dSnare,	$02,	dSnare
	dc.b		$04,	dKick,	$0C,	$06,	dSnare,	$0C,	$06,	$06
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	dKick,	$18,	dSnare
	dc.b		dKick,	$06,	dKick,	$12,	dSnare,	$0C,	dKick,	dKick
	dc.b		$18,	dSnare,	dKick,	$18,	dSnare,	$0C,	dKick,	dKick
	dc.b		$18,	dSnare,	dKick,	$06,	dKick,	$12,	dSnare,	$0C
	dc.b		$0C,	$06,	$06,	$06,	$06,	$0C,	$06,	$06
	dc.b		dSnare,	$02,	$04,	dKick,	$0C,	$06,	$0C,	dSnare
	dc.b		$02,	$04,	dKick,	$0C,	$06,	$0C,	dSnare,	$06
	dc.b		dSnare,	dSnare,	dSnare
	smpsSetTempoMod	$05
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dKick
	dc.b		$08,	dSnare,	$04,	$0C
music9E_Loop41:
	dc.b		dKick,	$0C,	dSnare
	smpsLoop	$00,	$0F,	music9E_Loop41
	dc.b		dKick,	$08,	dSnare,	$04,	$0C
music9E_Loop42:
	dc.b		dKick,	$0C,	dSnare
	smpsLoop	$00,	$13,	music9E_Loop42
	dc.b		dSnare,	$08,	$0C,	$04,	dKick,	$0C,	dSnare,	dKick
	dc.b		dSnare,	dKick,	$0C,	dSnare,	dKick,	$06,	nRst,	$02
	dc.b		dSnare,	dSnare,	dSnare,	$09,	dSnare,	$03
music9E_Loop43:
	dc.b		dKick,	$0C,	dSnare
	smpsLoop	$00,	$06,	music9E_Loop43
	dc.b		dKick,	$0C,	dSnare,	dKick,	$06,	nRst,	$02,	dSnare
	dc.b		dSnare,	dSnare,	$09,	dSnare,	$03
	smpsLoop	$01,	$03,	music9E_Loop43
	dc.b		dKick,	$0C,	dSnare,	dKick,	dSnare,	dKick,	$06,	dSnare
	dc.b		$12,	dSnare,	$0C,	dKick
	smpsStop

music9E_Call28:
	dc.b		dKick,	$0C,	$8D,	dSnare,	dKick,	dKick,	$8E,	dSnare
	dc.b		$84,	$04,	$06,	$02,	dKick,	$0C,	$8D,	dSnare
	dc.b		dKick,	dKick,	$8E,	dSnare,	dTimpani
	smpsReturn

music9E_Call29:
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	$18,	$0C,	dSnare
	dc.b		dKick,	dKick,	$18,	dSnare,	$0C,	dKick,	$12,	dKick
	dc.b		dSnare,	$18,	dKick,	dSnare,	$0C,	dKick,	$18,	$0C
	dc.b		dSnare,	dKick
	smpsReturn

music9E_Call2A:
	dc.b		dKick,	$08,	$0C,	$04,	dSnare,	$0C,	dKick,	$08
	dc.b		$0C,	dSnare,	$04,	dKick,	$0C,	dSnare,	dKick,	dKick
	dc.b		$08,	$0C,	$04,	dSnare,	$0C,	dKick,	$08,	$0C
	dc.b		dSnare,	$04,	dKick,	$0C,	dSnare,	dSnare,	$08,	$04
	smpsReturn
	dc.b		dKick,	$06,	nRst,	$03,	dKick,	dKick,	$06,	dSnare
	dc.b		dKick,	$06,	nRst,	$03,	dKick,	dKick,	$06,	dSnare
	dc.b		$03,	dSnare,	dKick,	$06,	nRst,	$03,	dKick,	dKick
	dc.b		$06,	dSnare
	smpsReturn

music9E_Voices:
	dc.b		$3A,$01,$07,$01,$01,$8E,$8E,$8D,$53,$0E,$0E,$0E,$03,$00,$00,$00
	dc.b		$01,$1F,$FF,$1F,$0F,$17,$28,$27,$80;			Voice 00
	dc.b		$08,$09,$70,$30,$00,$1F,$1F,$5F,$5F,$12,$0E,$0A,$0A,$00,$04,$04
	dc.b		$03,$2F,$2F,$2F,$2F,$25,$30,$0E,$84;			Voice 01
	dc.b		$3C,$31,$52,$50,$30,$52,$53,$52,$53,$08,$00,$08,$00,$04,$00,$04
	dc.b		$00,$10,$0B,$10,$0D,$19,$80,$0B,$80;			Voice 02
	dc.b		$08,$0A,$70,$30,$00,$1F,$1F,$5F,$5F,$12,$0E,$0A,$0A,$00,$04,$04
	dc.b		$03,$2F,$2F,$2F,$2F,$24,$2D,$13,$80;			Voice 03
	dc.b		$3D,$01,$21,$51,$01,$12,$14,$14,$0F,$0A,$05,$05,$05,$00,$00,$00
	dc.b		$00,$2B,$2B,$2B,$1B,$19,$80,$80,$80;			Voice 04
	dc.b		$04,$57,$02,$70,$50,$1F,$1F,$1F,$1F,$00,$00,$00,$00,$06,$0A,$00
	dc.b		$0A,$00,$0F,$00,$0F,$1A,$80,$10,$80;			Voice 05
	dc.b		$35,$01,$01,$13,$00,$1F,$1D,$18,$19,$00,$09,$06,$0D,$00,$00,$02
	dc.b		$03,$00,$06,$15,$16,$1E,$80,$83,$80;			Voice 06
	dc.b		$3C,$31,$52,$50,$30,$52,$53,$52,$53,$08,$00,$08,$00,$04,$00,$04
	dc.b		$00,$1F,$0F,$1F,$0F,$1A,$88,$16,$88;			Voice 07
	dc.b		$20,$36,$35,$30,$31,$DF,$DF,$9F,$9F,$07,$06,$09,$06,$07,$06,$06
	dc.b		$08,$2F,$1F,$1F,$FF,$14,$37,$0F,$80;			Voice 08
	dc.b		$3B,$0F,$06,$01,$02,$DF,$1F,$1F,$DF,$0C,$00,$0A,$03,$0F,$00,$00
	dc.b		$01,$F3,$05,$55,$5C,$22,$20,$22,$80;			Voice 09
	dc.b		$3C,$31,$52,$50,$30,$52,$53,$52,$53,$08,$00,$08,$00,$04,$00,$04
	dc.b		$00,$1F,$0F,$1F,$0F,$1C,$84,$14,$80;			Voice 0A
	dc.b		$3A,$69,$70,$50,$60,$1C,$18,$1A,$18,$10,$0C,$02,$09,$08,$06,$06
	dc.b		$03,$F9,$56,$06,$06,$28,$15,$14,$00;			Voice 0B
	dc.b		$3D,$00,$01,$02,$01,$4C,$0F,$50,$12,$0C,$02,$00,$05,$01,$00,$00
	dc.b		$00,$28,$29,$2A,$19,$1A,$00,$06,$00;			Voice 0C
	dc.b		$2C,$71,$71,$31,$31,$1F,$16,$1F,$16,$00,$0F,$00,$0F,$00,$0F,$00
	dc.b		$0F,$00,$FA,$00,$FA,$15,$00,$14,$00;			Voice 0D
	dc.b		$18,$37,$32,$31,$31,$9E,$DC,$1C,$9C,$0D,$06,$04,$01,$08,$0A,$03
	dc.b		$05,$B6,$B6,$36,$28,$2C,$22,$14,$00;			Voice 0E
	dc.b		$3D,$01,$02,$02,$02,$10,$50,$50,$50,$07,$08,$08,$08,$01,$00,$00
	dc.b		$00,$24,$18,$18,$18,$1C,$82,$82,$82;			Voice 0F
	dc.b		$32,$71,$0D,$33,$01,$5F,$99,$5F,$94,$05,$05,$05,$07,$02,$02,$02
	dc.b		$02,$11,$11,$11,$72,$23,$2D,$26,$80;			Voice 10
	dc.b		$3A,$32,$01,$52,$31,$1F,$1F,$1F,$18,$01,$1F,$00,$00,$00,$0F,$00
	dc.b		$00,$5A,$0F,$03,$1A,$3B,$30,$4F,$00;			Voice 11
	dc.b		$3C,$42,$41,$32,$41,$12,$12,$12,$12,$00,$00,$00,$00,$00,$00,$00
	dc.b		$00,$06,$08,$06,$08,$24,$08,$24,$08;			Voice 12
	dc.b		$31,$34,$35,$30,$31,$DF,$DF,$9F,$9F,$0C,$07,$0C,$09,$07,$07,$07
	dc.b		$08,$2F,$1F,$1F,$2F,$17,$32,$14,$80;			Voice 13
	dc.b		$3D,$01,$01,$01,$01,$10,$50,$50,$50,$07,$08,$08,$08,$01,$00,$00
	dc.b		$00,$20,$1A,$1A,$1A,$19,$84,$84,$84;			Voice 14
	dc.b		$24,$70,$74,$30,$38,$12,$1F,$1F,$1F,$05,$03,$05,$03,$05,$03,$05
	dc.b		$03,$36,$2C,$26,$2C,$0A,$08,$06,$08;			Voice 15
	dc.b		$3A,$01,$01,$01,$02,$8D,$07,$07,$52,$09,$00,$00,$03,$01,$02,$02
	dc.b		$00,$5F,$0F,$0F,$2F,$18,$22,$18,$80;			Voice 16
	dc.b		$3A,$01,$07,$01,$01,$8E,$8E,$8D,$53,$0E,$0E,$0E,$03,$00,$00,$00
	dc.b		$00,$1F,$FF,$1F,$0F,$18,$4E,$16,$80;			Voice 17
	dc.b		$3A,$03,$08,$03,$01,$8E,$8E,$8D,$53,$0E,$0E,$0E,$03,$00,$00,$00
	dc.b		$00,$1F,$FF,$1F,$0F,$17,$28,$20,$80;			Voice 18
	dc.b		$20,$7A,$31,$00,$00,$9F,$D8,$DC,$DF,$10,$0A,$04,$04,$0F,$08,$08
	dc.b		$08,$5F,$5F,$BF,$BF,$14,$2B,$17,$80;			Voice 19
	dc.b		$3A,$61,$08,$51,$02,$5D,$5D,$5D,$50,$04,$0F,$1F,$1F,$00,$00,$00
	dc.b		$00,$1F,$5F,$0F,$0F,$22,$1E,$22,$80;			Voice 1A
	dc.b		$02,$01,$55,$02,$04,$92,$8D,$8E,$54,$0D,$0C,$00,$03,$00,$00,$00
	dc.b		$00,$FF,$2F,$0F,$5F,$16,$2A,$1D,$80;			Voice 1B
	dc.b		$02,$75,$71,$73,$31,$1F,$58,$96,$9F,$01,$1B,$03,$08,$01,$04,$01
	dc.b		$05,$FF,$2F,$3F,$2F,$24,$29,$30,$80;			Voice 1C
	dc.b		$20,$66,$65,$60,$60,$DF,$DF,$9F,$1F,$00,$06,$09,$0C,$07,$06,$06
	dc.b		$08,$2F,$1F,$1F,$FF,$1C,$3A,$16,$80;			Voice 1D
	dc.b		$0D,$32,$08,$06,$01,$1F,$19,$19,$19,$0A,$05,$05,$05,$00,$02,$02
	dc.b		$02,$3F,$2F,$2F,$2F,$28,$80,$86,$8D;			Voice 1E
	dc.b		$38,$3A,$0A,$11,$02,$D4,$14,$50,$0E,$05,$08,$02,$88,$00,$00,$00
	dc.b		$00,$99,$09,$09,$1A,$2D,$2C,$19,$86;			Voice 1F
	dc.b		$0D,$32,$04,$02,$01,$1F,$19,$19,$19,$0A,$05,$05,$05,$00,$02,$02
	dc.b		$02,$3F,$2F,$2F,$2F,$28,$86,$8B,$93;			Voice 20
	dc.b		$3A,$20,$23,$60,$01,$1E,$1F,$1F,$1F,$0A,$0A,$0B,$0A,$05,$07,$0A
	dc.b		$08,$A4,$85,$96,$78,$21,$25,$28,$00;			Voice 21
	dc.b		$3A,$32,$56,$32,$42,$8D,$4F,$15,$52,$06,$08,$07,$04,$02,$00,$00
	dc.b		$00,$18,$18,$28,$28,$19,$20,$2A,$00;			Voice 22
	dc.b		$3A,$51,$08,$51,$02,$1E,$1E,$1E,$10,$1F,$1F,$1F,$0F,$00,$00,$00
	dc.b		$02,$0F,$0F,$0F,$1F,$18,$24,$22,$81;			Voice 23
	dc.b		$20,$36,$35,$30,$31,$DF,$DF,$9F,$9F,$07,$06,$09,$06,$07,$06,$06
	dc.b		$08,$2F,$1F,$1F,$FF,$19,$37,$13,$80;			Voice 24
	dc.b		$3D,$01,$02,$02,$02,$14,$0E,$8C,$0E,$08,$05,$02,$05,$00,$00,$00
	dc.b		$00,$1F,$1F,$1F,$1F,$1A,$80,$80,$80;			Voice 25
	even
