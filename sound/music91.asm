; =============================================================================================
; Project Name:		music91
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music91_Header:
	smpsHeaderVoice	music91_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$02

	smpsHeaderDAC	music91_DAC
	smpsHeaderFM	music91_FM1,	smpsPitch01lo,	$05
	smpsHeaderFM	music91_FM2,	smpsPitch00,	$07
	smpsHeaderFM	music91_FM3,	smpsPitch02lo,	$0E
	smpsHeaderFM	music91_FM4,	smpsPitch00,	$13
	smpsHeaderFM	music91_FM5,	smpsPitch00,	$07
	smpsHeaderPSG	music91_PSG1,	smpsPitch02lo,	$06,	$03
	smpsHeaderPSG	music91_PSG2,	smpsPitch03lo,	$05,	$07
	smpsHeaderPSG	music91_PSG3,	smpsPitch03lo,	$06,	$07

; FM4 Data
music91_FM4:
	smpsFMvoice	$03
	smpsPan		panRight,	$00
	smpsNoteFill	$05
music91_Loop01:
	dc.b		nC5,	$06,	nB4,	nA4,	nG4
	smpsLoop	$00,	$04,	music91_Loop01
	dc.b		nC5,	nBb4,	nAb4,	nG4,	nC5,	nBb4,	nAb4,	nG4
	dc.b		nD5,	nC5,	nBb4,	nAb4,	nD5,	nC5,	nBb4,	nAb4
	smpsJump	music91_Loop01

; FM3 Data
music91_FM3:
	smpsFMvoice	$04
music91_Jump01:
	dc.b		nRst,	$0C,	nC4,	$06,	nE4,	nG4,	$0C,	nC4
	dc.b		$06,	nE4,	nG4,	$18,	smpsNoAttack,	$18,	nRst,	$0C
	dc.b		nAb3,	$06,	nC4,	nEb4,	$18,	nRst,	$0C,	nBb3
	dc.b		$06,	nD4,	nF4,	$18
	smpsJump	music91_Jump01

; FM5 Data
music91_FM5:
	smpsFMvoice	$01
	smpsPan		panRight,	$00
	smpsModSet	$02,	$01,	$02,	$04
	dc.b		nRst,	$02
	smpsJump	music91_Jump02

; FM2 Data
music91_FM2:
	smpsFMvoice	$01
	smpsPan		panLeft,	$00
	smpsModSet	$12,	$01,	$02,	$04
music91_Jump02:
	dc.b		nRst,	$0C,	nC5,	$03,	nRst,	nC5,	nRst,	nC5
	dc.b		$0C,	nD5,	$03,	nRst,	nF5,	$0C,	nRst,	$06
	dc.b		nE5,	nRst,	nD5,	nRst,	nC5,	nRst,	nEb5,	$0C
	dc.b		nF5,	$06,	nC5,	$06,	smpsNoAttack,	$18,	smpsNoAttack,	$18
	dc.b		smpsNoAttack,	$18
	smpsJump	music91_Jump02

; FM1 Data
music91_FM1:
	smpsFMvoice	$02
	dc.b		nC3,	$06,	nRst,	$12,	nC3,	$06,	nRst,	$12
	dc.b		nC3,	$06,	nRst,	$12,	nC3,	$06,	nRst,	nG2
	dc.b		$0C,	nAb2,	$06,	nRst,	$12,	nAb2,	$06,	nRst
	dc.b		nF2,	$0C,	nBb2,	$06,	nRst,	$12,	nBb2,	$06
	dc.b		nRst,	nG2,	$0C
	smpsJump	music91_FM1

; PSG2 Data
music91_PSG2:
	dc.b		nRst,	$02
	smpsJump	music91_Jump02

; PSG3 Data
music91_PSG3:
	smpsAlterNote	$01
	dc.b		nRst,	$03
	smpsJump	music91_Jump02

; PSG1 Data
music91_PSG1:
	smpsAlterNote	$01
	smpsJump	music91_Jump01

; DAC Data
music91_DAC:
	dc.b		dSnare,	$0C,	$04,	$04,	$04,	$0C,	$04,	$04
	dc.b		$04,	$0C,	$04,	$04,	$04,	$8C,	$06,	$8E
	dc.b		$8C,	$8E
	smpsJump	music91_DAC
							  
music91_Voices:
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b		$3C,$01,$01,$00,$01,$CF,$0E,$CF,$0E,$00,$02,$00,$02,$00,$00,$00
	dc.b		$00,$02,$37,$02,$38,$1E,$80,$1F,$80;			Voice 03
	dc.b		$3A,$14,$03,$05,$14,$8C,$58,$4E,$4E,$0A,$0D,$06,$06,$00,$00,$00
	dc.b		$01,$1F,$FF,$0F,$5F,$1F,$FF,$3B,$FF;			Voice 04
	even
