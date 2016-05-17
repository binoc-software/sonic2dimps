; =============================================================================================
; Project Name:		music8C
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8C_Header:
	smpsHeaderVoice	music8C_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$03

	smpsHeaderDAC	music8C_DAC
	smpsHeaderFM	music8C_FM1,	smpsPitch01lo,	$0A
	smpsHeaderFM	music8C_FM2,	smpsPitch01lo,	$0F
	smpsHeaderFM	music8C_FM3,	smpsPitch01lo,	$0A
	smpsHeaderFM	music8C_FM4,	smpsPitch01lo,	$10
	smpsHeaderFM	music8C_FM5,	smpsPitch02lo,	$10
	smpsHeaderPSG	music8C_PSG1,	smpsPitch04lo,	$06,	$00
	smpsHeaderPSG	music8C_PSG2,	smpsPitch04lo,	$06,	$00
	smpsHeaderPSG	music8C_PSG3,	smpsPitch00,	$05,	$00

; FM1 Data
music8C_FM1:
	smpsFMvoice	$04
	smpsAlterNote	$01
	dc.b		nG6,	$06,	nE6,	nF6,	nD6,	nE6,	nC6,	nC6
	dc.b		nA5
music8C_Jump01:
	smpsCall	music8C_Call01
	smpsFMvoice	$03
	smpsAlterVol	$06
	dc.b		nG4,	$06
	smpsNoteFill	$06
	dc.b		nA4,	$03,	nC5,	nC5,	nA4
	smpsFMvoice	$04
	smpsAlterVol	$FA
	smpsNoteFill	$00
	smpsCall	music8C_Call01
	dc.b		nRst,	$12,	nC6,	$18,	nA5,	$0C,	nC6,	nBb5
	dc.b		nC6,	$06,	nD6,	$0C,	nC6,	$06,	nBb5,	$0C
	dc.b		nC6,	$18,	nA5,	$0C,	nC6,	nBb5,	$06
	smpsFMvoice	$02
	smpsAlterVol	$06
	dc.b		nEb5,	$06,	nF5,	nEb5,	nRst,	nEb5,	nF5,	nEb5
	smpsFMvoice	$04
	smpsAlterVol	$FA
	dc.b		nC6,	$18,	nA5,	$0C,	nC6,	nBb5,	nC6,	$06
	dc.b		nD6,	$0C,	nC6,	$06,	nBb5,	$0C,	nA5,	$18
	dc.b		nF5,	$0C,	nA5
	smpsFMvoice	$02
	smpsAlterVol	$06
	dc.b		nG5,	$03,	nRst,	nG5,	$06,	nA5,	$03,	nG5
	dc.b		nA5,	$06,	nG5,	$03,	nRst,	$15
	smpsFMvoice	$04
	smpsAlterVol	$FA
	smpsJump	music8C_Jump01

music8C_Call01:
	smpsFMvoice	$03
	smpsAlterVol	$06
	dc.b		nE5,	$06
	smpsNoteFill	$06
	dc.b		nC5,	$03,	nA4,	nC5,	$06,	nRst,	nRst
	smpsFMvoice	$04
	smpsAlterVol	$FA
	smpsNoteFill	$00
	dc.b		nB4,	$06,	$09,	$03
	smpsFMvoice	$03
	smpsAlterVol	$06
	smpsNoteFill	$06
	dc.b		nF5,	$03,	nF5,	nRst,	nF5,	nRst,	nF5
	smpsNoteFill	$00
	dc.b		nFs5,	$06,	nG5,	nRst
	smpsNoteFill	$06
	dc.b		nG5,	$03,	$03,	nA5,	nG5
	smpsNoteFill	$00
	dc.b		nE5,	$06
	smpsNoteFill	$06
	dc.b		nC5,	$03,	nA4,	nC5,	$06,	nRst,	nRst
	smpsNoteFill	$00
	smpsFMvoice	$04
	smpsAlterVol	$FA
	dc.b		nE5,	nG5,	nE5
	smpsFMvoice	$02
	smpsAlterVol	$06
	smpsNoteFill	$06
	dc.b		nF5,	$03,	nF5,	nRst,	nF5,	nRst,	nF5
	smpsNoteFill	$00
	dc.b		nFs5,	$06,	nG5,	$03,	nRst
	smpsFMvoice	$04
	smpsAlterVol	$FA
	smpsReturn

