; =============================================================================================
; Project Name:		music95
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music95_Header:
	smpsHeaderVoice	music95_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$03,	$07

	smpsHeaderDAC	music95_DAC
	smpsHeaderFM	music95_FM1,	smpsPitch02lo,	$10
	smpsHeaderFM	music95_FM2,	smpsPitch01lo,	$0B
	smpsHeaderFM	music95_FM3,	smpsPitch01lo,	$08
	smpsHeaderFM	music95_FM4,	smpsPitch01lo,	$0F
	smpsHeaderFM	music95_FM5,	smpsPitch01lo,	$0F
	smpsHeaderPSG	music95_PSG1,	smpsPitch04lo,	$06,	$00
	smpsHeaderPSG	music95_PSG2,	smpsPitch04lo,	$05,	$00
	smpsHeaderPSG	music95_PSG3,	smpsPitch03lo,	$05,	$00

; FM1 Data
music95_FM1:
	smpsFMvoice	$03
	smpsModSet	$02,	$01,	$04,	$02
	smpsCall	music95_Call01
	smpsAlterVol	$FC
	smpsCall	music95_Call02
	smpsAlterVol	$04
	smpsCall	music95_Call03
	smpsAlterVol	$10
	dc.b		nG5,	$03
	smpsAlterVol	$FF
	dc.b		nA5
	smpsAlterVol	$FF
	dc.b		nB5
	smpsAlterVol	$FF
	dc.b		nC6
	smpsAlterVol	$FF
	dc.b		nB5
	smpsAlterVol	$FE
	dc.b		nC6
	smpsAlterVol	$FE
	dc.b		nD6
	smpsAlterVol	$FE
	dc.b		nE6
	smpsAlterVol	$FE
	dc.b		nD6
	smpsAlterVol	$FE
	dc.b		nE6
	smpsAlterVol	$FE
	dc.b		nF6
	smpsAlterVol	$FE
	dc.b		nG6
	smpsAlterVol	$FE
	dc.b		nF6
	smpsAlterVol	$FE
	dc.b		nG6
	smpsAlterVol	$FE
	dc.b		nA6
	smpsAlterVol	$FE
	dc.b		nB6
	smpsAlterVol	$09
	smpsCall	music95_Call04
	dc.b		nBb6,	$30
	smpsStop

music95_Call02:
	dc.b		nE6,	$12,	nC6,	$06,	nF6,	$12,	nC6,	$1E
	dc.b		nRst,	$18,	nE6,	$12,	nC6,	$06,	nF6,	$12
	dc.b		nC6,	$1E
	smpsReturn

music95_Call01:
	dc.b		nC4,	$1E,	nG4,	$06,	nE4,	nD4,	nC4,	$30
	dc.b		nAb3,	$18,	nBb3,	$0C,	nD4,	nE4,	$30,	nEb4
	dc.b		$18,	nF4,	$0C,	nD4,	nE4,	$12,	nA3,	$1E
	dc.b		nD4,	$12,	nG4,	$1E,	nA4,	$12,	nG4,	$1E
	dc.b		nRst,	$0C,	nB4,	nG4,	$06,	nD4,	nG4,	nAb4
	dc.b		nA4,	$18
	smpsReturn

music95_Call03:
	dc.b		nRst,	$18,	nF6,	$0C,	$06,	nE6,	nF6,	nE6
	dc.b		$0C,	nD6,	nE6,	$06,	nF6,	$0C,	nE6,	$30
	smpsReturn

music95_Call04:
	dc.b		nG6,	$18,	nBb6,	$0C,	nEb6,	nAb6,	$15,	nRst
	dc.b		$03,	nC7,	$06,	nBb6,	nG6,	$03,	nAb6,	$09
	dc.b		nG6,	$18,	nBb6,	$0C,	nEb6,	nAb6,	$15,	nC7
	dc.b		$03,	$06,	nBb6,	nG6,	$03,	nAb6,	$09,	nC7
	dc.b		$15,	$03,	nB6,	$06,	$06,	$03,	$06,	nBb6
	dc.b		$1B,	nA6,	$06,	$06,	$03,	$09,	nC7,	$06
	dc.b		nBb6,	nG6,	nAb6,	$18,	nG6,	$03,	$03,	nC7
	dc.b		$06,	nBb6,	nG6,	nAb6,	$12,	nBb6,	$0C,	nCs7
	dc.b		$03,	nC7,	nBb6,	nAb6,	nCs7,	nC7,	nBb6,	nAb6
	dc.b		nCs7,	nC7,	nBb6,	nAb6,	nCs7,	nC7,	nBb6,	nAb6
	smpsReturn

