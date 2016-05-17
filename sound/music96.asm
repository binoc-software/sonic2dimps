; =============================================================================================
; Project Name:		music96
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music96_Header:
	smpsHeaderVoice	music96_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$10

	smpsHeaderDAC	music96_DAC
	smpsHeaderFM	music96_FM1,	smpsPitch01lo,	$13
	smpsHeaderFM	music96_FM2,	smpsPitch01lo,	$0A
	smpsHeaderFM	music96_FM3,	smpsPitch01lo,	$13
	smpsHeaderFM	music96_FM4,	smpsPitch01lo,	$13
	smpsHeaderFM	music96_FM5,	smpsPitch01lo,	$13
	smpsHeaderPSG	music96_PSG1,	smpsPitch04lo,	$01,	$09
	smpsHeaderPSG	music96_PSG2,	smpsPitch04lo,	$03,	$00
	smpsHeaderPSG	music96_PSG3,	smpsPitch00,	$03,	$04

; FM1 Data
music96_FM1:
	dc.b		nRst,	$60,	nRst
	smpsFMvoice	$00
music96_Loop01:
	smpsCall	music96_Call01
	smpsLoop	$00,	$02,	music96_Loop01
music96_Loop02:
	smpsCall	music96_Call02
	dc.b		nRst,	nF6,	nRst,	nE6,	nRst,	nF6,	nG6,	$12
	smpsCall	music96_Call02
	dc.b		nRst,	nF6,	$0C,	nRst,	$24
	smpsLoop	$00,	$02,	music96_Loop02
	smpsCall	music96_Call03
	smpsJump	music96_FM1

music96_Call01:
	dc.b		nRst,	$0C,	nB5,	$16,	nRst,	$02,	nB5,	$06
	dc.b		nRst,	nC6,	$12,	nD6,	nE6,	$0C,	nD6,	$06
	dc.b		nRst,	nD6,	nRst,	nD6,	nRst,	nB5,	nRst,	nC6
	dc.b		$12,	nA5,	$18,	nRst,	$06
	smpsReturn

music96_Call02:
	dc.b		nRst,	$09,	nB6,	$0F,	nG6,	$06,	nRst,	nD6
	smpsReturn

music96_Call03:
	dc.b		nC6,	$24,	nA5,	$06,	nC6,	nE6,	$24,	nC6
	dc.b		$06,	nE6,	nG6,	$3C,	nRst,	$24
	smpsReturn

; FM3 Data
music96_FM3:
	smpsFMvoice	$00
	dc.b		nB5,	$12,	nC6,	nCs6,	$0C,	nC6,	$12,	nCs6
	dc.b		nD6,	$0C,	nCs6,	$12,	nD6,	nEb6,	$0C,	nD6
	dc.b		$12,	nEb6,	nE6,	$0C
	smpsFMvoice	$02
	smpsAlterNote	$03
music96_Loop03:
	smpsCall	music96_Call01
	smpsLoop	$00,	$02,	music96_Loop03
music96_Loop04:
	smpsFMvoice	$00
	smpsAlterNote	$00
	dc.b		nB5,	$0C,	nRst,	nB5,	nRst,	nA5,	nRst,	nA5
	dc.b		nRst,	nB5,	$06,	nRst,	nB5,	nRst,	nA5,	$0C
	dc.b		nB5,	$06,	nRst,	$36
	smpsAlterPitch	$03
	smpsLoop	$00,	$02,	music96_Loop04
	smpsAlterPitch	$FA
	dc.b		nC6,	$18,	nRst,	nE6,	nRst,	nG6,	nG6,	nG6
	dc.b		nG6
	smpsJump	music96_FM3

; FM4 Data
music96_FM4:
	smpsFMvoice	$00
music96_Jump01:
	dc.b		nG5,	$12,	nAb5,	nA5,	$0C,	nAb5,	$12,	nA5
	dc.b		nBb5,	$0C,	nA5,	$12,	nBb5,	nB5,	$0C,	nBb5
	dc.b		$12,	nB5,	nC6,	$0C
	smpsFMvoice	$03
music96_Loop05:
	smpsCall	music96_Call04
	dc.b		nC6,	nRst,	nC6,	nRst,	nC6,	nRst,	nC6,	nRst
	smpsCall	music96_Call04
	dc.b		nA5,	nRst,	nA5,	nRst,	nA5,	nRst,	nA5,	nRst
	smpsLoop	$00,	$02,	music96_Loop05
	smpsFMvoice	$00
music96_Loop06:
	dc.b		nG5,	$0C,	nRst,	nG5,	nRst,	nF5,	nRst,	nF5
	dc.b		nRst,	nG5,	$06,	nRst,	nG5,	nRst,	nF5,	$0C
	dc.b		nG5,	$06,	nRst,	$36
	smpsAlterPitch	$04
	smpsLoop	$00,	$02,	music96_Loop06
	smpsAlterPitch	$F8
	dc.b		nA5,	$18,	nRst,	nC6,	nRst,	nE6,	nE6,	nE6
	dc.b		nE6
	smpsJump	music96_Jump01

music96_Call04:
	dc.b		nB5,	$06,	nRst,	nB5,	nRst,	nB5,	nRst,	nB5
	dc.b		nRst
	smpsReturn

