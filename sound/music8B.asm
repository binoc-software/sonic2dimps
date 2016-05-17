; =============================================================================================
; Project Name:		music8B
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8B_Header:
	smpsHeaderVoice	music8B_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$04

	smpsHeaderDAC	music8B_DAC
	smpsHeaderFM	music8B_FM1,	smpsPitch00,	$0C
	smpsHeaderFM	music8B_FM2,	smpsPitch00,	$0A
	smpsHeaderFM	music8B_FM3,	smpsPitch00,	$0C
	smpsHeaderFM	music8B_FM4,	smpsPitch00,	$10
	smpsHeaderFM	music8B_FM5,	smpsPitch00,	$10
	smpsHeaderPSG	music8B_PSG1,	smpsPitch03lo,	$04,	$00
	smpsHeaderPSG	music8B_PSG2,	smpsPitch03lo,	$02,	$01
	smpsHeaderPSG	music8B_PSG3,	smpsPitch00,	$03,	$02

music8B_Call01:
	smpsFMvoice	$04
	dc.b		nA2,	$14,	nB2,	$04,	nC3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nG3,	$08,	nE3,	$10
	smpsFMvoice	$03
	smpsReturn

music8B_Call04:
	smpsAlterPitch	$FE
	dc.b		nA5,	$04,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	$04,	smpsNoAttack
	dc.b		nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack
	dc.b		nAb5
	smpsAlterPitch	$01
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	smpsAlterPitch	$01
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	dc.b		smpsNoAttack,	nA5,	$05,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	$05
	dc.b		smpsNoAttack,	nAb5,	nRst,	$04
	smpsReturn

music8B_Call05:
	smpsAlterPitch	$FD
	dc.b		nA5,	$04,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	smpsAlterPitch	$FF
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	smpsAlterPitch	$FF
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	dc.b		smpsNoAttack,	nA5,	smpsNoAttack,	nAb5
	smpsAlterPitch	$FF
	dc.b		smpsNoAttack,	nA5,	$05,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5,	$05
	dc.b		smpsNoAttack,	nAb5,	nRst,	$04
	smpsAlterPitch	$06
	smpsReturn

; FM5 Data
music8B_FM5:
	smpsFMvoice	$01
	smpsPan		panLeft,	$00
	dc.b		nRst,	$01
	smpsCall	music8B_Call01
music8B_Jump01:
	dc.b		nRst,	$2F,	nRst,	$1E
	smpsFMvoice	$06
	dc.b		nB2,	$12,	nC3,	$06
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nC5,	$08,	nB4,	$04
	dc.b		nBb4,	$08,	nA4,	$04,	nAb4,	$08,	nG4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsFMvoice	$06
	dc.b		nB2,	$12,	nC3,	$06
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nC5,	$08,	nB4,	$04
	dc.b		nBb4,	$08,	nA4,	$04,	nAb4,	$08,	nG4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsFMvoice	$06
	dc.b		nB2,	$12,	nC3,	$06
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nC5,	$08,	nB4,	$04
	dc.b		nBb4,	$08,	nA4,	$04,	nAb4,	$08,	nG4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsFMvoice	$06
	dc.b		nB2,	$12,	nC3,	$06
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nC5,	$08,	nB4,	$04
	dc.b		nBb4,	$08,	nA4,	$04,	nAb4,	$08,	nG4,	$04
