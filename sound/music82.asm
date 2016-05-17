; =============================================================================================
; Project Name:		music82
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music82_Header:
	smpsHeaderVoice	music82_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$0E

	smpsHeaderDAC	music82_DAC
	smpsHeaderFM	music82_FM1,	smpsPitch00,	$0A
	smpsHeaderFM	music82_FM2,	smpsPitch00,	$14
	smpsHeaderFM	music82_FM3,	smpsPitch00,	$14
	smpsHeaderFM	music82_FM4,	smpsPitch00,	$1E
	smpsHeaderFM	music82_FM5,	smpsPitch00,	$23
	smpsHeaderPSG	music82_PSG1,	smpsPitch03lo,	$04,	$00
	smpsHeaderPSG	music82_PSG2,	smpsPitch03lo,	$04,	$00
	smpsHeaderPSG	music82_PSG3,	smpsPitch00,	$02,	$00

; FM5 Data
music82_FM5:
	dc.b		nRst,	$30
	smpsFMvoice	$00
	smpsAlterVol	$F8
	dc.b		nB6,	$06,	nG6,	nE6,	nC6,	nG6,	nE6,	nC6
	dc.b		nA5,	nG6,	nE6,	nC6,	nA5,	nG6,	nE6,	nC6
	dc.b		nA5,	nA6,	nF6,	nD6,	nBb5,	nA6,	nF6,	nD6
	dc.b		nBb5
	smpsAlterVol	$08
music82_Jump01:
	smpsAlterVol	$F8
	smpsPan		panCentre,	$00
	smpsModSet	$30,	$01,	$04,	$04
	smpsFMvoice	$00
music82_Loop01:
	dc.b		nG5,	$30,	smpsNoAttack,	$30,	nA5,	smpsNoAttack,	$30,	nF5
	dc.b		smpsNoAttack,	$30,	nE5,	smpsNoAttack,	$30
	smpsLoop	$00,	$04,	music82_Loop01
	smpsFMvoice	$00
	smpsAlterVol	$FC
	smpsPan		panLeft,	$00
	dc.b		nE5,	$18,	nE5,	nE5,	nE5,	nD5,	nD5,	nD5
	dc.b		nD5,	nD5,	nD5,	nD5,	nD5,	nE5,	nE5,	nE5
	dc.b		nE5,	nE5,	nE5,	nE5,	nE5,	nD5,	nD5,	nD5
	dc.b		nD5
	smpsAlterVol	$06
	smpsFMvoice	$00
	dc.b		nG4,	$06,	nRst,	$0C,	nA4,	$30,	smpsNoAttack,	$1E
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$12,	nRst,	$1E
	smpsAlterVol	$06
	smpsJump	music82_Jump01

; FM2 Data
music82_FM2:
	smpsFMvoice	$00
	dc.b		nD5,	$0C,	nRst,	$06,	nE5,	$30,	smpsNoAttack,	$1E
	dc.b		nC5,	$30,	nD5