; FM4 Data
music8C_FM4:
	smpsFMvoice	$04
	smpsAlterVol	$FA
	dc.b		nRst,	$03,	nF6,	$06,	nD6,	nE6,	nC6,	nD6
	dc.b		nB5,	nB5,	nG5,	$03
	smpsAlterVol	$06
music8C_Loop01:
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nE5,	$03,	$09,	$0C,	nG5,	$03
	dc.b		$09,	$06
	smpsFMvoice	$04
	smpsPan		panCentre,	$00
	smpsAlterVol	$FA
	smpsNoteFill	$00
	dc.b		nA5
	smpsNoteFill	$06
	smpsAlterVol	$06
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	dc.b		nF5,	$03,	$09,	$0C,	nG5,	$03,	$09,	$0C
	dc.b		nE5,	$03,	$09,	$0C,	nG5,	$03,	$09,	$06
	smpsFMvoice	$02
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	dc.b		nA5,	$03,	nA5,	nRst,	nA5,	nRst,	nA5
	smpsNoteFill	$00
	dc.b		nBb5,	$06,	nB5,	$03
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	dc.b		nRst,	nG5,	$03,	$09,	$06
	smpsFMvoice	$02
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	smpsLoop	$00,	$02,	music8C_Loop01
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nA5,	$03,	$09,	$03,	$09,	$03
	dc.b		$09,	$03,	$03,	nRst,	$06,	nG5,	$03,	$09
	dc.b		$03,	$09,	$03,	$09,	$03,	$03,	nRst,	$06
	dc.b		nA5,	$03,	$09,	$03,	$09,	$03,	$09,	$03
	dc.b		$03
	smpsFMvoice	$02
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	dc.b		nRst,	$06,	nG5,	nA5,	nG5,	nRst,	nG5,	nA5
	dc.b		nG5
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nA5,	$03,	$09,	$03,	$09,	$03
	dc.b		$09,	$03,	$03,	nRst,	$06,	nG5,	$03,	$09
	dc.b		$03,	$09,	$03,	$09,	$03,	$03,	nRst,	$06
	dc.b		nF5,	$03,	$09,	$03,	$09,	$03,	$09,	$03
	dc.b		$03
	smpsFMvoice	$02
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	dc.b		nB5,	$03,	nRst,	nB5,	$06,	nC6,	$03,	nB5
	dc.b		nC6,	$06,	nB5,	$03,	nRst,	$15
	smpsJump	music8C_Loop01

; FM3 Data
music8C_FM3:
	smpsFMvoice	$03
	smpsNoteFill	$06
	dc.b		nRst,	$1E,	nG5,	$03,	$03,	nA5,	nC6,	nC6
	dc.b		nA5
music8C_Jump02:
	smpsCall	music8C_Call02
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	smpsAlterVol	$06
	dc.b		nRst,	$06,	nF5,	$03,	$09,	$06
	smpsFMvoice	$03
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	smpsAlterVol	$FA
	dc.b		nRst,	nG5
	smpsNoteFill	$06
	dc.b		nA5,	$03,	nC6,	nC6,	nA5
	smpsCall	music8C_Call02
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	smpsAlterVol	$06
	dc.b		nRst,	$06,	nF5,	$03,	$09,	$06,	nRst,	nG5
	dc.b		$03,	$09,	$06
	smpsFMvoice	$03
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	smpsAlterVol	$FA
	smpsCall	music8C_Call03
	dc.b		nRst,	$30
	smpsCall	music8C_Call03
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	smpsAlterVol	$06
	dc.b		nRst,	$06,	nG5,	$03,	$09,	$03,	$09,	$03
	dc.b		$09,	$03,	$03
	smpsFMvoice	$03
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	smpsAlterVol	$FA
	smpsCall	music8C_Call03
	dc.b		nRst,	$30,	nD6,	$0C,	nE6,	nF6,	nFs6,	nG6
	dc.b		$06
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsNoteFill	$06
	smpsAlterVol	$06
	dc.b		nB5,	$03,	$09,	$03,	$03
	smpsFMvoice	$03
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsNoteFill	$00
	smpsAlterVol	$FA
	smpsNoteFill	$00
	dc.b		nRst,	$06,	nG5
	smpsNoteFill	$06
	dc.b		nA5,	$03,	nC6,	nC6,	nA5
	smpsJump	music8C_Jump02