music8B_Loop01:
	dc.b		nRst,	$0C,	nE5,	$06,	nRst,	$12,	$06,	nRst
	dc.b		$12,	nE5,	$06,	nRst,	$0C
	smpsFMvoice	$06
	dc.b		nB2,	$12,	nC3,	$06,	nRst
	smpsFMvoice	$01
	dc.b		nE5,	$06,	nRst,	$12,	$06,	nRst,	$12,	nE5
	dc.b		$08,	nEb5,	$04,	nE5,	$08,	nEb5,	$04,	nE5
	dc.b		$0C
	smpsLoop	$00,	$04,	music8B_Loop01
	dc.b		nRst,	$01
	smpsCall	music8B_Call01
	dc.b		nRst,	$0B,	nA3,	$08,	nB3,	$04,	nC4,	$08
	dc.b		nB3,	$04,	nA3,	$0C,	$08,	nB3,	$04,	nC4
	dc.b		$08,	nB3,	$04,	nA3,	$06,	nRst,	$12,	nRst
	dc.b		$01
	smpsCall	music8B_Call01
	dc.b		nA2,	$0C,	nRst,	nG2,	nRst,	nF2,	nRst,	nE2
	dc.b		nRst
	smpsCall	music8B_Call01
	dc.b		nRst,	$0B,	nC4,	$08,	nD4,	$04,	nE4,	$08
	dc.b		nD4,	$04,	nC4,	$0C,	$08,	nD4,	$04,	nE4
	dc.b		$08,	nD4,	$04,	nC4,	$06,	nRst,	$12,	nRst
	dc.b		$01
	smpsCall	music8B_Call01
	dc.b		nA2,	$0C,	nA2,	nE2,	$08,	nG2,	$0C,	nA2
	dc.b		$06,	nRst,	$2E
	smpsJump	music8B_Jump01

music8B_Call02:
	dc.b		nFs5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack,	nAb5,	smpsNoAttack,	nA5
	dc.b		$2D
	smpsReturn

music8B_Call03:
	dc.b		smpsNoAttack,	$24,	smpsNoAttack,	nAb5,	$01,	smpsNoAttack,	nG5,	smpsNoAttack
	dc.b		nFs5,	smpsNoAttack,	nF5,	smpsNoAttack,	nE5,	smpsNoAttack,	nEb5,	smpsNoAttack
	dc.b		nD5,	smpsNoAttack,	nCs5,	smpsNoAttack,	nC5,	smpsNoAttack,	nB4,	smpsNoAttack
	dc.b		nBb4,	smpsNoAttack,	nA4
	smpsReturn

; FM1 Data
music8B_FM1:
	smpsFMvoice	$02
	smpsModSet	$18,	$01,	$0A,	$04
	dc.b		nRst,	$30,	nRst
music8B_Jump02:
	smpsCall	music8B_Call02
	smpsAlterPitch	$02
	smpsCall	music8B_Call02
	smpsAlterPitch	$01
	smpsCall	music8B_Call02
	smpsAlterPitch	$FC
	smpsCall	music8B_Call02
	smpsAlterPitch	$01
	smpsCall	music8B_Call02
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$30
	smpsCall	music8B_Call03
	smpsCall	music8B_Call02
	smpsAlterPitch	$03
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$24
	smpsCall	music8B_Call03
	dc.b		nRst,	$0C
music8B_Loop02:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$09,	music8B_Loop02
	smpsCall	music8B_Call04
	dc.b		nRst,	$30,	nRst
	smpsAlterPitch	$03
	smpsCall	music8B_Call05
	dc.b		nRst,	$30,	nRst
	smpsAlterPitch	$FD
	smpsCall	music8B_Call04
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
	smpsJump	music8B_Jump02

; PSG1 Data
music8B_PSG1:
	dc.b		nRst,	$04,	nRst,	$30,	nRst
music8B_Jump03:
	smpsCall	music8B_Call02
	smpsAlterPitch	$02
	smpsCall	music8B_Call02
	smpsAlterPitch	$01
	smpsCall	music8B_Call02
	smpsAlterPitch	$FC
	smpsCall	music8B_Call02
	smpsAlterPitch	$01
	smpsCall	music8B_Call02
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$30
	smpsCall	music8B_Call03
	smpsCall	music8B_Call02
	smpsAlterPitch	$03
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	smpsAlterPitch	$FF
	smpsCall	music8B_Call02
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$24
	smpsCall	music8B_Call03
	dc.b		nRst,	$0C
