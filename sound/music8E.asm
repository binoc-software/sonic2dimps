; =============================================================================================
; Project Name:		music8E
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8E_Header:
	smpsHeaderVoice	music8E_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$0D

	smpsHeaderDAC	music8E_DAC
	smpsHeaderFM	music8E_FM1,	smpsPitch01lo,	$08
	smpsHeaderFM	music8E_FM2,	smpsPitch01hi,	$0A
	smpsHeaderFM	music8E_FM3,	smpsPitch00,	$10
	smpsHeaderFM	music8E_FM4,	smpsPitch01lo,	$10
	smpsHeaderFM	music8E_FM5,	smpsPitch01lo,	$10
	smpsHeaderPSG	music8E_PSG1,	smpsPitch00,	$07,	$00
	smpsHeaderPSG	music8E_PSG2,	smpsPitch00,	$07,	$00
	smpsHeaderPSG	music8E_PSG3,	smpsPitch00,	$00,	$02

; PSG1 Data
music8E_PSG1:
	smpsStop

; PSG2 Data
music8E_PSG2:
	smpsStop

music8E_Call01:
	smpsFMvoice	$01
	dc.b		nFs4,	$06,	nCs4,	nE4,	nFs4
	smpsReturn

music8E_Call02:
	smpsFMvoice	$01
	dc.b		nCs5,	$06,	nCs5,	nA4,	$04,	nRst,	$08,	nB4
	dc.b		$06,	nCs5
	smpsReturn

music8E_Call03:
	smpsFMvoice	$05
	dc.b		nA5,	$05,	nRst,	$13,	nA5,	$12,	nA5,	$05
	dc.b		nRst,	$0D
	smpsCall	music8E_Call01
	smpsFMvoice	$05
	dc.b		nA5,	nA5,	nRst,	$0C,	nA5,	$06,	nA5,	$05
	dc.b		nRst,	$0D,	nA5,	$06,	nB5,	$30,	smpsNoAttack,	$06
	dc.b		nA5,	$05,	nRst,	$13,	nA5,	$12,	nA5,	$05
	dc.b		nRst,	$0D
	smpsCall	music8E_Call01
	dc.b		nRst,	$0C
	smpsReturn

music8E_Call04:
	dc.b		nCs5,	$0C,	nB4,	$06,	nA4,	nB4,	nA4,	$04
	dc.b		smpsNoAttack,	$08,	nA4,	$04,	nRst,	$0E
	smpsCall	music8E_Call01
	smpsFMvoice	$00
	dc.b		nFs4,	nA4,	nCs5,	$0C,	nB4,	$06,	nA4,	nB4
	dc.b		nA4,	$0C,	nB4,	$04,	nRst,	$08,	nA4,	$04
	dc.b		nRst,	$08,	nB4,	$04,	nRst,	$08,	nCs5,	$12
	dc.b		nA4,	$06,	nFs4,	nRst,	nFs4,	nRst,	$24
	smpsCall	music8E_Call01
	dc.b		nRst,	$0C,	nRst,	$30
	smpsCall	music8E_Call02
	smpsReturn

music8E_Call05:
	smpsAlterVol	$04
	smpsFMvoice	$01
	dc.b		nD4,	$12,	nRst,	$06,	nD4,	$12,	nRst,	$06
	dc.b		nE4,	$0C,	nRst,	$12
	smpsAlterVol	$FC
	smpsReturn

music8E_Call06:
	smpsFMvoice	$00
	dc.b		nCs4,	$06,	nE4,	nFs4,	nAb4,	$02,	smpsNoAttack,	nA4
	dc.b		$0A,	nFs4,	$06,	nCs4,	nE4,	nFs4,	$04,	nRst
	dc.b		$08,	nAb4,	$02,	smpsNoAttack,	nA4,	$10,	nFs4,	$06
	dc.b		nCs4,	nE4,	nFs4,	$04,	nRst,	$0E
	smpsReturn