; FM2 Data
music96_FM2:
	smpsFMvoice	$01
music96_Jump02:
	dc.b		nCs3,	$12,	nD3,	nEb3,	$0C,	nD3,	$12,	nEb3
	dc.b		nE3,	$0C,	nEb3,	$12,	nE3,	nF3,	$0C,	nE3
	dc.b		$12,	nF3,	nFs3,	$0C
	smpsFMvoice	$04
music96_Loop07:
	smpsCall	music96_Call05
	dc.b		nRst,	$06,	nE3,	$0C
	smpsCall	music96_Call05
	dc.b		nF3,	$06,	nE3,	$0C
	smpsLoop	$00,	$02,	music96_Loop07
	smpsFMvoice	$01
music96_Loop08:
	dc.b		nRst,	$60,	nRst,	$3C,	nBb3,	$06,	nB3,	nG3
	dc.b		$0C,	nFs3
	smpsLoop	$00,	$02,	music96_Loop08
	dc.b		nF4,	$18,	nF3,	nF4,	nF3,	nF4,	$0C,	nF3
	dc.b		nF4,	nF3,	nF4,	nF3,	nF4,	nF3
	smpsJump	music96_Jump02

music96_Call05:
	dc.b		nG3,	$06,	nRst,	nG3,	$0C,	nD3,	$06,	nRst
	dc.b		nD3,	$0C,	nF3,	$06,	nRst,	nF3,	$0C,	nE3
	dc.b		$06
	smpsReturn

; FM5 Data
music96_FM5:
	smpsFMvoice	$03
	smpsPan		panRight,	$00
	dc.b		nRst,	$60,	nRst
music96_Loop09:
	smpsCall	music96_Call06
	dc.b		nE6,	nRst,	nE6,	nRst,	nE6,	nRst,	nE6,	nRst
	smpsCall	music96_Call06
	dc.b		nC6,	nRst,	nC6,	nRst,	nC6,	nRst,	nC6,	nRst
	smpsLoop	$00,	$02,	music96_Loop09
music96_Loop0A:
	smpsFMvoice	$02
	smpsAlterNote	$03
	smpsPan		panLeft,	$00
	smpsCall	music96_Call02
	dc.b		nRst,	$06,	nF6,	nRst,	nE6,	nRst,	nF6,	nG6
	dc.b		$12
	smpsCall	music96_Call02
	dc.b		nRst,	$06,	nF6,	$0C
	smpsFMvoice	$03
	smpsAlterNote	$00
	smpsPan		panCentre,	$00
	dc.b		nCs4,	$06,	nD4,	nB3,	$0C,	nG3
	smpsLoop	$00,	$02,	music96_Loop0A
	smpsFMvoice	$02
	smpsAlterNote	$02
	smpsCall	music96_Call03
	smpsAlterNote	$00
	smpsJump	music96_FM5

music96_Call06:
	dc.b		nD6,	$06,	nRst,	nD6,	nRst,	nD6,	nRst,	nD6
	dc.b		nRst
	smpsReturn

; PSG1 Data
music96_PSG1:
	dc.b		nRst,	$60
	smpsLoop	$00,	$0A,	music96_PSG1
	dc.b		nRst,	$18
	smpsCall	music96_Call07
	dc.b		nD6,	nRst,	$15,	nC7,	$03,	nB6,	nBb6,	nA6
	dc.b		nAb6,	nG6,	nFs6,	nF6
	smpsCall	music96_Call07
	dc.b		nCs6,	nC7,	nB6,	nA6,	nAb6,	nG6,	nFs6,	nF6
	dc.b		nE7,	nEb7,	nD7,	nCs7,	nC7,	nB6,	nBb6,	nA6
	dc.b		nG6,	nFs6,	nF6,	nE6,	nEb6,	nD6,	nCs6,	nB5
	smpsJump	music96_PSG1

music96_Call07:
	dc.b		nA6,	$03,	nAb6,	nG6,	nFs6,	nF6,	nE6,	nEb6
	dc.b		nD6
	smpsReturn

; PSG2 Data
music96_PSG2:
	smpsStop

; PSG3 Data
music96_PSG3:
	smpsStop

; DAC Data
music96_DAC:
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$12,	dSnare,	$0C
	smpsLoop	$00,	$03,	music96_DAC
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$0C,	dSnare,	$06
	dc.b		$0C
music96_Loop0B:
	dc.b		dKick,	$0C,	dSnare
	smpsLoop	$00,	$07,	music96_Loop0B
	dc.b		dKick,	$06,	dSnare,	dSnare,	$0C
	smpsLoop	$01,	$05,	music96_Loop0B
	smpsJump	music96_DAC

music96_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b		$08,$0A,$70,$30,$00,$1F,$1F,$5F,$5F,$12,$0E,$0A,$0A,$00,$04,$04
	dc.b		$03,$2F,$2F,$2F,$2F,$22,$2E,$13,$80;			Voice 01
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b		$2C,$71,$72,$33,$33,$1F,$1F,$1F,$1F,$00,$00,$00,$00,$00,$00,$00
	dc.b		$00,$0F,$0F,$0F,$0F,$1E,$80,$23,$82;			Voice 03
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	even