music8C_Call03:
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nA5,	nF5,	$03,	nC5,	$06,	$03
	dc.b		nF5,	$06,	nA5,	nBb5,	$03
	smpsNoteFill	$00
	dc.b		nA5,	$09
	smpsReturn

music8C_Call02:
	smpsNoteFill	$00
	dc.b		nE6,	$06
	smpsNoteFill	$06
	dc.b		nC6,	$03,	nA5,	nC6,	$06,	nRst,	nRst,	$09
	smpsFMvoice	$04
	smpsNoteFill	$00
	dc.b		nC5,	nA4,	$06
	smpsNoteFill	$06
	smpsFMvoice	$03
	dc.b		nF6,	$03,	nF6,	nRst,	nF6,	nRst,	nF6
	smpsNoteFill	$00
	dc.b		nFs6,	$06,	nG6,	nRst
	smpsNoteFill	$06
	dc.b		nG6,	$03,	$03,	nA6,	nG6
	smpsNoteFill	$00
	dc.b		nE6,	$06
	smpsNoteFill	$06
	dc.b		nC6,	$03,	nA5,	nC6,	$06
	smpsNoteFill	$00
	smpsFMvoice	$04
	dc.b		nRst,	$0F,	nF5,	$06,	nF5,	nC5,	$03
	smpsReturn

; FM5 Data
music8C_FM5:
	smpsPan		panLeft,	$01
	smpsFMvoice	$01
	dc.b		nRst,	$30
music8C_Loop02:
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nG5,	$03,	$09,	$0C,	nB5,	$03
	dc.b		$09,	$06,	nRst,	nA5,	$03,	$09,	$0C,	nB5
	dc.b		$03,	$09,	$06
	smpsLoop	$00,	$04,	music8C_Loop02
music8C_Loop03:
	dc.b		nRst,	$06,	nC6,	$03,	$09,	$03,	$09,	$03
	dc.b		$09,	$03,	$03,	nRst,	$06,	nBb5,	$03,	$09
	dc.b		$03,	$09,	$03,	$09,	$03,	$03
	smpsLoop	$00,	$03,	music8C_Loop03
	dc.b		nRst,	$06,	nA5,	$03,	$09,	$03,	$09,	$03
	dc.b		$09,	$03,	$03,	nRst,	$06,	nD6,	$03,	$09
	dc.b		$03,	$1B
	smpsJump	music8C_Loop02

; FM2 Data
music8C_FM2:
	smpsFMvoice	$03
	smpsNoteFill	$06
	dc.b		nRst,	$1E,	nG4,	$03,	$03,	nA4,	nC5,	nC5
	dc.b		nA4
	smpsFMvoice	$00
	smpsAlterVol	$FA
music8C_Loop04:
	smpsNoteFill	$00
	dc.b		nRst,	$06,	nC4,	nA3,	$03,	$03,	nG3,	$06
	dc.b		nRst,	nB3,	nA3,	$03,	$03,	nG3,	$06,	nRst
	dc.b		nA3,	nG3,	$03,	$03,	nF3,	$06,	nRst,	nG3
	dc.b		$06,	$03,	$03,	nA3,	nG3,	nRst,	$06,	nC4
	dc.b		nA3,	$03,	$03,	nG3,	$06,	nRst,	nB3,	nA3
	dc.b		$03,	$03,	nG3,	$06
	smpsFMvoice	$04
	dc.b		nC5
	smpsFMvoice	$00
	dc.b		nA3,	nG3,	$03,	$03,	nF3,	$06,	nRst,	nG3
	dc.b		$06,	$03,	$03,	nA3,	nG3
	smpsLoop	$00,	$02,	music8C_Loop04
music8C_Loop05:
	dc.b		nRst,	$06,	nF4,	$03,	$03,	nD4,	nD4,	nC4
	dc.b		nC4,	nRst,	$06,	nF4,	$03,	$03,	nD4,	nD4
	dc.b		nC4,	nC4,	nRst,	$06,	nEb4,	$03,	$03,	nC4
	dc.b		nC4,	nBb3,	nBb3,	nRst,	$06,	nEb4,	$03,	$03
	dc.b		nC4,	nC4,	nBb3,	nBb3
	smpsLoop	$00,	$03,	music8C_Loop05
	dc.b		nRst,	$06,	nD4,	$03,	$03,	nC4,	nC4,	nA3
	dc.b		nA3,	nRst,	$06,	nD4,	$03,	$03,	nC4,	nC4
	dc.b		nA3,	nA3,	nG3,	$06,	$06,	nA3,	$03,	nG3
	dc.b		nA3,	$06,	nG3,	$18
	smpsJump	music8C_Loop04

