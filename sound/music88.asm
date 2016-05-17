; =============================================================================================
; Project Name:		music88
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music88_Header:
	smpsHeaderVoice	music88_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$05

	smpsHeaderDAC	music88_DAC
	smpsHeaderFM	music88_FM1,	smpsPitch01lo,	$06
	smpsHeaderFM	music88_FM2,	smpsPitch01lo,	$0D
	smpsHeaderFM	music88_FM3,	smpsPitch01lo,	$10
	smpsHeaderFM	music88_FM4,	smpsPitch02lo,	$0E
	smpsHeaderFM	music88_FM5,	smpsPitch01lo,	$10
	smpsHeaderPSG	music88_PSG1,	smpsPitch04lo,	$04,	$00
	smpsHeaderPSG	music88_PSG2,	smpsPitch04lo,	$04,	$00
	smpsHeaderPSG	music88_PSG3,	smpsPitch05lo,	$05,	$00

; FM1 Data
music88_FM1:
	smpsFMvoice	$00
	dc.b		nA3,	$06,	nRst,	nA3,	nRst,	nB3,	nRst,	nB3
	dc.b		nRst,	nC4,	nRst,	nC4,	nRst,	nCs4,	nRst,	nCs4
	dc.b		nRst
music88_Loop01:
	dc.b		nD3,	$09,	nA3,	$03,	nD4,	$06,	nRst,	nC4
	dc.b		nRst,	nB3,	$0C,	nC4,	$06,	nRst,	$2A,	nG3
	dc.b		$06,	nRst,	nG3,	nRst,	nA3,	nRst,	nA3,	nRst
	dc.b		nBb3,	nRst,	$2A
	smpsLoop	$00,	$02,	music88_Loop01
	smpsCall	music88_Call01
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nC4,	nRst,	nD4
	dc.b		$0C,	nD3,	$03,	nRst,	$06,	nD3,	$03,	nD4
	dc.b		$0C,	nC4,	nD4,	nG3,	$06,	nRst,	nG3,	$0C
	dc.b		nA3,	$06,	nRst,	nA3,	$0C,	nBb3,	$06,	nRst
	dc.b		$2A
	smpsCall	music88_Call01
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nC4,	nRst,	nD4
	dc.b		$0C,	nD3,	$03,	nRst,	$06,	nD3,	$03,	nD4
	dc.b		$0C,	nC4,	nD4,	$09,	nA4,	$03,	nG3,	$06
	dc.b		nRst,	nG3,	$0C,	nA3,	$06,	nRst,	nA3,	$0C
	dc.b		nBb3,	$06,	nRst,	$2A
	smpsAlterVol	$FE
music88_Loop02:
	dc.b		nC4,	$06,	nRst,	nC4,	nRst,	nB3,	nRst,	nBb3
	dc.b		nRst,	nA3,	nRst,	nA3,	nRst,	nE4,	nRst,	nA3
	dc.b		nRst,	nD4,	nRst,	nA3,	nRst,	nC4,	nRst,	nCs4
	dc.b		nRst,	nD4,	$09,	nD4,	$03,	nA3,	$06,	nRst
	dc.b		nC4,	nRst,	nD4,	nRst
	smpsLoop	$00,	$03,	music88_Loop02
	dc.b		nC4,	$06,	nRst,	nC4,	nRst,	nB3,	nRst,	nBb3
	dc.b		nRst,	nA3,	nRst,	nA3,	nRst,	nE4,	nRst,	nA3
	dc.b		nRst,	nRst,	$09,	nD3,	$03,	nD4,	$0C,	nD3
	dc.b		nD4,	$06,	nRst,	$03,	nD3,	$06,	nRst,	$2D
	smpsAlterVol	$02
	smpsJump	music88_Loop01