; FM2 Data
music95_FM2:
	smpsFMvoice	$01
	smpsModSet	$01,	$01,	$02,	$02
	dc.b		nRst,	$06,	nE5,	$03,	nF5,	nE5,	$24
	smpsCall	music95_Call05
	smpsAlterVol	$02
	dc.b		nRst,	$30
music95_Loop01:
	dc.b		nRst,	$18,	nG5,	$02,	nRst,	$01,	nC5,	$02
	dc.b		nRst,	$01,	nE5,	$02,	nRst,	$01,	nC5,	$02
	dc.b		nRst,	$01,	nG5,	$02,	nRst,	$01,	nC5,	$02
	dc.b		nRst,	$01,	nE5,	$02,	nRst,	$01,	nC5,	$02
	dc.b		nRst,	$01,	nRst,	$18,	nA5,	$02,	nRst,	$01
	dc.b		nD5,	$02,	nRst,	$01,	nF5,	$02,	nRst,	$01
	dc.b		nD5,	$02,	nRst,	$01,	nA5,	$02,	nRst,	$01
	dc.b		nD5,	$02,	nRst,	$01,	nF5,	$02,	nRst,	$01
	dc.b		nD5,	$02,	nRst,	$01
	smpsLoop	$00,	$02,	music95_Loop01
	smpsAlterVol	$FE
	smpsCall	music95_Call06
	dc.b		nRst,	$06
	smpsAlterVol	$0A
music95_Loop02:
	dc.b		nC6,	$06
	smpsAlterVol	$FE
	smpsLoop	$00,	$07,	music95_Loop02
	smpsAlterVol	$03
	smpsCall	music95_Call07
	dc.b		nEb6,	$30,	smpsNoAttack,	$30
	smpsStop

music95_Call05:
	dc.b		nRst,	$06,	nC6,	$02,	nRst,	$01,	nC6,	$02
	dc.b		nRst,	$01,	nC6,	$06,	nD6,	$03,	nF6,	$09
	dc.b		nE6,	$06,	nD6,	nC6,	nEb6,	nF6,	$03,	nC6
	dc.b		$24,	nRst,	$03
	smpsLoop	$01,	$02,	music95_Call05
	dc.b		nRst,	$18,	nE6,	$06,	nC6,	nE6,	$03,	nC6
	dc.b		$06,	nD6,	$1B,	nE6,	$06,	nC6,	nE6,	$03
	dc.b		nC6,	$06,	nD6,	$33
	smpsReturn

music95_Call07:
	dc.b		nRst,	$06,	nEb6,	$03,	nD6,	$09,	nEb6,	$03
	dc.b		nBb5,	$09,	nEb6,	$03,	nD6,	$09,	nEb6,	$03
	dc.b		nC6,	$15,	nRst,	$03,	nAb6,	$03,	$06,	nG6
	dc.b		nEb6,	$03,	nF6,	$09
	smpsLoop	$01,	$02,	music95_Call07
	dc.b		nG6,	$15,	$03,	nF6,	$06,	nG6,	nEb6,	$03
	dc.b		nF6,	$06,	nG6,	$1B,	nF6,	$06,	nG6,	nEb6
	dc.b		$03,	$06,	$03,	nAb6,	$06,	nG6,	nEb6,	nF6
	dc.b		$18,	nEb6,	$03,	$03,	nAb6,	$06,	nG6,	nEb6
	dc.b		nF6,	$12,	nEb6,	$0C
	smpsReturn

music95_Call06:
	dc.b		nRst,	$06,	nF6,	$03,	nG6,	nA6,	nRst,	nF6
	dc.b		$03,	nG6,	nA6,	$18,	nRst,	$06,	nG6,	$03
	dc.b		nA6,	nB6,	nRst,	nG6,	$03,	nA6,	nB6,	$18
	dc.b		nRst,	$06,	nA6,	$03,	nB6,	nC7,	nRst,	nA6
	dc.b		$03,	nB6,	nC7,	$18
	smpsReturn