music8E_Call08:
	dc.b		nFs5,	$05,	nRst,	$13,	nFs5,	$12,	nFs5,	$05
	dc.b		nRst,	$25,	nFs5,	$06,	nFs5,	nRst,	$0C,	nFs5
	dc.b		$06,	nFs5,	$05,	nRst,	$0D,	nFs5,	$06,	nAb5
	dc.b		$30,	smpsNoAttack,	$06,	nFs5,	$05,	nRst,	$13,	nFs5
	dc.b		$12,	nFs5,	$05,	nRst,	$30,	nRst,	$01,	nRst
	dc.b		$30,	nRst
	smpsReturn

music8E_Call09:
	dc.b		nA5,	$05,	nRst,	$13,	nA5,	$12,	nA5,	$05
	dc.b		nRst,	$25,	nA5,	$06,	nA5,	nRst,	$0C,	nA5
	dc.b		$06,	nA5,	$05,	nRst,	$0D,	nA5,	$06,	nB5
	dc.b		$30,	smpsNoAttack,	$06,	nA5,	$05,	nRst,	$13,	nA5
	dc.b		$12,	nA5,	$05,	nRst,	$30,	nRst,	$01,	nRst
	dc.b		$30,	nRst
	smpsReturn

music8E_Call0A:
	dc.b		nFs2,	$0C,	nFs3,	$06,	nRst,	nE3,	nRst,	nFs3
	dc.b		nFs2,	nRst,	nFs2,	nFs3,	nRst,	nE3,	nRst,	nFs3
	dc.b		$0C
	smpsReturn

music8E_Call07:
	smpsAlterNote	$F8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$F0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$E8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$E0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$D8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$D0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$C8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$C0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$C8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$D0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$D8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$E0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$E8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$F0
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$F8
	dc.b		smpsNoAttack,	$03
	smpsAlterNote	$00
	dc.b		smpsNoAttack,	$03
	smpsReturn

music8E_Call0B:
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	$18,	$0C,	dSnare
	dc.b		dKick,	dKick,	$18,	dSnare,	$0C,	dKick,	$12,	dKick
	dc.b		dSnare,	$18,	dKick,	dSnare,	$0C,	dKick,	$18,	$0C
	dc.b		dSnare,	dKick,	dKick,	$18,	dSnare,	$0C,	dKick,	$18
	dc.b		dSnare,	$0C,	dSnare,	dSnare,	$06,	dSnare
	smpsReturn

music8E_Call0C:
	dc.b		dKick,	$18,	dSnare,	$0C,	dKick,	$18,	$0C,	dSnare
	dc.b		dKick,	dKick,	$18,	dSnare,	$0C,	dKick,	$12,	dKick
	dc.b		dSnare,	$18,	dKick,	dSnare,	$0C,	dKick,	$18,	$0C
	dc.b		dSnare,	dKick,	dKick,	$18,	dSnare,	$0C,	dKick,	dSnare
	dc.b		$06,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare
	smpsReturn

; FM1 Data
music8E_FM1:
	smpsModSet	$06,	$01,	$FA,	$04
	smpsCall	music8E_Call03
	dc.b		nRst,	$30,	nRst
	smpsCall	music8E_Call03
	dc.b		nRst,	$30
	smpsCall	music8E_Call02
	smpsFMvoice	$00
	dc.b		nFs4,	nA4
music8E_Jump01:
	smpsCall	music8E_Call04
	smpsFMvoice	$00
	dc.b		nFs4,	$06,	nA4
	smpsCall	music8E_Call04
	dc.b		nRst,	$0C