music88_Call01:
	dc.b		nD3,	$0C,	nD4,	$06,	nRst,	nC4,	nRst,	nD4
	dc.b		$0C,	nD3,	$03,	nRst,	$06,	nD3,	$03,	nD4
	dc.b		$0C,	nC4,	nD4,	$09,	nA3,	$03,	nG3,	$06
	dc.b		nRst,	nG3,	$0C,	nA3,	$06,	nRst,	nA3,	$0C
	dc.b		nBb3,	$06,	nRst,	$27,	nC4,	$03
	smpsReturn

; FM2 Data
music88_FM2:
	smpsFMvoice	$01
	smpsCall	music88_Call02
music88_Loop03:
	smpsCall	music88_Call03
	smpsLoop	$00,	$02,	music88_Loop03
	smpsFMvoice	$01
	smpsAlterNote	$02
	smpsAlterVol	$07
music88_Loop04:
	smpsCall	music88_Call04
	smpsLoop	$00,	$02,	music88_Loop04
music88_Loop05:
	smpsCall	music88_Call05
	smpsLoop	$00,	$02,	music88_Loop05
	smpsFMvoice	$01
	smpsAlterNote	$00
	smpsAlterVol	$F9
	smpsCall	music88_Call06
	smpsCall	music88_Call07
	smpsJump	music88_Loop03

music88_Call06:
	dc.b		nRst,	$09,	nG6,	$0F,	nE6,	$06,	nRst,	nC6
	dc.b		nRst,	nF6,	$18,	nE6,	nD6,	$06,	nRst,	nD6
	dc.b		nRst,	nC6,	$09,	nD6,	$06,	nRst,	nA5,	$33
	dc.b		nRst,	$09,	nG6,	$0F,	nE6,	$06,	nRst,	nC6
	dc.b		nRst,	nF6,	$18,	nE6,	nRst,	$0C,	nD6,	$06
	dc.b		nRst,	nE6,	$09,	nD6,	$06,	nRst,	nF6,	$33
	smpsReturn

music88_Call07:
	dc.b		nRst,	$09,	nG6,	$0F,	nE6,	$06,	nRst,	nC6
	dc.b		nRst,	nF6,	$18,	nE6,	nD6,	$06,	nRst,	nD6
	dc.b		nRst,	nC6,	$09,	nD6,	$06,	nRst,	nA5,	$33
	dc.b		nRst,	$09,	nG6,	$0F,	nE6,	$06,	nRst,	nC6
	dc.b		nRst,	nF6,	$18,	nE6,	nRst,	$09,	nD6,	$0F
	dc.b		nF6,	$06,	nRst,	nE6,	nRst,	$03,	nD6,	$06
	dc.b		nRst,	$2D
	smpsReturn

music88_Call02:
	dc.b		nA6,	$06,	nRst,	$12,	nA6,	$15,	nE6,	$03
	dc.b		nA6,	$06,	nRst,	nG6,	nRst,	nF6,	nRst,	nE6
	dc.b		nRst
	smpsReturn

music88_Call03:
	dc.b		nC6,	$09,	nD6,	$06,	nRst,	nD6,	nRst,	nD6
	dc.b		$03,	nC6,	$0C,	nF6,	$06,	nRst,	nD6,	$24
	dc.b		nRst,	$60
	smpsReturn

; FM3 Data
music88_FM3:
	smpsFMvoice	$01
	dc.b		nRst,	$60
music88_Loop06:
	dc.b		nRst,	$60,	$3C,	nF6,	$09,	nE6,	$03,	nF6
	dc.b		$09,	nE6,	$03,	nF6,	$06,	nRst
	smpsLoop	$00,	$02,	music88_Loop06
	smpsAlterVol	$04
	smpsPan		panRight,	$00