; DAC Data
music8C_DAC:
	dc.b		$8C,	$03,	$8C,	$8C,	$06,	$8D,	$03,	$8D
	dc.b		$8D,	$06,	$8E,	$03,	$8E,	$8E,	$06,	$8D
	dc.b		$8E
music8C_Loop06:
	dc.b		dKick,	dKick,	$8E,	nRst,	dKick,	dKick,	$8E,	nRst
	smpsLoop	$00,	$0F,	music8C_Loop06
	dc.b		dKick,	dKick,	$8E,	nRst,	$8C,	$03,	$8C,	$8C
	dc.b		$06,	$8D,	$8E
	smpsJump	music8C_Loop06

; PSG1 Data
music8C_PSG1:
	dc.b		nRst,	$02
	smpsPSGvoice	$08
	smpsAlterVol	$04
	dc.b		nG6,	$03,	nF6,	nE6,	nD6,	nF6,	nE6,	nD6
	dc.b		nC6,	nE6,	nD6,	nC6,	nB5,	nC6,	nB5,	nA5
	dc.b		nG5,	$01
	smpsAlterVol	$FC
	smpsAlterPitch	$04
	smpsJump	music8C_Jump03

; PSG2 Data
music8C_PSG2:
	dc.b		nRst,	$30
music8C_Jump03:
	smpsNoteFill	$06
	dc.b		nRst,	$06,	nC5,	$03,	$09,	$0C,	nG5,	$03
	dc.b		$09,	$06,	nRst,	nF5,	$03,	$09,	$0C,	nG5
	dc.b		$03,	$09,	$06
	smpsLoop	$00,	$04,	music8C_Jump03
	smpsNoteFill	$00
	smpsPSGvoice	$00
	dc.b		nF5,	$18,	nF5,	$0C,	nF5,	nEb5,	nF5,	$06
	dc.b		nEb5,	$0C,	nF5,	$06,	nEb5,	$0C,	nF5,	$18
	dc.b		nF5,	$0C,	nF5,	nEb5,	$30,	nF5,	$18,	nF5
	dc.b		$0C,	nF5,	nEb5,	nF5,	$06,	nEb5,	$0C,	nF5
	dc.b		$06,	nEb5,	$0C,	nF5,	$18,	nF5,	$0C,	nF5
	dc.b		nG5,	$06,	nRst,	$2A
	smpsJump	music8C_Jump03

; PSG3 Data
music8C_PSG3:
	dc.b		nRst,	$30
music8C_Jump04:
	smpsPSGvoice	$04
	smpsPSGform	$E7
	smpsModSet	$00,	$01,	$01,	$01
	dc.b		nA5,	$03,	nA5,	nA5,	$06
	smpsJump	music8C_Jump04

music8C_Voices:
	dc.b		$20,$66,$65,$60,$60,$DF,$DF,$9F,$1F,$00,$06,$09,$0C,$07,$06,$06
	dc.b		$08,$2F,$1F,$1F,$FF,$1C,$3A,$16,$80;			Voice 00
	dc.b		$0D,$32,$08,$06,$01,$1F,$19,$19,$19,$0A,$05,$05,$05,$00,$02,$02
	dc.b		$02,$3F,$2F,$2F,$2F,$28,$80,$86,$8D;			Voice 01
	dc.b		$3A,$61,$08,$51,$02,$5D,$5D,$5D,$50,$04,$0F,$1F,$1F,$00,$00,$00
	dc.b		$00,$1F,$5F,$0F,$0F,$22,$1E,$22,$80;			Voice 02
	dc.b		$02,$01,$55,$02,$04,$92,$8D,$8E,$54,$0D,$0C,$00,$03,$00,$00,$00
	dc.b		$00,$FF,$2F,$0F,$5F,$16,$2A,$1D,$80;			Voice 03
	dc.b		$02,$75,$71,$73,$31,$1F,$58,$96,$9F,$01,$1B,$03,$08,$01,$04,$01
	dc.b		$05,$FF,$2F,$3F,$2F,$24,$29,$30,$80;			Voice 04
	even