music8E_Loop01:
	dc.b		nRst,	$0C
	smpsFMvoice	$00
	dc.b		nB4,	$04,	nRst,	$08,	nB4,	$0C,	nA4,	$06
	dc.b		nB4,	nRst,	nB4,	nRst,	nA4,	nB4,	$0C,	nA4
	dc.b		nCs5,	$06,	nA4,	nRst,	nFs4
	smpsFMvoice	$01
	dc.b		nA4,	$04,	nRst,	$08,	nA4,	$04,	nRst,	$08
	dc.b		nA4,	$04
	smpsAlterVol	$FD
	dc.b		nRst,	$08,	nA4,	$04,	nRst,	$08,	nA4,	$06
	dc.b		nA4,	$12
	smpsAlterVol	$FD
	dc.b		nFs4,	$04,	nRst,	$08
	smpsAlterVol	$06
	smpsFMvoice	$00
	dc.b		nB4,	$04,	nRst,	$08,	nB4,	$0C,	nA4,	$06
	dc.b		nB4,	nRst,	nB4,	nRst,	nA4,	nB4,	$0C,	nA4
	smpsAlterVol	$FD
	dc.b		nCs5,	$06
	smpsAlterVol	$04
	smpsFMvoice	$01
	dc.b		nFs4,	$03,	smpsNoAttack,	nG4,	smpsNoAttack,	nAb4,	$24,	nD4
	dc.b		$03,	smpsNoAttack,	nEb4,	smpsNoAttack,	nE4,	smpsNoAttack,	nF4,	smpsNoAttack
	dc.b		nFs4,	$24
	smpsAlterVol	$FF
	smpsLoop	$00,	$02,	music8E_Loop01
	smpsCall	music8E_Call05
	smpsCall	music8E_Call06
	smpsCall	music8E_Call05
	smpsFMvoice	$00
	dc.b		nCs4,	$06,	nE4,	nFs4,	nAb4,	$02,	smpsNoAttack,	nA4
	dc.b		$0A,	nFs4,	$06,	nCs4,	nE4,	nFs4,	$04,	nRst
	dc.b		$08,	nB4,	$0C,	nA4,	$06,	nB4,	nCs5,	$04
	dc.b		nRst,	$1A
	smpsCall	music8E_Call05
	smpsCall	music8E_Call06
	smpsCall	music8E_Call05
	smpsFMvoice	$00
	dc.b		nCs4,	$06,	nE4,	nFs4,	nA4,	$04,	nRst,	$08
	dc.b		nB4,	$04,	nRst,	$08,	nCs5,	$18,	nE5,	nFs5
	dc.b		smpsNoAttack,	nFs5,	$0C
	smpsModSet	$18,	$01,	$05,	$04
	smpsCall	music8E_Call07
	dc.b		smpsNoAttack,	nFs5,	$30,	smpsNoAttack,	$0C,	nRst,	$18,	nCs5
	dc.b		$06,	nCs5,	nA4,	$04,	nRst,	$08,	nFs4,	$06
	dc.b		nA4,	nRst,	nFs4
	smpsCall	music8E_Call07
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$30,	smpsNoAttack,	$18,	nRst,	$0C
	dc.b		nFs4,	$06,	nA4
	smpsModSet	$06,	$01,	$FA,	$04
	smpsJump	music8E_Jump01

; FM4 Data
music8E_FM4:
	smpsModSet	$0C,	$01,	$FB,	$04
	smpsFMvoice	$02
music8E_Loop02:
	smpsCall	music8E_Call08
	smpsLoop	$00,	$02,	music8E_Loop02
music8E_Loop03:
	smpsCall	music8E_Call08
	smpsLoop	$00,	$04,	music8E_Loop03
	dc.b		smpsModOff
music8E_Loop04:
	dc.b		nAb5,	$12,	nRst,	$06,	nAb5,	$12,	nRst,	$06
	dc.b		nA5,	$0C,	nRst,	$24,	nRst,	$30,	nRst
	smpsLoop	$00,	$04,	music8E_Loop04
	smpsModSet	$0C,	$01,	$05,	$04
	dc.b		nRst,	$30,	nRst
	smpsFMvoice	$05
	smpsAlterVol	$F8
