; =============================================================================================
; Project Name:		music85
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music85_Header:
	smpsHeaderVoice	music85_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$01,	$0E

	smpsHeaderDAC	music85_DAC
	smpsHeaderFM	music85_FM1,	smpsPitch01lo,	$0E
	smpsHeaderFM	music85_FM2,	smpsPitch02hi,	$0A
	smpsHeaderFM	music85_FM3,	smpsPitch01hi,	$14
	smpsHeaderFM	music85_FM4,	smpsPitch01hi,	$16
	smpsHeaderFM	music85_FM5,	smpsPitch01hi,	$16
	smpsHeaderPSG	music85_PSG1,	smpsPitch02lo,	$06,	$00
	smpsHeaderPSG	music85_PSG2,	smpsPitch03lo,	$08,	$00
	smpsHeaderPSG	music85_PSG3,	smpsPitch00,	$02,	$03

; PSG1 Data
music85_PSG1:
	smpsJump	music85_Jump01

; PSG2 Data
music85_PSG2:
	smpsAlterPitch	$0C
	smpsJump	music85_Jump01

; FM1 Data
music85_FM1:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$04,	music85_FM1
music85_Loop01:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$04,	music85_Loop01
	smpsAlterPitch	$0C
	smpsFMvoice	$03
	smpsModSet	$01,	$02,	$01,	$7F
	dc.b		nB2,	$60
	smpsModSet	$01,	$01,	$08,	$06
	dc.b		smpsNoAttack,	nC3
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C,	nRst,	$30
	smpsAlterVol	$F0
	smpsModSet	$0C,	$01,	$04,	$04
	smpsFMvoice	$03
music85_Loop02:
	dc.b		nRst,	$30,	nRst,	$0C
	smpsModSet	$01,	$01,	$0C,	$0C
	dc.b		nEb3,	$0C,	smpsModOff,	smpsNoAttack,	nE3,	$0C,	nD3,	$0C
	dc.b		nC3,	$18
	smpsModSet	$01,	$01,	$10,	$06
	dc.b		nEb3,	$06,	smpsModOff,	smpsNoAttack,	nE3,	$06,	nRst,	$30
	dc.b		nRst,	$0C,	nRst,	$30,	nRst,	$0C,	nE3,	nF3
	dc.b		nE3
	smpsModSet	$01,	$01,	$06,	$18
	dc.b		nFs3,	$0C,	smpsModOff,	smpsNoAttack,	nG3,	$0C
	smpsModSet	$01,	$01,	$06,	$18
	dc.b		nEb3,	$0C,	smpsModOff,	smpsNoAttack,	nE3,	$0C
	smpsModSet	$01,	$01,	$05,	$18
	dc.b		nB2,	$0C,	smpsModOff,	smpsNoAttack,	nC3,	$0C,	nRst,	$18
	smpsLoop	$00,	$02,	music85_Loop02
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst
	smpsAlterPitch	$F4
	smpsModSet	$06,	$01,	$08,	$04
	smpsFMvoice	$00
	smpsAlterVol	$0A
	dc.b		nG5,	$0A,	nRst,	$02,	nG5,	$06,	nRst
	smpsAlterVol	$FB
	smpsAlterPitch	$0C
	smpsFMvoice	$03
	dc.b		nG2,	$06,	nBb2,	nC3,	nEb3,	$12,	nC3,	$05
	dc.b		nRst,	$07,	nBb2,	$06,	nC3,	$08,	nRst,	$0A
	smpsAlterPitch	$F4
	smpsFMvoice	$00
	smpsAlterVol	$05
	dc.b		nG5,	$0A,	nRst,	$02,	nG5,	$06,	nRst
	smpsAlterVol	$FB
	smpsAlterPitch	$0C
	smpsFMvoice	$03
	dc.b		nG2,	$06,	nBb2,	nC3,	nEb3,	$12,	nC3,	$06
	dc.b		nRst,	nBb2,	$06,	nC3,	$05,	nRst,	$0D,	nRst
	dc.b		$30,	nRst,	nRst,	nRst
	smpsAlterPitch	$F4
	smpsFMvoice	$00
	smpsAlterVol	$05
	dc.b		nG5,	$0A,	nRst,	$02,	nG5,	$06,	nRst
	smpsAlterVol	$FB
	smpsAlterPitch	$0C
	smpsFMvoice	$03
	dc.b		nG2,	$06,	nBb2,	nC3,	nEb3,	$12,	nC3,	$06
	dc.b		nRst,	nBb2,	$06,	nC3,	$05,	nRst,	$0D
	smpsAlterVol	$FB
	smpsFMvoice	$03
	smpsModSet	$01,	$04,	$F4,	$78
	dc.b		nG4,	$30
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$04
	dc.b		smpsNoAttack,	$0C
	smpsAlterVol	$F0
	dc.b		smpsModOff
	smpsAlterPitch	$F4
	smpsJump	music85_Loop01