music88_Loop07:
	dc.b		nRst,	$60,	$30,	nA5,	$06,	nRst,	nF5,	$0C
	dc.b		nG5,	$09,	nF5,	$03,	nD5,	$0C,	nRst,	$60
	dc.b		$30,	nA5,	$06,	nRst,	nF5,	$0C,	nG5,	$09
	dc.b		nA5,	$03,	nRst,	$0C
	smpsLoop	$00,	$02,	music88_Loop07
	smpsAlterVol	$FC
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	smpsAlterNote	$02
	smpsAlterPitch	$F4
	smpsAlterVol	$FF
	smpsCall	music88_Call06
	smpsCall	music88_Call07
	smpsFMvoice	$01
	smpsAlterNote	$00
	smpsAlterPitch	$0C
	smpsAlterVol	$01
	smpsJump	music88_Loop06

; FM4 Data
music88_FM4:
	smpsFMvoice	$01
	smpsAlterNote	$02
	smpsCall	music88_Call02
music88_Loop08:
	smpsCall	music88_Call03
	smpsLoop	$00,	$02,	music88_Loop08
	smpsFMvoice	$01
	smpsAlterNote	$00
	smpsAlterPitch	$0C
	smpsAlterVol	$04
	smpsModSet	$01,	$01,	$03,	$03
music88_Loop09:
	smpsCall	music88_Call04
	smpsLoop	$00,	$02,	music88_Loop09
music88_Loop0A:
	smpsCall	music88_Call05
	smpsLoop	$00,	$02,	music88_Loop0A
	smpsFMvoice	$01
	smpsCall	music88_Call08
	dc.b		nEb5,	$03,	smpsNoAttack,	nE5,	$2D,	nEb5,	$03,	smpsNoAttack
	dc.b		nE5,	$2D
	smpsPan		panLeft,	$00
	dc.b		nRst,	$0C,	nF5,	$06,	nRst,	nG5,	$09,	nF5
	dc.b		$06,	nRst,	nA5,	$2D,	nRst,	$06
	smpsCall	music88_Call08
	dc.b		nEb5,	$03,	smpsNoAttack,	nE5,	$2D,	nEb5,	$03,	smpsNoAttack
	dc.b		nE5,	$2D
	smpsPan		panLeft,	$00
	dc.b		nRst,	$09,	nF5,	nRst,	$06,	nF5,	$09,	nRst
	dc.b		$0C,	nF5,	$06,	nRst,	$2D
	smpsAlterNote	$02
	smpsAlterPitch	$F4
	smpsAlterVol	$FC
	smpsPan		panCentre,	$00
	dc.b		smpsModOff
	smpsJump	music88_Loop08

music88_Call08:
	smpsPan		panCentre,	$00
	dc.b		nEb5,	$03,	smpsNoAttack,	nE5,	$2D,	nEb5,	$03,	smpsNoAttack
	dc.b		nE5,	$2D
	smpsPan		panLeft,	$00
	dc.b		nF5,	$06,	nRst,	nF5,	nRst,	nE5,	$09,	nF5
	dc.b		$06,	nRst,	nF5,	$0C,	nE5,	$03,	nF5,	$06
	dc.b		nRst,	nE5,	$09,	nF5,	$06,	nRst,	$09
	smpsPan		panCentre,	$00
	smpsReturn

music88_Call04:
	dc.b		nF6,	$15,	nE6,	$03,	nD6,	$06,	nRst,	nC6
	dc.b		$0C,	nE6,	$06,	nRst,	nC6,	$0C,	nD6,	$06
	dc.b		nRst,	$12,	nRst,	$60
	smpsReturn

music88_Call05:
	dc.b		nA6,	$15,	nG6,	$03,	nF6,	$06,	nRst,	nE6
	dc.b		$0C,	nG6,	$06,	nRst,	nE6,	$0C,	nF6,	$06
	dc.b		nRst,	$12,	nRst,	$60
	smpsReturn

; FM5 Data
music88_FM5:
	smpsFMvoice	$01
	dc.b		nRst,	$60
	smpsPan		panRight,	$00