music82_Jump02:
	smpsFMvoice	$00
	dc.b		nRst,	$0C,	nG5,	$06,	nRst,	nA5,	nRst,	nG5
	dc.b		nRst,	nC6,	nRst,	nC6,	nRst,	nD6,	nE6,	nRst
	dc.b		$0C,	nRst,	nD6,	$18,	nA5,	$06,	nRst,	nC6
	dc.b		nC6,	nRst,	nD6,	$0C,	nRst,	$12,	nRst,	$1E
	dc.b		nBb5,	$06,	nC6,	nBb5,	nD6,	nRst,	nC6,	nRst
	dc.b		nBb5,	nC6,	nRst,	nA5,	smpsNoAttack,	nA5,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18,	nRst,	$0C,	nG5,	$06,	nRst
	dc.b		nA5,	nRst,	nG5,	nRst,	nC6,	nRst,	nC6,	nRst
	dc.b		nD6,	nE6,	nRst,	$0C,	nRst,	nD6,	$18,	nA5
	dc.b		$0C,	nC6,	nRst,	$06,	nD6,	$0C,	nRst,	$12
	dc.b		nRst,	$1E,	nBb5,	$06,	nC6,	nBb5,	nD6,	nRst
	dc.b		nC6,	nRst,	nBb5,	nC6,	nRst,	nA5,	smpsNoAttack,	nA5
	dc.b		$30,	smpsNoAttack,	$18,	nRst,	$18
	smpsFMvoice	$0
	smpsAlterVol	$FD
	smpsModSet	$12,	$01,	$0C,	$04
	dc.b		nRst,	$0C,	nG4,	$06,	nRst,	nG4,	$0C,	nA4
	dc.b		$06,	nRst,	nC5,	nRst,	nC5,	$0C,	nD5,	nC5
	dc.b		nE5,	nD5,	$18,	nA4,	$30,	smpsNoAttack,	$0C,	nRst
	dc.b		$0C,	nBb4,	$06,	nRst,	nBb4,	$0C,	nC5,	nD5
	dc.b		nC5,	nBb4,	$06,	nC5,	$12,	nA4,	$30,	smpsNoAttack
	dc.b		$30,	nRst,	$0C,	nG4,	$18,	nA4,	$0C,	nC5
	dc.b		$06,	nRst,	nC5,	$0C,	nD5,	nC5,	nE5,	nD5
	dc.b		$18,	nA4,	$30,	smpsNoAttack,	$0C,	nRst,	$0C,	nBb4
	dc.b		$06,	nRst,	nBb4,	$0C,	nC5,	nD5,	nC5,	nBb4
	dc.b		$06,	nC5,	$0C,	nA4,	$06,	smpsNoAttack,	$30,	smpsNoAttack
	dc.b		$30
	smpsAlterVol	$03
	dc.b		smpsModOff
	smpsFMvoice	$0
	smpsAlterPitch	$F4
	dc.b		nRst,	$18,	nF5,	nG5,	nA5,	nB5,	nC6,	nD6
	dc.b		nB5,	nRst,	nB5,	nC6,	nD6,	nC6,	nD6,	nE6
	dc.b		nC6,	nRst,	nF5,	nG5,	nA5,	nB5,	nC6,	nD6
	dc.b		nB5
	smpsAlterPitch	$0C
	smpsAlterVol	$FD
	smpsFMvoice	$0
	dc.b		nD6,	$06,	nD6,	nRst,	nE6,	$30,	smpsNoAttack,	$1E
	smpsFMvoice	$00
	smpsAlterPitch	$0C
	smpsAlterVol	$09
	dc.b		nA6,	$06,	nE6,	nC6,	nA5,	nE6,	nC6,	nA5
	dc.b		nE5,	nC6,	nA5,	nE5,	nC5,	nA5,	nE5,	nC5
	dc.b		nA4
	smpsAlterPitch	$F4
	smpsAlterVol	$FA
	smpsJump	music82_Jump02

; FM3 Data
music82_FM3:
	smpsFMvoice	$0
	smpsAlterNote	$01
	dc.b		nF5,	$0C,	nRst,	$06,	nG5,	$30,	smpsNoAttack,	$1E
	dc.b		nE5,	$30,	nF5