music8E_Loop05:
	dc.b		nCs5,	$04,	nRst,	$08,	nB4,	$04,	nRst,	$08
	dc.b		nCs5,	$0C,	nB4,	$06,	nCs5,	$04,	nRst,	$08
	dc.b		nCs5,	$06,	nB4,	$04,	nRst,	$08,	nCs5,	$0C
	dc.b		nB4,	$04,	nRst,	$08
	smpsLoop	$00,	$02,	music8E_Loop05
	dc.b		nFs5,	$04,	nRst,	$08,	nE5,	$04,	nRst,	$08
	dc.b		nFs5,	$0C,	nE5,	$06,	nFs5,	$04,	nRst,	$08
	dc.b		nFs5,	$06,	nE5,	$04,	nRst,	$08,	nFs5,	$0C
	dc.b		nE5,	$04,	nRst,	$08
	smpsFMvoice	$02
	smpsAlterVol	$08
	smpsJump	music8E_Loop03

; FM5 Data
music8E_FM5:
	smpsModSet	$0C,	$01,	$05,	$04
	smpsPan		panLeft,	$00
	smpsFMvoice	$02
music8E_Loop06:
	smpsCall	music8E_Call09
	smpsLoop	$00,	$02,	music8E_Loop06
music8E_Loop07:
	smpsCall	music8E_Call09
	smpsLoop	$00,	$04,	music8E_Loop07
	dc.b		smpsModOff
music8E_Loop08:
	dc.b		nB5,	$12,	nRst,	$06,	nB5,	$12,	nRst,	$06
	dc.b		nCs6,	$0C,	nRst,	$24,	nRst,	$30,	nRst
	smpsLoop	$00,	$04,	music8E_Loop08
	smpsModSet	$0C,	$01,	$05,	$04
music8E_Loop09:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$02,	music8E_Loop09
	smpsFMvoice	$05
	smpsAlterVol	$F8
	dc.b		nFs5,	$04,	nRst,	$08,	nE5,	$04,	nRst,	$08
	dc.b		nFs5,	$0C,	nE5,	$06,	nFs5,	$04,	nRst,	$08
	dc.b		nFs5,	$06,	nE5,	$04,	nRst,	$08,	nFs5,	$0C
	dc.b		nE5,	$04,	nRst,	$08,	nCs6,	$04,	nRst,	$08
	dc.b		nB5,	$04,	nRst,	$08,	nCs6,	$0C,	nB5,	$06
	dc.b		nCs6,	$04,	nRst,	$08,	nCs6,	$06,	nB5,	$04
	dc.b		nRst,	$08,	nCs6,	$0C,	nB5,	$04,	nRst,	$08
	smpsFMvoice	$02
	smpsAlterVol	$08
	smpsJump	music8E_Loop07

; FM3 Data
music8E_FM3:
	smpsModSet	$06,	$01,	$05,	$04
	smpsPan		panRight,	$00
	smpsFMvoice	$05
music8E_Loop0A:
	smpsCall	music8E_Call08
	smpsLoop	$00,	$02,	music8E_Loop0A
music8E_Jump02:
	smpsFMvoice	$03
music8E_Loop0B:
	smpsCall	music8E_Call0A
	smpsLoop	$00,	$03,	music8E_Loop0B
	dc.b		nE2,	$0C,	nE3,	$06,	nRst,	nEb3,	nRst,	nE3
	dc.b		nEb2,	nRst,	nEb2,	nEb3,	nRst,	nCs3,	nRst,	nEb3
	dc.b		$0C
	smpsLoop	$01,	$04,	music8E_Loop0B
	dc.b		nRst,	$30,	nRst
	smpsPan		panCentre,	$00
music8E_Loop0C:
	smpsCall	music8E_Call0A
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$03,	music8E_Loop0C
	smpsPan		panRight,	$00
	dc.b		nRst,	$30,	nRst
	smpsFMvoice	$05
	smpsAlterVol	$F8
music8E_Loop0D:
	dc.b		nA4,	$04,	nRst,	$08,	nAb4,	$04,	nRst,	$08
	dc.b		nA4,	$0C,	nAb4,	$06,	nA4,	$04,	nRst,	$08
	dc.b		nA4,	$06,	nAb4,	$04,	nRst,	$08,	nA4,	$0C
	dc.b		nAb4,	$04,	nRst,	$08
	smpsLoop	$00,	$04,	music8E_Loop0D
	smpsAlterVol	$08
	smpsJump	music8E_Jump02