music8B_Loop03:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$09,	music8B_Loop03
	smpsCall	music8B_Call04
	dc.b		nRst,	$30,	nRst
	smpsAlterPitch	$03
	smpsCall	music8B_Call05
	dc.b		nRst,	$30,	nRst
	smpsAlterPitch	$FD
	smpsCall	music8B_Call04
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
	smpsJump	music8B_Jump03

; PSG2 Data
music8B_PSG2:
	dc.b		nRst,	$30,	nRst
music8B_Loop04:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$08,	music8B_Loop04
	dc.b		nA5,	$0C,	nAb5,	nG5,	$08,	nAb5,	$04,	nG5
	dc.b		$08,	nFs5,	$04,	nF5,	$08,	$04,	nE5,	$0C
	dc.b		nEb5,	$08,	nD5,	$10,	nC5,	$0C,	nC5,	nB4
	dc.b		$08,	nC5,	$0C,	nE5,	$06,	nRst,	$2E,	nA5
	dc.b		$0C,	nAb5,	nG5,	$08,	nAb5,	$04,	nG5,	$08
	dc.b		nFs5,	$04,	nF5,	$08,	$04,	nE5,	$0C,	nEb5
	dc.b		$08,	nD5,	$10,	nC5,	$0C,	nC5,	nB4,	$08
	dc.b		nC5,	$0C,	nA4,	$06,	nRst,	$2E,	nC6,	$0C
	dc.b		nB5,	nBb5,	$08,	nB5,	$04,	nBb5,	$08,	nA5
	dc.b		$04,	nAb5,	$08,	$04,	nG5,	$0C,	nFs5,	$08
	dc.b		nF5,	$10,	nE5,	$0C,	nE5,	nD5,	$08,	nE5
	dc.b		$0C,	nG5,	$06,	nRst,	$2E,	nC6,	$0C,	nB5
	dc.b		nBb5,	$08,	nB5,	$04,	nBb5,	$08,	nA5,	$04
	dc.b		nAb5,	$08,	$04,	nG5,	$0C,	nFs5,	$08,	nF5
	dc.b		$10,	nE5,	$0C,	nE5,	nD5,	$08,	nE5,	$0C
	dc.b		nC5,	$06,	nRst,	$2E
music8B_Loop05:
	dc.b		nA5,	$0C,	nE6,	$08,	nA5,	$0C,	nD6,	nA5
	dc.b		$04,	nC6,	$0C,	nA5,	$08,	nB5,	$0C,	nA5
	dc.b		$04,	nC6,	$0C
	smpsLoop	$00,	$07,	music8B_Loop05
	dc.b		nA5,	$0C,	nE6,	$08,	nA5,	$0C,	nC6,	nA5
	dc.b		$06,	nRst,	$2E
	smpsJump	music8B_Loop04

; FM3 Data
music8B_FM3:
	smpsModSet	$18,	$01,	$03,	$04
	smpsFMvoice	$06
	dc.b		nA2,	$14,	nB2,	$04,	nC3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nEb3,	$04,	nRst,	$08
	dc.b		nE3,	$04,	nRst,	$08,	nG3,	$08,	nE3,	$10
	smpsPan		panRight,	$00
	smpsFMvoice	$00