music82_Jump03:
	smpsAlterNote	$03
	smpsFMvoice	$0
	smpsPan		panLeft,	$00
	dc.b		nRst,	$0C,	nG4,	$06,	nRst,	nA4,	nRst,	nG4
	dc.b		nRst,	nC5,	nRst,	nC5,	nRst,	nD5,	nE5,	nRst
	dc.b		$0C,	nRst,	nD5,	$18,	nA4,	$06,	nRst,	nC5
	dc.b		nC5,	nRst,	nD5,	$0C,	nRst,	$12,	nRst,	$1E
	dc.b		nBb4,	$06,	nC5,	nBb4,	nD5,	nRst,	nC5,	nRst
	dc.b		nBb4,	nC5,	nRst,	nA4,	smpsNoAttack,	nA4,	$30,	smpsNoAttack
	dc.b		$18,	nRst,	$18,	nRst,	$0C,	nG4,	$06,	nRst
	dc.b		nA4,	nRst,	nG4,	nRst,	nC5,	nRst,	nC5,	nRst
	dc.b		nD5,	nE5,	nRst,	$0C,	nRst,	nD5,	$18,	nA4
	dc.b		$0C,	nC5,	nRst,	$06,	nD5,	$0C,	nRst,	$12
	dc.b		nRst,	$1E,	nBb4,	$06,	nC5,	nBb4,	nD5,	nRst
	dc.b		nC5,	nRst,	nBb4,	nC5,	nRst,	nA4,	smpsNoAttack,	nA4
	dc.b		$30,	smpsNoAttack,	$18,	nRst,	$18
	smpsFMvoice	$0
	smpsAlterVol	$07
	smpsPan		panLeft,	$00
	dc.b		nRst,	$1E,	nG4,	$06,	nRst,	nG4,	$0C,	nA4
	dc.b		$06,	nRst,	nC5,	nRst,	nC5,	$0C,	nD5,	nC5
	dc.b		nE5,	nD5,	$18,	nA4,	$30,	smpsNoAttack,	$0C,	nRst
	dc.b		$0C,	nBb4,	$06,	nRst,	nBb4,	$0C,	nC5,	nD5
	dc.b		nC5,	nBb4,	$06,	nC5,	$12,	nA4,	$1E
	smpsFMvoice	$0
	smpsAlterNote	$00
	smpsAlterVol	$F9
	dc.b		nA5,	$06,	nE6,	$03,	nRst,	$03,	nRst,	$06
	dc.b		nE6,	$03,	nRst,	$03,	nD6,	$0C,	nC6
	smpsFMvoice	$0
	smpsAlterNote	$01
	smpsAlterVol	$07
	dc.b		nRst,	$18,	nG4,	nA4,	$0C,	nC5,	$06,	nRst
	dc.b		nC5,	$0C,	nD5,	nC5,	nE5,	nD5,	$18,	nA4
	dc.b		$30,	smpsNoAttack,	$0C,	nRst,	$0C,	nBb4,	$06,	nRst
	dc.b		nBb4,	$0C,	nC5,	nD5,	nC5,	nBb4,	$06,	nC5
	dc.b		$0C,	nA4,	$06
	smpsFMvoice	$0
	smpsAlterVol	$F9
	smpsAlterNote	$00
	dc.b		nA5,	$0C,	nC6,	$06,	nRst,	nA5,	nRst,	nD6
	dc.b		$12,	nC6,	$06,	nRst,	$18
	smpsFMvoice	$0
	smpsPan		panCentre,	$00
	smpsAlterNote	$01
	dc.b		nC6,	$24,	nA5,	$0C,	nRst,	$1E,	nA5,	$06
	dc.b		nC6,	$0C,	nB5,	$06,	nRst,	nC6,	nB5,	$06
	dc.b		nRst,	$18
	smpsFMvoice	$00
	smpsAlterNote	$00
	smpsAlterVol	$FE
	smpsAlterPitch	$0C
	smpsPan		panRight,	$00
	dc.b		nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5,	$1E
	smpsAlterPitch	$F4
	smpsAlterVol	$02
	smpsFMvoice	$0
	smpsPan		panCentre,	$00
	smpsAlterNote	$01
	dc.b		nRst,	$18,	nB5,	$0C,	nC6,	nD6,	nC6,	nB5
	dc.b		nD5,	nC6,	$06,	nRst,	nC6,	$18,	nA6,	$0C
	dc.b		nRst,	$30,	nC6,	$24,	nA5,	$0C,	nRst,	$1E
	dc.b		nA5,	$06,	nC6,	$0C,	nB5,	$06,	nRst,	nC6
	dc.b		nB5,	$06,	nRst,	$18
	smpsFMvoice	$00
	smpsAlterNote	$00
	smpsAlterVol	$FE
	smpsAlterPitch	$0C
	smpsPan		panRight,	$00
	dc.b		nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5,	$1E
	smpsAlterVol	$02
	smpsAlterPitch	$F4
	smpsFMvoice	$0
	smpsPan		panCentre,	$00
	smpsAlterNote	$01
	dc.b		nD6,	$06,	nC6,	nRst,	nA5,	$30,	smpsNoAttack,	$1E
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$12,	nRst,	$1E
	smpsJump	music82_Jump03