music85_Jump01:
	smpsModSet	$06,	$01,	$02,	$04
music85_Loop03:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$04,	music85_Loop03
music85_Loop04:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$07,	music85_Loop04
music85_Loop05:
	dc.b		nRst,	$30,	nRst,	$0C,	nE3,	$18,	nD3,	$0C
	dc.b		nC3,	$18,	nE3,	$0C,	nRst,	$30,	nRst,	$0C
	dc.b		nRst,	$30,	nRst,	$0C,	nE3,	nF3,	nE3,	nG3
	dc.b		$18,	nE3,	$18,	nC3,	$18,	nRst,	$18
	smpsLoop	$00,	$02,	music85_Loop05
music85_Loop06:
	dc.b		nRst,	$30,	nRst
	smpsLoop	$00,	$09,	music85_Loop06
	smpsJump	music85_Loop04

; FM3 Data
music85_FM3:
	smpsFMvoice	$01
	smpsAlterPitch	$F4
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nF3,	$0C,	smpsNoAttack
music85_Loop07:
	smpsModSet	$01,	$01,	$06,	$08
	dc.b		nFs3,	$04,	smpsModOff,	smpsNoAttack,	nG3,	$08,	smpsNoAttack
	smpsModSet	$01,	$01,	$FA,	$08
	dc.b		nFs3,	$04,	smpsModOff,	smpsNoAttack,	nF3,	$08
	smpsLoop	$00,	$06,	music85_Loop07
	dc.b		nRst,	$24
	smpsFMvoice	$00
	smpsAlterPitch	$0C
music85_Loop08:
	dc.b		nRst,	$18,	nG4,	$0B,	nRst,	$0D,	nA4,	$0C
	dc.b		$0B,	nRst,	$19,	nC5,	$0C,	$0B,	nRst,	$0D
	dc.b		nG4,	$30,	smpsNoAttack,	$0C,	nRst,	$18,	nG4,	$0B
	dc.b		nRst,	$0D,	nA4,	$0C,	$0B,	nRst,	$19,	nC5
	dc.b		$0C,	$0B,	nRst,	$0D,	nC5,	$30,	smpsNoAttack,	$0C
	smpsLoop	$00,	$04,	music85_Loop08
music85_Loop09:
	dc.b		nD6,	$06,	nC6,	nBb5,	nA5
	smpsLoop	$00,	$08,	music85_Loop09
	dc.b		nC5,	$0C,	$06,	nRst,	$30,	nRst,	$12,	nBb4
	dc.b		$0C,	nC6,	nC6,	$06,	nRst,	$30,	nRst,	$1E
music85_Loop0A:
	dc.b		nD6,	$06,	nC6,	nBb5,	nA5
	smpsLoop	$00,	$08,	music85_Loop0A
	dc.b		nC6,	$0C,	$06,	nRst,	$30,	nRst,	$1E,	nD5
	dc.b		$06,	nFs5,	nCs5,	nF5,	nC5,	nE5,	nB4,	nEb5
	dc.b		nB4,	nD5,	nBb4,	nD5,	nA4,	nCs5,	nAb4,	nC5
	smpsJump	music85_Loop08