music8B_Loop06:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$08,	music8B_Loop06
	dc.b		nA5,	$0C,	nAb5,	nG5,	$08,	nAb5,	$04,	nG5
	dc.b		$08,	nFs5,	$04,	nF5,	$08,	$04,	nE5,	$0C
	dc.b		nEb5,	$08,	nD5,	$10,	nC5,	$0C,	nC5,	nB4
	dc.b		$08,	nC5,	$0C,	nE5,	$06,	smpsNoAttack,	$2E,	nA5
	dc.b		$0C,	nAb5,	nG5,	$08,	nAb5,	$04,	nG5,	$08
	dc.b		nFs5,	$04,	nF5,	$08,	$04,	nE5,	$0C,	nEb5
	dc.b		$08,	nD5,	$10,	nC5,	$0C,	nC5,	nB4,	$08
	dc.b		nC5,	$0C,	nA4,	$06,	smpsNoAttack,	$2E,	nA5,	$0C
	dc.b		nAb5,	nG5,	$08,	nAb5,	$04,	nG5,	$08,	nFs5
	dc.b		$04,	nF5,	$08,	$04,	nE5,	$0C,	nEb5,	$08
	dc.b		nD5,	$10,	nC5,	$0C,	nC5,	nB4,	$08,	nC5
	dc.b		$0C,	nE5,	$06,	smpsNoAttack,	$2E,	nA5,	$0C,	nAb5
	dc.b		nG5,	$08,	nAb5,	$04,	nG5,	$08,	nFs5,	$04
	dc.b		nF5,	$08,	$04,	nE5,	$0C,	nEb5,	$08,	nD5
	dc.b		$10,	nC5,	$0C,	nC5,	nB4,	$08,	nC5,	$0C
	dc.b		nA4,	$06,	smpsNoAttack,	$2E
	smpsPan		panCentre,	$00
	smpsAlterVol	$06
music8B_Loop07:
	dc.b		nA5,	$0C,	nE6,	nA5,	$08,	nD6,	$0C,	nA5
	dc.b		$04,	nC6,	$08,	nA5,	$0C,	nB5,	nA5,	$04
	dc.b		nC6,	$0C
	smpsLoop	$00,	$07,	music8B_Loop07
	smpsAlterVol	$FA
	dc.b		nA5,	$0C,	nE6,	$08,	nA5,	$0C,	nC6,	nA5
	dc.b		$06,	nRst,	$2E
	smpsPan		panRight,	$00
	smpsJump	music8B_Loop06

; FM2 Data
music8B_FM2:
	smpsFMvoice	$05
	dc.b		nRst,	$30,	nRst
music8B_Loop08:
	dc.b		nA2,	$0C,	nA3,	nG3,	$08,	nA3,	$04,	nG3
	dc.b		$08,	nE3,	$04,	nD3,	$08,	$04,	nEb3,	$0C
	dc.b		nE3,	$08,	nAb2,	$10,	nA2,	$0C,	nA3,	nG3
	dc.b		$08,	nA3,	$04,	nG3,	$08,	nE3,	$04,	nD3
	dc.b		$08,	$04,	nEb3,	$08,	nE3,	$04,	nRst,	$18
	smpsLoop	$00,	$08,	music8B_Loop08
	dc.b		nRst,	$30,	nRst,	nA2,	$08,	$04,	nB2,	$0C
	dc.b		nC3,	nD3,	nEb3,	nD3,	nC3,	nB2,	nRst,	$30
	dc.b		nRst,	nA2,	$0C,	nRst,	nG2,	nRst,	nF2,	nRst
	dc.b		nE2,	nRst,	nRst,	$30,	nRst,	nA2,	$08,	$04
	dc.b		nB2,	$0C,	nC3,	nD3,	nEb3,	nD3,	nC3,	nB2
	dc.b		nRst,	$30,	nRst,	nA2,	$0C,	nA2,	nE2,	$08
	dc.b		nG2,	$0C,	nA2,	nA2,	$04,	nFs2,	$0C,	nG2
	dc.b		nAb2
	smpsJump	music8B_Loop08