music88_Loop0B:
	dc.b		nRst,	$60,	nRst,	$3C,	nD6,	$09,	nC6,	$03
	dc.b		nD6,	$09,	nC6,	$03,	nD6,	$06,	nRst
	smpsLoop	$00,	$02,	music88_Loop0B
	smpsFMvoice	$01
	smpsPan		panCentre,	$00
	dc.b		nRst,	$60
	smpsCall	music88_Call09
	dc.b		nRst,	$60
	smpsCall	music88_Call0A
	smpsFMvoice	$01
	smpsAlterVol	$02
	smpsPan		panLeft,	$00
	smpsModSet	$01,	$01,	$03,	$03
	smpsCall	music88_Call0B
	smpsFMvoice	$01
	smpsAlterVol	$FC
	smpsPan		panCentre,	$00
	smpsCall	music88_Call09
	smpsFMvoice	$1
	smpsPan		panLeft,	$00
	smpsAlterVol	$04
	smpsCall	music88_Call0B
	smpsFMvoice	$01
	smpsAlterVol	$FC
	smpsPan		panCentre,	$00
	smpsCall	music88_Call0A
	smpsAlterVol	$04
	smpsFMvoice	$01
	smpsCall	music88_Call0C
	dc.b		nB4,	$03,	smpsNoAttack,	nC5,	$2D,	nC5,	$03,	smpsNoAttack
	dc.b		nCs5,	$2D
	smpsPan		panRight,	$00
	dc.b		nRst,	$0C,	nD5,	$06,	nRst,	nE5,	$09,	nD5
	dc.b		$03,	nRst,	$09,	nF5,	$2D,	nRst,	$06
	smpsCall	music88_Call0C
	dc.b		nB4,	$03,	smpsNoAttack,	nC5,	$2D,	nC5,	$03,	smpsNoAttack
	dc.b		nCs5,	$2D
	smpsPan		panRight,	$00
	dc.b		nRst,	$09,	nD5,	nRst,	$06,	nD5,	$09,	nRst
	dc.b		$0C,	nD5,	$06,	nRst,	$2D
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsAlterVol	$FE
	dc.b		smpsModOff
	smpsJump	music88_Loop0B

music88_Call0C:
	smpsPan		panCentre,	$00
	dc.b		nB4,	$03,	smpsNoAttack,	nC5,	$2D,	nC5,	$03,	smpsNoAttack
	dc.b		nCs5,	$2D
	smpsPan		panRight,	$00
	dc.b		nD5,	$06,	nRst,	nD5,	nRst,	nC5,	$09,	nD5
	dc.b		$06,	nRst,	nD5,	$0C,	nC5,	$03,	nD5,	$06
	dc.b		nRst,	nC5,	$09,	nD5,	$06,	nRst,	$09
	smpsPan		panCentre,	$00
	smpsReturn

music88_Call09:
	dc.b		nG3,	$06,	nRst,	nG3,	$0C,	nA3,	$06,	nRst
	dc.b		nA3,	$0C,	nBb3,	$06,	nRst,	$27,	nC4,	$03
	smpsReturn

music88_Call0B:
	dc.b		nF6,	$15,	nE6,	$03,	nD6,	$06,	nRst,	nC6
	dc.b		$0C,	nE6,	$06,	nRst,	nC6,	$0C,	nD6,	$06
	dc.b		nRst,	$12
	smpsReturn

music88_Call0A:
	dc.b		nG3,	$06,	nRst,	nG3,	$0C,	nA3,	$06,	nRst
	dc.b		nA3,	$0C,	nBb3,	$06,	nRst,	$2A
	smpsReturn

; PSG1 Data
music88_PSG1:
	dc.b		nRst,	$60
	smpsNoteFill	$06