; FM3 Data
music95_FM3:
	smpsFMvoice	$00
	dc.b		nRst,	$24,	nG3,	$0C
music95_Loop03:
	dc.b		nC4,	$15,	nG3,	$03,	nC4,	$06,	$0C,	$03
	dc.b		nG3,	nAb3,	$15,	nEb3,	$03,	nBb3,	$06,	$0C
	dc.b		$03,	nB3
	smpsLoop	$00,	$02,	music95_Loop03
	dc.b		nA3,	$15,	nE3,	$03,	nA3,	$06,	$06,	$03
	dc.b		nB3,	nC4,	nCs4,	nD4,	$15,	nA3,	$03,	nD4
	dc.b		$06,	$0C,	$06,	nG3,	$15,	nD3,	$03,	nG3
	dc.b		$06,	$0C,	nD4,	$06,	nG3,	$15,	nD3,	$03
	dc.b		nG3,	nD3,	nG3,	$0C,	$03,	nAb3,	nA3,	$15
	dc.b		nE3,	$03,	nA3,	$06,	$0C,	$03,	nE3,	nBb3
	dc.b		$15,	nF3,	$03,	nBb3,	$06,	$0C,	$03,	nF3
	dc.b		nA3,	$15,	nE3,	$03,	nA3,	$06,	nA3,	nA3
	dc.b		$03,	nE3,	nA3,	nE3,	nBb3,	$15,	nF3,	$03
	dc.b		nBb3,	$06,	$0C,	$03,	$03,	nF3,	$15,	$03
	dc.b		$06,	$0C,	$03,	nFs3,	nG3,	$15,	nD3,	$03
	dc.b		nG3,	$06,	$0C,	$03,	nAb3,	nA3,	$15,	nE3
	dc.b		$03,	nA3,	$06,	$0C,	$03,	$03,	nRst,	$06
	smpsAlterVol	$0A
music95_Loop04:
	dc.b		nG3
	smpsAlterVol	$FE
	smpsLoop	$00,	$07,	music95_Loop04
	smpsAlterVol	$03
music95_Loop05:
	dc.b		nEb4,	$15,	$03,	nD4,	$06,	$0C,	$03,	nBb3
	dc.b		nAb3,	$15,	$03,	nBb3,	$06,	$0C,	nF4,	$03
	dc.b		nBb3
	smpsLoop	$00,	$02,	music95_Loop05
	dc.b		nC4,	$15,	$03,	nB3,	$06,	$12,	nBb3,	$15
	dc.b		$03,	nA3,	$06,	$12,	nAb3,	nBb3,	$18,	nF4
	dc.b		$06,	nAb3,	$12,	nBb3,	nBb3,	$06,	nC4,	nCs4
	dc.b		$15,	nAb3,	$03,	nCs4,	$06,	$12,	nEb3,	$30
	smpsStop

; FM4 Data
music95_FM4:
	smpsFMvoice	$02
	smpsPan		panRight,	$00
	dc.b		nRst,	$12,	nG5,	$03,	nA5,	nG5,	$18
music95_Loop06:
	dc.b		nG5,	$30,	nEb5,	$18,	nF5,	$0C,	nA5
	smpsLoop	$00,	$02,	music95_Loop06
	dc.b		nE5,	$12,	nG5,	nE5,	$0C,	nE5,	$12,	nG5
	dc.b		nE5,	$0C,	nF5,	$12,	nA5,	nF5,	$0C,	nC6
	dc.b		$12,	nA5,	nF5,	$0C
music95_Loop07:
	dc.b		nE5,	$03,	$03,	nD5,	$06,	nE5,	nD5,	$03
	dc.b		nE5,	$1B,	nF5,	$03,	$03,	nE5,	$06,	nF5
	dc.b		nE5,	$03,	nF5,	$1B
	smpsLoop	$00,	$02,	music95_Loop07
	dc.b		nC5,	$12,	nA4,	nC5,	$0C,	nB4,	$12,	nD5
	dc.b		nB4,	$0C,	nC5,	$12,	nE5,	nC5,	$0C,	nRst
	dc.b		$06
	smpsAlterVol	$0A
music95_Loop08:
	dc.b		nF5
	smpsAlterVol	$FE
	smpsLoop	$00,	$07,	music95_Loop08
	smpsAlterVol	$03