; FM4 Data
music85_FM4:
	smpsFMvoice	$01
	smpsAlterPitch	$F4
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nBb3,	$0C,	smpsNoAttack
music85_Loop0B:
	smpsModSet	$01,	$01,	$06,	$08
	dc.b		nB3,	$04,	smpsModOff,	smpsNoAttack,	nC4,	$08,	smpsNoAttack
	smpsModSet	$01,	$01,	$FA,	$08
	dc.b		nB3,	$04,	smpsModOff,	smpsNoAttack,	nBb3,	$08
	smpsLoop	$00,	$06,	music85_Loop0B
	dc.b		nRst,	$24
	smpsAlterPitch	$0C
	smpsFMvoice	$00
music85_Loop0C:
	dc.b		nRst,	$18,	nE4,	$0B,	nRst,	$0D,	nFs4,	$0C
	dc.b		$0B,	nRst,	$19,	nA4,	$0C,	$0B,	nRst,	$0D
	dc.b		nE4,	$30,	smpsNoAttack,	$0C,	nRst,	$18,	nE4,	$0B
	dc.b		nRst,	$0D,	nFs4,	$0C,	$0B,	nRst,	$19,	nA4
	dc.b		$0C,	$0B,	nRst,	$0D,	nG4,	$30,	smpsNoAttack,	$0C
	smpsLoop	$00,	$04,	music85_Loop0C
	smpsPan		panLeft,	$00
	smpsAlterPitch	$F4
	smpsFMvoice	$02
	dc.b		nF3,	$30,	smpsNoAttack,	$30,	nA3,	nF3
	smpsAlterPitch	$0C
	smpsFMvoice	$00
	dc.b		nC5,	$0A,	nRst,	$02,	nC5,	$06,	nRst,	nRst
	dc.b		$30,	nRst,	$0C,	nBb3,	nC5,	$0A,	nRst,	$02
	dc.b		nC5,	$06,	nRst,	nRst,	$30,	nRst,	$18
	smpsAlterPitch	$F4
	smpsFMvoice	$02
	dc.b		nF3,	$30,	smpsNoAttack,	$30,	nA3,	nF3
	smpsAlterPitch	$0C
	smpsPan		panCentre,	$00
	smpsFMvoice	$00
	dc.b		nC5,	$0A,	nRst,	$02,	nC5,	$06,	nRst,	nRst
	dc.b		$30,	nRst,	nRst,	nRst,	$18
	smpsJump	music85_Loop0C

; FM5 Data
music85_FM5:
	smpsFMvoice	$00
	smpsModSet	$0C,	$01,	$FC,	$04
music85_Loop0D:
	dc.b		nRst,	$60
	smpsLoop	$00,	$04,	music85_Loop0D
music85_Loop0E:
	dc.b		nRst,	$18,	nC4,	$0B,	nRst,	$0D,	nD4,	$0C
	dc.b		$0B,	nRst,	$19,	nF4,	$0C,	$0B,	nRst,	$0D
	dc.b		nC4,	$30,	smpsNoAttack,	$0C,	nRst,	$18,	nC4,	$0B
	dc.b		nRst,	$0D,	nD4,	$0C,	$0B,	nRst,	$19,	nF4
	dc.b		$0C,	$0B,	nRst,	$0D,	nE4,	$30,	smpsNoAttack,	$0C
	smpsLoop	$00,	$04,	music85_Loop0E
	smpsPan		panRight,	$00
	smpsAlterPitch	$F4
	smpsFMvoice	$02
	dc.b		nBb3,	$30,	smpsNoAttack,	$30,	nD4,	nBb3
	smpsAlterPitch	$0C
	smpsFMvoice	$00
	dc.b		nC4,	$0A,	nRst,	$02,	nC4,	$06,	nRst,	nRst
	dc.b		$30,	nRst,	$0C,	nBb3,	nC4,	$0A,	nRst,	$02
	dc.b		nC4,	$06,	nRst,	nRst,	$30,	nRst,	$18
	smpsAlterPitch	$F4
	smpsFMvoice	$02
	dc.b		nBb3,	$30,	smpsNoAttack,	$30,	nD4,	nBb3
	smpsAlterPitch	$0C
	smpsPan		panCentre,	$00
	smpsFMvoice	$00
	dc.b		nC4,	$0A,	nRst,	$02,	nC4,	$06,	nRst,	nRst
	dc.b		$30,	nRst,	$18,	nRst,	$30,	nRst
	smpsJump	music85_Loop0E