; FM2 Data
music8E_FM2:
	smpsFMvoice	$04
music8E_Loop0E:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$03,	music8E_Loop0E
	dc.b		nFs2,	$06,	nEb2,	$24,	nRst,	$06,	nE2,	$04
	dc.b		nRst,	$08,	nE2,	$0C,	nF2,	$04,	nRst,	$08
	dc.b		nF2,	$0C,	nFs2,	$04,	nRst,	$08,	nFs2,	$0C
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	$06,	nFs3,	nFs2,	$0C
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	$06,	nEb2,	$12,	nE2
	dc.b		$0C,	nF2,	nFs2,	$04,	nRst,	$08,	nFs2,	$0C
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	$06,	nFs3,	nFs2,	$0C
	dc.b		nE2,	$04,	nRst,	$08,	nE2,	$0C,	nE2,	$04
	dc.b		nRst,	$08,	nE2,	$0C,	nEb2,	$04,	nRst,	$08
	dc.b		nEb2,	$0C,	nEb2,	$04,	nRst,	$08,	nEb2,	$0C
music8E_Loop0F:
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	nFs2,	$04,	nRst,	$08
	dc.b		nFs2,	$0C,	$06,	nFs3,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	nFs2,	$04,	nRst,	$08
	dc.b		nFs2,	$0C,	$06,	nEb2,	$12,	nE2,	$0C,	nF2
	dc.b		nFs2,	$04,	nRst,	$08,	nFs2,	$0C,	nFs2,	$04
	dc.b		nRst,	$08,	nFs2,	$0C,	nFs2,	$04,	nRst,	$08
	dc.b		nFs2,	$0C,	$06,	nFs3,	nFs2,	$0C,	nE2,	$04
	dc.b		nRst,	$08,	nE2,	$0C,	nE2,	$04,	nRst,	$08
	dc.b		nE2,	$0C,	nEb2,	$04,	nRst,	$08,	nEb2,	$0C
	dc.b		nEb2,	$04,	nRst,	$08,	nEb2,	$0C
	smpsLoop	$00,	$04,	music8E_Loop0F
	dc.b		nE2,	$18,	nF2,	nFs2,	$0C,	nRst,	$24,	nRst
	dc.b		$30,	nRst,	$24,	nE3,	$06,	nFs3,	nE2,	$18
	dc.b		nF2,	nFs2,	$0C,	nRst,	$24,	nRst,	$30,	nRst
	dc.b		$18,	nE3,	$06,	nE4,	nEb3,	nEb4,	nE2,	$18
	dc.b		nF2,	nFs2,	$0C,	nRst,	$24,	nRst,	$30,	nRst
	dc.b		$18,	nE3,	$06,	nRst,	nE3,	nFs3,	nE2,	$18
	dc.b		nF2,	nFs2,	$0C,	nRst,	$24,	nFs2,	$0C,	nEb2
	dc.b		$24,	nE2,	$18,	nF2,	nFs2,	$30,	smpsNoAttack,	$30
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nA2,	$06
	dc.b		nA3,	nA2,	nA3,	nAb2,	nAb3,	nG2,	nG3
	smpsJump	music8E_Loop0F

; DAC Data
music8E_DAC:
	smpsCall	music8E_Call0B
	smpsLoop	$00,	$02,	music8E_DAC
music8E_Loop10:
	smpsCall	music8E_Call0B
	smpsLoop	$00,	$03,	music8E_Loop10
	smpsCall	music8E_Call0C
music8E_Loop11:
	smpsCall	music8E_Call0B
	smpsLoop	$00,	$02,	music8E_Loop11
	smpsCall	music8E_Call0C
	smpsJump	music8E_Loop10

; PSG3 Data
music8E_PSG3:
	smpsPSGform	$E7
music8E_Jump03:
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	$0C,	$06,	nA5
	dc.b		nA5,	$0C,	$06,	nA5,	nA5,	nA5,	nA5,	nA5
	smpsJump	music8E_Jump03

music8E_Voices:
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