music95_Loop09:
	dc.b		nBb5,	$12,	nG5,	$03,	nBb5,	$0F,	nG5,	$0C
	dc.b		nC6,	$18,	nAb5,	$06,	$06,	$03,	nC6,	$09
	smpsLoop	$00,	$02,	music95_Loop09
	dc.b		nC6,	$06,	nC5,	$03,	nEb5,	nG5,	$06,	nC5
	dc.b		$03,	nEb5,	nB5,	$18,	nBb5,	$06,	nC5,	$03
	dc.b		nEb5,	nG5,	$06,	nC5,	$03,	nEb5,	nA5,	$18
	dc.b		nEb5,	$12,	nF5,	$18,	nG5,	$03,	nF5,	nEb5
	dc.b		$12,	nF5,	nF5,	$0C,	nC5,	$06,	nEb5,	$03
	dc.b		nC5,	$06,	nEb5,	$03,	nC6,	$06,	nG5,	$03
	dc.b		$03,	nEb5,	nC5,	$09,	nG5,	$03,	nAb5,	nG5
	dc.b		$30
	smpsStop

; FM5 Data
music95_FM5:
	smpsFMvoice	$02
	smpsPan		panLeft,	$00
	dc.b		nRst,	$01,	nRst,	$12,	nG5,	$03,	nA5,	nG5
	dc.b		$17
music95_Loop0A:
	dc.b		nE5,	$30,	nC5,	$18,	nD5,	$0C,	nF5
	smpsLoop	$00,	$02,	music95_Loop0A
	dc.b		nC5,	$12,	nE5,	nC5,	$0C,	nC5,	$12,	nE5
	dc.b		nC5,	$0C,	nD5,	$12,	nF5,	nD5,	$0C,	nA5
	dc.b		$12,	nF5,	nD5,	$0C
music95_Loop0B:
	dc.b		nC5,	$03,	$03,	nB4,	$06,	nC5,	nB4,	$03
	dc.b		nC5,	$1B,	nD5,	$03,	$03,	nC5,	$06,	nD5
	dc.b		nC5,	$03,	nD5,	$1B
	smpsLoop	$00,	$02,	music95_Loop0B
	dc.b		nA4,	$12,	nF4,	nA4,	$0C,	nG4,	$12,	nB4
	dc.b		nG4,	$0C,	nA4,	$12,	nC5,	nA4,	$0C,	nRst
	dc.b		$06
	smpsAlterVol	$0A
music95_Loop0C:
	dc.b		nD5,	$06
	smpsAlterVol	$FE
	smpsLoop	$00,	$07,	music95_Loop0C
	smpsAlterVol	$03
music95_Loop0D:
	dc.b		nG5,	$12,	nEb5,	$03,	nG5,	$0F,	nEb5,	$0C
	dc.b		nAb5,	$18,	nF5,	$06,	$06,	$03,	nAb5,	$09
	smpsLoop	$00,	$02,	music95_Loop0D
	dc.b		nRst,	$01,	nC6,	$06,	nC5,	$03,	nEb5,	nG5
	dc.b		$06,	nC5,	$03,	nEb5,	$02,	nG5,	$18,	nRst
	dc.b		$01,	nBb5,	$06,	nC5,	$03,	nEb5,	nG5,	$06
	dc.b		nC5,	$03,	nEb5,	$02,	nG5,	$18,	nC5,	$12
	dc.b		nD5,	$18,	nEb5,	$03,	nD5,	nC5,	$12,	nD5
	dc.b		nD5,	$0C,	nAb4,	$06,	nC5,	$03,	nAb4,	$06
	dc.b		nC5,	$03,	nG5,	$06,	nEb5,	$03,	$03,	nC5
	dc.b		nAb4,	$09,	nEb5,	$03,	nF5,	nEb5,	$30
	smpsStop

; PSG1 Data
music95_PSG1:
	smpsAlterNote	$01
	dc.b		nRst,	$02