; FM4 Data
music8B_FM4:
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsCall	music8B_Call01
music8B_Jump04:
	dc.b		nRst,	$30,	nRst,	$1E
	smpsPan		panRight,	$00
	smpsFMvoice	$06
	dc.b		nAb2,	$12,	nA2,	$06
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nA4,	$08,	nAb4,	$04
	dc.b		nG4,	$08,	nFs4,	$04,	nF4,	$08,	nE4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsPan		panRight,	$00
	smpsFMvoice	$06
	dc.b		nAb2,	$12,	nA2,	$06
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nA4,	$08,	nAb4,	$04
	dc.b		nG4,	$08,	nFs4,	$04,	nF4,	$08,	nE4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsPan		panRight,	$00
	smpsFMvoice	$06
	dc.b		nAb2,	$12,	nA2,	$06
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nA4,	$08,	nAb4,	$04
	dc.b		nG4,	$08,	nFs4,	$04,	nF4,	$08,	nE4,	$04
	dc.b		nRst,	$30,	nRst,	$1E
	smpsPan		panRight,	$00
	smpsFMvoice	$06
	dc.b		nAb2,	$12,	nA2,	$06
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	dc.b		nRst,	$30,	nRst,	$06,	nA4,	$08,	nAb4,	$04
	dc.b		nG4,	$08,	nFs4,	$04,	nF4,	$08,	nE4,	$04
music8B_Loop09:
	dc.b		nRst,	$0C,	nC5,	$06,	nRst,	$12,	$06,	nRst
	dc.b		$12,	nC5,	$06,	nRst,	$0C
	smpsFMvoice	$06
	dc.b		nAb2,	$12,	nA2,	$06,	nRst
	smpsFMvoice	$01
	dc.b		nC5,	$06,	nRst,	$12,	$06,	nRst,	$12,	nC5
	dc.b		$08,	nB4,	$04,	nC5,	$08,	nB4,	$04,	nC5
	dc.b		$0C
	smpsLoop	$00,	$04,	music8B_Loop09
	smpsCall	music8B_Call01
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	dc.b		nRst,	$0C,	nA3,	$08,	nB3,	$04,	nC4,	$08
	dc.b		nB3,	$04,	nA3,	$0C,	$08,	nB3,	$04,	nC4
	dc.b		$08,	nB3,	$04,	nA3,	$06,	nRst,	$12
	smpsPan		panCentre,	$00
	smpsAlterPitch	$0C
	smpsCall	music8B_Call01
	smpsPan		panRight,	$00
	dc.b		nA2,	$0C,	nRst,	nG2,	nRst,	nF2,	nRst,	nE2
	dc.b		nRst
	smpsPan		panCentre,	$00
	smpsCall	music8B_Call01
	smpsPan		panRight,	$00
	dc.b		nRst,	$0C,	nA3,	$08,	nB3,	$04,	nC4,	$08
	dc.b		nB3,	$04,	nA3,	$0C,	$08,	nB3,	$04,	nC4
	dc.b		$08,	nB3,	$04,	nA3,	$06,	nRst,	$12
	smpsPan		panCentre,	$00
	smpsCall	music8B_Call01
	smpsPan		panRight,	$00
	dc.b		nA2,	$0C,	nA2,	nE2,	$08,	nG2,	$0C,	nA2
	dc.b		$06,	nRst,	$2E
	smpsPan		panCentre,	$00
	smpsJump	music8B_Jump04

; PSG3 Data
music8B_PSG3:
	smpsPSGform	$E7
	dc.b		nRst,	$30,	nRst
music8B_Jump05:
	dc.b		nA5,	$0C,	$08,	$04
	smpsJump	music8B_Jump05

; DAC Data
music8B_DAC:
	dc.b		nRst,	$30,	nRst,	$18,	dKick,	$0C,	$08,	$04
music8B_Jump06:
	dc.b		dKick,	$08,	$0C,	$04,	dSnare,	$0C,	dKick,	$08
	dc.b		$0C,	dSnare,	$04,	dKick,	$0C,	dSnare,	dKick,	dKick
	dc.b		$08,	$0C,	$04,	dSnare,	$0C,	dKick,	$08,	$0C
	dc.b		dSnare,	$04,	dKick,	$0C,	dSnare,	dSnare,	$08,	$04
	smpsJump	music8B_Jump06

music8B_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