; FM4 Data
music82_FM4:
	smpsFMvoice	$0
	smpsAlterVol	$F8
	dc.b		nF4,	$0C,	nRst,	$06,	nG4,	$30,	smpsNoAttack,	$1E
	dc.b		nE4,	$30,	nF4
	smpsAlterVol	$04
music82_Jump04:
	smpsPan		panCentre,	$00
	smpsFMvoice	$00
	smpsModSet	$04,	$01,	$FE,	$04
	smpsAlterPitch	$0C
music82_Loop02:
	dc.b		nE5,	$30,	smpsNoAttack,	$30,	nFs5,	smpsNoAttack,	$30,	nD5
	dc.b		smpsNoAttack,	$30,	nC5,	smpsNoAttack,	$30
	smpsLoop	$00,	$04,	music82_Loop02
	smpsAlterPitch	$F4
	dc.b		smpsModOff
	smpsFMvoice	$00
	smpsPan		panCentre,	$00
	dc.b		nC5,	$18,	nC5,	nC5,	nC5,	nB4,	nB4,	nB4
	dc.b		nB4,	nB4,	nB4,	nB4,	nB4,	nC5,	nC5,	nC5
	dc.b		nC5,	nC5,	nC5,	nC5,	nC5,	nB4,	nB4,	nB4
	dc.b		nB4
	smpsFMvoice	$00
	smpsAlterVol	$04
	dc.b		nD4,	$06,	nRst,	$0C,	nE4,	$30,	smpsNoAttack,	$1E
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$12,	nRst,	$1E
	smpsAlterVol	$FC
	smpsJump	music82_Jump04

; FM1 Data
music82_FM1:
	smpsFMvoice	$01
	dc.b		nBb2,	$12,	nC3,	$30,	smpsNoAttack,	$0C,	nG3,	$06
	dc.b		nE3,	nC3,	nA2,	$0C,	nA3,	$06,	nA3,	nA2
	dc.b		$0C,	nA3,	$06,	nA3,	nBb2,	$0C,	nBb3,	$06
	dc.b		nBb3,	nBb2,	$0C,	nBb3,	$06,	nBb3
music82_Loop03:
	dc.b		nC3,	$0C,	nC4,	$06,	nRst,	nC4,	$0C,	nG3
	dc.b		nD4,	$12,	nC4,	$0C,	nG3,	$06,	nA3,	nC4
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nD4,	$0C,	nA3
	dc.b		nE4,	$12,	nD4,	$06,	nRst,	nA3,	nB3,	nD4
	dc.b		nBb2,	$0C,	nBb3,	$06,	nRst,	nBb3,	$0C,	nF3
	dc.b		nC4,	$12,	nBb3,	$0C,	nF3,	$06,	nG3,	nBb3
	dc.b		nA2,	$0C,	nA3,	$06,	nA2,	nB2,	$0C,	nB3
	dc.b		$06,	nB2,	nC3,	$0C,	nC4,	$06,	nC3,	nA2
	dc.b		$0C,	nA3,	$06,	nA2
	smpsLoop	$00,	$04,	music82_Loop03
	dc.b		nF3,	$0C,	nF4,	nC3,	nC4,	nF3,	nF4,	nC3
	dc.b		nC4,	nE3,	nE4,	nB2,	nB3,	nE3,	nE4,	nB2
	dc.b		nB3,	nE3,	nE4,	nB2,	nB3,	nAb2,	nAb3,	nE2
	dc.b		nE3,	nA2,	nA3,	nB2,	nB3,	nC3,	nC4,	nA2
	dc.b		nA3,	nF3,	nF4,	nC3,	nC4,	nF3,	nF4,	nC3
	dc.b		nC4,	nE3,	nE4,	nB2,	nB3,	nE3,	nE4,	nB2
	dc.b		nB3,	nG2,	$06,	nG2,	nRst,	nA2,	$30,	smpsNoAttack
	dc.b		$1E,	$06,	$0C,	$06,	nB2,	$0C,	nC3,	nD3
	dc.b		nC3,	nB2,	$06,	nA2,	$12
	smpsJump	music82_Loop03

; PSG1 Data
music82_PSG1:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
music82_Jump05:
	smpsAlterPitch	$0C
	smpsPSGvoice	$00
	smpsSetVol	$02