; PSG2 Data
music95_PSG2:
	dc.b		nRst,	$01,	nRst,	$06,	nE5,	$03,	nF5,	nE5
	dc.b		$24
	smpsCall	music95_Call05
	dc.b		nRst,	$30,	nRst,	$18
	smpsSetVol	$02
	smpsCall	music95_Call02
	smpsSetVol	$FE
	dc.b		nRst,	$06,	nF6,	$02,	nRst,	$01,	nG6,	$02
	dc.b		nRst,	$01,	nA6,	$02,	nRst,	$01,	nRst,	$03
	dc.b		nF6,	$02,	nRst,	$01,	nG6,	$02,	nRst,	$01
	dc.b		nA6,	$14,	nRst,	$04,	nRst,	$06,	nG6,	$02
	dc.b		nRst,	$01,	nA6,	$02,	nRst,	$01,	nB6,	$02
	dc.b		nRst,	$01,	nRst,	$03,	nG6,	$02,	nRst,	$01
	dc.b		nA6,	$02,	nRst,	$01,	nB6,	$14,	nRst,	$04
	dc.b		nRst,	$06,	nA6,	$02,	nRst,	$01,	nB6,	$02
	dc.b		nRst,	$01,	nC7,	$02,	nRst,	$01,	nRst,	$03
	dc.b		nA6,	$02,	nRst,	$01,	nB6,	$02,	nRst,	$01
	dc.b		nC7,	$14,	nRst,	$04
	smpsCall	music95_Call08
	smpsCall	music95_Call07
	dc.b		nEb6,	$30,	smpsNoAttack,	$18,	nRst,	$18
	smpsStop

music95_Call08:
	smpsSetVol	$07
	dc.b		nG5,	$03,	nA5
	smpsSetVol	$FF
	dc.b		nB5,	$03,	nC6
	smpsSetVol	$FF
	dc.b		nB5,	$03,	nC6
	smpsSetVol	$FF
	dc.b		nD6,	$03,	nE6
	smpsSetVol	$FF
	dc.b		nD6,	$03,	nE6
	smpsSetVol	$FF
	dc.b		nF6,	$03,	nG6
	smpsSetVol	$FF
	dc.b		nF6,	$03,	nG6
	smpsSetVol	$FF
	dc.b		nA6,	$03,	nB6
	smpsReturn

; PSG3 Data
music95_PSG3:
	dc.b		nRst,	$02
	smpsCall	music95_Call01
	smpsAlterPitch	$F4
	smpsCall	music95_Call02
	smpsCall	music95_Call03
	smpsCall	music95_Call08
	smpsCall	music95_Call04
	dc.b		nBb6,	$18,	nRst,	$18
	smpsStop

; DAC Data
music95_DAC:
	smpsCall	music95_Call09
music95_Loop0E:
	dc.b		dKick,	$15,	dKick,	$03,	$06,	$06,	dSnare,	$0C
	smpsLoop	$00,	$07,	music95_Loop0E
	smpsCall	music95_Call09
music95_Loop0F:
	dc.b		dKick,	$0C,	dSnare,	$09,	dKick,	$03,	$06,	$06
	dc.b		dSnare,	$0C
	smpsLoop	$00,	$07,	music95_Loop0F
	dc.b		dKick,	$06,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare,	dSnare
	dc.b		dSnare,	$03,	dSnare
music95_Loop10:
	dc.b		dKick,	$0C,	dSnare,	$09,	dKick,	$03,	$06,	$06
	dc.b		dSnare,	$0C,	dKick,	$0C,	dSnare,	$09,	dKick,	$03
	dc.b		$06,	$06,	dSnare,	$06,	$03,	$03
	smpsLoop	$00,	$03,	music95_Loop10
music95_Loop11:
	dc.b		dKick,	$0C,	dSnare,	$06,	dKick,	$0C,	dSnare,	$06
	dc.b		$06,	$03,	$03
	smpsLoop	$00,	$02,	music95_Loop11
	dc.b		dKick,	$0C,	dSnare,	$09,	dKick,	$03,	$06,	$06
	dc.b		dSnare,	$0C,	dKick,	$30
	smpsStop

music95_Call09:
	dc.b		dKick,	$15,	dKick,	$03,	$06,	$06,	dSnare,	dSnare
	dc.b		$03,	$03
	smpsReturn

music95_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b		$3A,$11,$1A,$00,$11,$89,$59,$4F,$4F,$0A,$0D,$06,$09,$00,$00,$00
	dc.b		$01,$1F,$FF,$0F,$5F,$20,$2E,$3B,$80;			Voice 02
	dc.b		$23,$6E,$34,$26,$74,$0E,$0E,$0E,$0D,$08,$07,$05,$05,$02,$02,$03
	dc.b		$12,$1F,$2F,$2F,$2F,$29,$9F,$24,$82;			Voice 03
	even