; FM2 Data
music85_FM2:
	smpsFMvoice	$04
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	nRst,	nRst
	smpsAlterVol	$FC
	dc.b		nRst,	nRst,	$0C,	nA0,	nBb0,	nB0
	smpsAlterVol	$04
music85_Jump02:
	smpsNoteFill	$09
	dc.b		nC1,	$0C,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nA0,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	$06,	nC2
	smpsNoteFill	$00
	dc.b		nA0,	$0C,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nA0,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nEb1,	nD1,	nCs1
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	$0C
	dc.b		nC1,	$06,	nC1,	$06,	$0C,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nA0,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	$06,	nC2
	smpsNoteFill	$00
	dc.b		nA0,	$0C,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nA0,	nBb0,	nB0
	smpsNoteFill	$09
	dc.b		nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1,	nC1
	dc.b		nC1,	nC1,	nC1,	nC1
	smpsNoteFill	$00
	dc.b		nC1,	nEb1,	nD1,	nCs1,	nBb0,	nBb0,	nBb0,	nBb0
	dc.b		nBb0,	nBb0,	nBb0,	nBb0,	nD1,	nD1,	nD1,	nD1
	dc.b		nBb0,	nBb0,	nBb0,	nBb0,	nC1,	nC1,	$06
	smpsFMvoice	$05
	dc.b		nRst,	$06,	nG2,	$06,	nBb2,	nC3,	nEb3,	$12
	dc.b		nC3,	$06,	nRst,	nBb2,	$06,	nC3,	$05,	nRst
	dc.b		$01
	smpsFMvoice	$04
	dc.b		nBb0,	$06,	nB0,	nC1,	nRst,	nC1,	nRst
	smpsFMvoice	$05
	dc.b		nG2,	$06,	nBb2,	nC3,	nEb3,	$12,	nC3,	$06
	dc.b		nRst,	nBb2,	$06,	nC3,	$05,	nRst,	$01
	smpsFMvoice	$04
	dc.b		nB0,	$0C,	nBb0,	nBb0,	nBb0,	nBb0,	nBb0,	nBb0
	dc.b		nBb0,	nBb0,	nD1,	nD1,	nD1,	nD1,	nBb0,	nBb0
	dc.b		nBb0,	nBb0,	nC1,	nC1,	$06
	smpsFMvoice	$05
	dc.b		nRst,	$06,	nG2,	$06,	nBb2,	nC3,	nEb3,	$12
	dc.b		nC3,	$06,	nRst,	nBb2,	$06,	nC3,	$05,	nRst
	dc.b		$01
	smpsFMvoice	$04
	dc.b		nBb0,	$06,	nB0,	nC1,	$06,	nRst,	$30,	nRst
	dc.b		$2A
	smpsJump	music85_Jump02

music85_Call01:
	dc.b		dKick,	$0C,	$8D,	dSnare,	dKick,	dKick,	$8E,	dSnare
	dc.b		$84,	$04,	$06,	$02,	dKick,	$0C,	$8D,	dSnare
	dc.b		dKick,	dKick,	$8E,	dSnare,	dTimpani
	smpsReturn

; DAC Data
music85_DAC:
	smpsCall	music85_Call01
	smpsLoop	$00,	$02,	music85_DAC
music85_Loop0F:
	smpsCall	music85_Call01
	smpsLoop	$00,	$0B,	music85_Loop0F
	dc.b		dKick,	$0C,	$8D,	dSnare,	dKick,	dKick,	$8E,	dSnare
	dc.b		$84,	$04,	$06,	$02,	dKick,	$0C,	nRst,	nRst
	dc.b		nRst,	nRst,	nRst,	nRst,	dTimpani
	smpsJump	music85_Loop0F

; PSG3 Data
music85_PSG3:
	smpsPSGform	$E7
music85_Jump03:
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	$24,	nAb5,	$0C
	smpsJump	music85_Jump03

music85_Voices:
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