music82_Loop04:
	dc.b		nG5,	$30,	smpsNoAttack,	$30,	nA5,	smpsNoAttack,	$30,	nF5
	dc.b		smpsNoAttack,	$30,	nE5,	smpsNoAttack,	$30
	smpsLoop	$00,	$04,	music82_Loop04
	dc.b		nRst,	$30,	nRst
	smpsPSGvoice	$00
	smpsSetVol	$FF
	dc.b		nRst,	nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5
	dc.b		$0C
	smpsSetVol	$FF
	smpsPSGvoice	$02
	smpsSetVol	$03
	dc.b		nB5,	$06,	nRst,	$06
	smpsSetVol	$03
	dc.b		nB5,	$03,	nRst,	$03
	smpsSetVol	$FA
	smpsPSGvoice	$00
	smpsAlterPitch	$F4
	dc.b		nRst,	$30,	nRst,	nC6,	$06,	nRst,	nC6,	$18
	dc.b		nA5,	$0C,	nRst,	$30,	nRst,	nRst
	smpsAlterPitch	$0C
	smpsSetVol	$01
	dc.b		nRst,	nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5
	dc.b		$0C
	smpsSetVol	$FF
	smpsPSGvoice	$02
	smpsSetVol	$03
	dc.b		nB5,	$06,	nRst,	$06
	smpsSetVol	$03
	dc.b		nB5,	$03,	nRst,	$03
	smpsSetVol	$FA
	smpsAlterPitch	$F4
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
	smpsJump	music82_Jump05

; PSG2 Data
music82_PSG2:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
music82_Jump06:
	smpsSetVol	$03
	smpsPSGvoice	$00
	smpsAlterNote	$00
music82_Loop05:
	dc.b		nE5,	$30,	smpsNoAttack,	$30,	nFs5,	smpsNoAttack,	$30,	nD5
	dc.b		smpsNoAttack,	$30,	nC5,	smpsNoAttack,	$30
	smpsLoop	$00,	$04,	music82_Loop05
	dc.b		smpsModOff
	smpsSetVol	$FD
	dc.b		nRst,	$30,	nRst
	smpsPSGvoice	$00
	smpsAlterNote	$01
	smpsSetVol	$01
	dc.b		nRst,	nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5
	dc.b		$0C
	smpsSetVol	$FF
	smpsPSGvoice	$02
	smpsSetVol	$03
	dc.b		nB5,	$06,	nRst,	$06
	smpsSetVol	$03
	dc.b		nB5,	$03,	nRst,	$03
	smpsSetVol	$FA
	smpsPSGvoice	$00
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst
	smpsSetVol	$01
	dc.b		nRst,	nB5,	$03,	nRst,	$09,	nC6,	$06,	nB5
	dc.b		$0C
	smpsSetVol	$FF
	smpsPSGvoice	$02
	smpsSetVol	$03
	dc.b		nB5,	$06,	nRst,	$06
	smpsSetVol	$03
	dc.b		nB5,	$03,	nRst,	$03
	smpsSetVol	$FA
	dc.b		nRst,	$30,	nRst,	nRst,	nRst
	smpsJump	music82_Jump06

; PSG3 Data
music82_PSG3:
	smpsPSGform	$E7
	smpsPSGvoice	$02
	dc.b		nRst,	$0C,	nA5,	$18,	nA5,	nA5,	nA5,	$0C
	dc.b		nRst,	$30,	nRst
music82_Loop06:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	smpsLoop	$00,	$07,	music82_Loop06
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C
	smpsPSGvoice	$03
	dc.b		nA5
	smpsPSGvoice	$02
music82_Loop07:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	smpsLoop	$00,	$07,	music82_Loop07
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5
	smpsPSGvoice	$03
	dc.b		nA5,	$0C
	smpsPSGvoice	$02
	dc.b		nA5,	$06,	nA5