music88_Loop0C:
	dc.b		nRst,	$0C,	nF5,	nRst,	nF5,	nRst,	nF5,	nRst
	dc.b		nF5,	nRst,	nD5,	nRst,	nD5,	nRst,	nD5,	nRst
	dc.b		nD5
	smpsLoop	$00,	$02,	music88_Loop0C
	dc.b		nRst,	$60,	nRst,	$0C,	nF5,	nRst,	nF5,	nRst
	dc.b		nF5,	nRst,	nF5,	nRst,	$60,	nRst,	$0C,	nF5
	dc.b		nRst,	nF5,	nRst,	nF5,	$04,	nRst,	nF5,	nRst
	dc.b		$0C,	nF5
music88_Loop0D:
	dc.b		nRst,	$60,	nRst,	$0C,	nF5,	nRst,	nF5,	nRst
	dc.b		nF5,	nRst,	nF5
	smpsLoop	$00,	$02,	music88_Loop0D
music88_Loop0E:
	dc.b		nRst,	$0C,	nC6,	nRst,	nC6,	nRst,	nCs6,	nRst
	dc.b		nCs6,	nRst,	nD6,	nRst,	nD6,	nRst,	nD6,	nRst
	dc.b		nD6
	smpsLoop	$00,	$03,	music88_Loop0E
	dc.b		nRst,	$0C,	nC6,	nRst,	nC6,	nRst,	nCs6,	nRst
	dc.b		nCs6,	nRst,	$60
	smpsJump	music88_Loop0C

; PSG2 Data
music88_PSG2:
	dc.b		nRst,	$60
	smpsNoteFill	$06
music88_Loop0F:
	dc.b		nRst,	$0C,	nD5,	nRst,	nD5,	nRst,	nD5,	nRst
	dc.b		nD5,	nRst,	nBb4,	nRst,	nBb4,	nRst,	nBb4,	nRst
	dc.b		nBb4
	smpsLoop	$00,	$02,	music88_Loop0F
	dc.b		nRst,	$60,	nRst,	$0C,	nD5,	nRst,	nD5,	nRst
	dc.b		nD5,	nRst,	nD5,	nRst,	$60,	nRst,	$0C,	nD5
	dc.b		nRst,	nD5,	nRst,	nD5,	$04,	nRst,	nD5,	nRst
	dc.b		$0C,	nD5
music88_Loop10:
	dc.b		nRst,	$60,	nRst,	$0C,	nD5,	nRst,	nD5,	nRst
	dc.b		nD5,	nRst,	nD5
	smpsLoop	$00,	$02,	music88_Loop10
music88_Loop11:
	dc.b		nRst,	$0C,	nA5,	nRst,	nA5,	nRst,	nA5,	nRst
	dc.b		nA5,	nRst,	nA5,	nRst,	nA5,	nRst,	nA5,	nRst
	dc.b		nA5
	smpsLoop	$00,	$03,	music88_Loop11
	dc.b		nRst,	$0C,	nA5,	nRst,	nA5,	nRst,	nA5,	nRst
	dc.b		nA5,	nRst,	$60
	smpsJump	music88_Loop0F

; PSG3 Data
music88_PSG3:
	smpsJump	music88_PSG1

; DAC Data
music88_DAC:
	dc.b		nRst,	$0C,	dSnare,	dKick,	dSnare,	dSnare,	dSnare,	dSnare
	dc.b		dSnare
music88_Loop12:
	smpsCall	music88_Call0D
	smpsLoop	$00,	$03,	music88_Loop12
	dc.b		dKick,	$09,	dKick,	$03,	$0C,	dSnare,	dKick,	dKick
	dc.b		$15,	dSnare,	$03,	$18
music88_Loop13:
	smpsCall	music88_Call0D
	smpsLoop	$00,	$0F,	music88_Loop13
	dc.b		nRst,	$09,	dKick,	$0F,	dSnare,	$0C,	dKick,	$09
	dc.b		dSnare,	$1B,	$0C,	$09,	$03
	smpsJump	music88_Loop12

music88_Call0D:
	dc.b		dKick,	$09,	dKick,	$03,	$0C,	dSnare,	dKick,	dKick
	dc.b		$18,	dSnare
	smpsReturn

music88_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80

	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