music82_Loop08:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	nA5,	$06
	dc.b		nA5
	smpsLoop	$00,	$03,	music82_Loop08
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5
	smpsPSGvoice	$03
	dc.b		nA5,	$0C
	smpsPSGvoice	$02
	dc.b		nA5,	$06,	nA5,	nA5,	$0C,	$06,	nA5,	nA5
	dc.b		$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5,	nA5
	dc.b		$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5,	nA5
	dc.b		$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	smpsPSGvoice	$03
	dc.b		nA5,	$0C
	smpsPSGvoice	$02
	dc.b		nA5,	$06,	nA5,	nA5,	$0C,	$06,	nA5,	nA5
	dc.b		$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	smpsPSGvoice	$03
	dc.b		nA5,	$0C
	smpsPSGvoice	$02
	dc.b		nA5,	$06,	nA5
	smpsPSGvoice	$01
	dc.b		nA5,	$18,	nA5,	nA5,	nA5
	smpsPSGvoice	$02
	smpsJump	music82_Loop06

; DAC Data
music82_DAC:
	dc.b		dKick,	$12,	$30,	smpsNoAttack,	$1E,	$06,	$8C,	$0C
	dc.b		$8E,	$06,	$8C,	$0C,	$8C,	$8C,	dKick,	$8E
	dc.b		$06,	$8C,	$8E,	$0C
music82_Loop09:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
	smpsLoop	$00,	$07,	music82_Loop09
	dc.b		dKick,	$18,	dSnare,	dKick,	$0C,	dSnare,	$18,	$06
	dc.b		dSnare
music82_Loop0A:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
	smpsLoop	$00,	$03,	music82_Loop0A
	dc.b		dKick,	$18,	dSnare,	dKick,	$0C,	dSnare,	$18,	$0C
music82_Loop0B:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
	smpsLoop	$00,	$03,	music82_Loop0B
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare,	$0C,	$06,	dSnare
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare,	dKick,	dSnare,	dKick
	dc.b		$0C,	dSnare,	dSnare,	$18
music82_Loop0C:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
	smpsLoop	$00,	$03,	music82_Loop0C
	dc.b		dKick,	$18,	dSnare,	dKick,	$0C,	dSnare,	dSnare,	$18
	dc.b		dKick,	$12,	dSnare,	$30,	nRst,	$06,	dSnare,	$18
	dc.b		dKick,	$06,	$8C,	$0C,	$06,	dSnare,	$0C,	$8C
	dc.b		dKick,	$8E,	$8E,	$8E,	$06,	$8E
	smpsJump	music82_Loop09

music82_Voices:
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b		$3D,$02,$02,$01,$02,$14,$0E,$8C,$0E,$08,$0A,$07,$0A,$00,$0E,$0E
	dc.b		$0E,$1F,$1F,$1F,$1F,$1A,$04,$04,$04;			Voice 02
	dc.b		$3D,$01,$21,$51,$01,$12,$14,$14,$0F,$0A,$05,$05,$05,$00,$00,$00
	dc.b		$00,$2B,$2B,$2B,$1B,$19,$00,$00,$00;			Voice 03
	dc.b		$3B,$07,$34,$32,$01,$1F,$14,$5F,$5F,$02,$02,$03,$04,$01,$01,$02
	dc.b		$03,$13,$13,$13,$17,$1E,$28,$28,$00;			Voice 04
	dc.b		$3B,$52,$31,$31,$51,$12,$14,$12,$14,$0E,$00,$0E,$02,$00,$00,$00
	dc.b		$01,$47,$07,$57,$37,$1C,$18,$1D,$00;			Voice 05
	dc.b		$3D,$01,$21,$50,$01,$12,$14,$14,$0F,$0A,$05,$05,$05,$00,$00,$00
	dc.b		$00,$26,$28,$28,$18,$19,$00,$00,$00;			Voice 06
	dc.b		$08,$0A,$70,$30,$00,$1F,$1F,$5F,$5F,$12,$0E,$0A,$0A,$00,$04,$04
	dc.b		$03,$2F,$2F,$2F,$2F,$24,$2D,$13,$00;			Voice 07
	dc.b		$3D,$01,$02,$00,$01,$1F,$0E,$0E,$0E,$07,$1F,$1F,$1F,$00,$00,$00
	dc.b		$00,$1F,$0F,$0F,$0F,$17,$0D,$0C,$0C;			Voice 08
	even
