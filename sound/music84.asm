; =============================================================================================
; Project Name:		music84
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music84_Header:
	smpsHeaderVoice	music84_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$06

	smpsHeaderDAC	music84_DAC
	smpsHeaderFM	music84_FM1,	smpsPitch01lo,	$12
	smpsHeaderFM	music84_FM2,	smpsPitch01lo,	$09
	smpsHeaderFM	music84_FM3,	smpsPitch05lo,	$14
	smpsHeaderFM	music84_FM4,	smpsPitch01lo,	$16
	smpsHeaderFM	music84_FM5,	smpsPitch01lo,	$16
	smpsHeaderPSG	music84_PSG1,	smpsPitch04lo,	$04,	$00
	smpsHeaderPSG	music84_PSG2,	smpsPitch04lo,	$05,	$00
	smpsHeaderPSG	music84_PSG3,	smpsPitch00+$02,	$07,	$01

; FM1 Data
music84_FM1:
	smpsFMvoice	$04
	smpsModSet	$02,	$03,	$01,	$03
	smpsCall	music84_Call01
music84_Jump01:
	smpsFMvoice	$02
	smpsAlterVol	$FB
	smpsAlterPitch	$DC
	smpsCall	music84_Call02
	smpsAlterVol	$05
	smpsAlterPitch	$24
	smpsFMvoice	$04
	smpsCall	music84_Call03
	smpsFMvoice	$02
	smpsAlterVol	$FC
	smpsAlterPitch	$DC
	smpsCall	music84_Call04
	smpsAlterVol	$04
	smpsAlterPitch	$24
	smpsAlterPitch	$E8
	smpsFMvoice	$05
	smpsAlterVol	$07
	smpsCall	music84_Call05
	smpsAlterVol	$F9
	smpsAlterPitch	$18
	smpsJump	music84_Jump01

music84_Call01:
	dc.b		nG5,	$03,	$03,	$06,	nAb5,	nB5,	nC6,	nD6
	dc.b		$12,	$03,	$03,	$06,	nEb6,	nF6,	nEb6,	nD6
	dc.b		nEb6,	nD6,	nC6,	nB5,	$03,	nC6,	nB5,	nAb5
	dc.b		nG5,	$24
	smpsReturn

music84_Call02:
	dc.b		nRst,	$18,	nRst,	$03,	nRst,	$01,	nC6,	$01
	dc.b		nD6,	$02,	nEb6,	$02,	nFs6,	$25
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$F8
	dc.b		nAb6,	$01,	nG6,	$0B,	nEb6,	$01,	nD6,	$30
	dc.b		smpsNoAttack,	$2D
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$02
	dc.b		smpsNoAttack,	$02
	smpsAlterVol	$F8
	smpsReturn

music84_Call03:
	smpsCall	music84_Call06
	dc.b		nD6,	$1E,	nEb6,	$06,	nD6,	nC6,	nB5,	$12
	dc.b		nC6,	$06,	nB5,	$0C,	nAb5
	smpsCall	music84_Call06
	dc.b		nF6,	$0C,	nG6,	$06,	nF6,	nEb6,	nD6,	nEb6
	dc.b		nD6,	nC6,	nB5,	$0C,	nAb5,	$06,	nG5,	$18
music84_Loop01:
	dc.b		nG5,	$03,	nAb5,	nB5,	$06,	nC6,	nB5,	nAb5
	dc.b		nG5,	$0C,	$03,	nAb5,	nB5,	$06,	nC6,	nB5
	dc.b		nAb5,	nG5,	$18
	smpsLoop	$01,	$02,	music84_Loop01
	smpsReturn

music84_Call04:
	smpsCall	music84_Call07
	dc.b		nG6,	$01,	nFs6,	$0B,	nEb6,	$01,	nD6,	$1D
	smpsCall	music84_Call07
	dc.b		nFs6,	$01,	nF6,	$0B,	nBb6,	$01,	nA6,	$1D
	smpsReturn

music84_Call07:
	dc.b		nRst,	$0C,	nCs6,	$01,	nC6,	$05,	nEb6,	$01
	dc.b		nD6,	$05,	nE6,	$01,	nEb6,	$05,	nCs6,	$01
	dc.b		nC6,	$05,	nAb6,	$01,	nG6,	$0B,	nAb6,	$01
	dc.b		nG6,	$05
	smpsReturn

music84_Call05:
	dc.b		nA7,	$03,	nG7,	nFs7,	nEb7,	nFs7,	nEb7,	nD7
	dc.b		nCs7,	nD7,	$18
	smpsReturn

music84_Call06:
	dc.b		nG5,	$1E,	nAb5,	$06,	nB5,	nC6,	nD6,	$1E
	dc.b		nEb6,	$06,	nF6,	nEb6
	smpsReturn

; FM2 Data
music84_FM2:
	smpsFMvoice	$00
	dc.b		nRst,	$06,	nRst,	$30,	nRst,	nRst,	$2A,	nF4
	dc.b		$03,	nG4
music84_Loop02:
	smpsCall	music84_Call08
	dc.b		nRst,	$12
	smpsCall	music84_Call08
	dc.b		nRst,	$06,	nF4,	$03,	nRst,	nF4,	nG4
	smpsLoop	$00,	$04,	music84_Loop02
	dc.b		nC4,	$02,	nRst,	$01,	nC4,	$03,	nG3,	$06
	dc.b		nBb3,	nG3,	nC4,	$02,	nRst,	$01,	nC4,	$03
	dc.b		nG3,	$06,	nBb3,	nC4,	nD4,	$02,	nRst,	$01
	dc.b		nD4,	$03,	nA3,	$06,	nC4,	nA3,	nD4,	$02
	dc.b		nRst,	$01,	nD4,	$03,	nA3,	$06,	nC4,	nD4
	dc.b		nEb4,	$02,	nRst,	$01,	nEb4,	$03,	nBb3,	$06
	dc.b		nC4,	nBb3,	nEb4,	$02,	nRst,	$01,	nEb4,	$03
	dc.b		nBb3,	$06,	nC4,	nEb4,	nF4,	$03,	nRst,	nF4
	dc.b		nRst,	nF4,	nRst,	nF4,	nRst,	nFs4,	nRst,	nFs4
	dc.b		nRst,	nFs4,	nRst,	nFs4,	nRst,	nRst,	$0C,	nD4
	dc.b		$24
	smpsJump	music84_Loop02

music84_Call08:
	dc.b		nG3,	$03,	nG3,	nD3,	$06,	nF3,	nFs3,	nG3
	dc.b		nRst,	$12,	nG3,	$03,	$03,	nBb3,	$06,	nA3
	dc.b		nAb3,	nG3
	smpsReturn

; FM4 Data
music84_FM4:
	smpsFMvoice	$02
	smpsPan		panRight,	$00
	smpsAlterPitch	$DC
	smpsAlterVol	$F9
	smpsCall	music84_Call09
	smpsAlterVol	$07
	dc.b		nG4,	$30
	smpsAlterPitch	$24
	smpsFMvoice	$01
	smpsPan		panCentre,	$00
music84_Loop03:
	dc.b		nRst,	$06,	nD5,	$03,	nRst,	nD5,	nRst,	nD5
	dc.b		nRst,	nCs5,	$09,	nD5,	$03,	nRst,	$0C,	nRst
	dc.b		$30
	smpsLoop	$00,	$08,	music84_Loop03
music84_Loop04:
	dc.b		nRst,	$06,	nBb5,	$03,	nBb5,	nRst,	nBb5,	nRst
	dc.b		$06,	nBb5,	$09,	nBb5,	$03,	nRst,	$0C
	smpsAlterPitch	$02
	smpsLoop	$00,	$03,	music84_Loop04
	smpsAlterPitch	$FA
music84_Loop05:
	dc.b		nA5,	$03,	nRst
	smpsLoop	$00,	$08,	music84_Loop05
	dc.b		nRst,	$30
	smpsJump	music84_Loop03

music84_Call09:
	dc.b		nRst,	$06,	nRst,	nD5,	nC5,	nB4,	nC5,	nB4
	dc.b		nAb4,	nG4,	$0C,	nD5,	$06,	nC5,	nB4,	nG4
	dc.b		$12,	nF4,	$06
	smpsReturn

; FM5 Data
music84_FM5:
	smpsFMvoice	$02
	smpsPan		panLeft,	$00
	smpsAlterPitch	$E8
	dc.b		nRst,	$01
	smpsAlterVol	$F9
	smpsCall	music84_Call09
	smpsAlterVol	$07
	dc.b		nG4,	$2F
	smpsAlterPitch	$18
	smpsFMvoice	$01
	smpsPan		panCentre,	$00
music84_Loop06:
	dc.b		nRst,	$06,	nBb4,	$03,	nRst,	nBb4,	nRst,	nBb4
	dc.b		nRst,	nA4,	$09,	nBb4,	$03,	nRst,	$0C,	nRst
	dc.b		$30
	smpsLoop	$00,	$08,	music84_Loop06
music84_Loop07:
	dc.b		nRst,	$06,	nG5,	$03,	nG5,	nRst,	nG5,	nRst
	dc.b		$06,	nG5,	$09,	nG5,	$03,	nRst,	$0C
	smpsAlterPitch	$02
	smpsLoop	$00,	$02,	music84_Loop07
	smpsAlterPitch	$FC
	dc.b		nRst,	$06,	nBb5,	$03,	nBb5,	nRst,	nBb5,	nRst
	dc.b		$06,	nBb5,	$09,	nBb5,	$03,	nRst,	$0C,	nF5
	dc.b		$03,	nRst,	nF5,	nRst,	nF5,	nRst,	nF5,	nRst
	dc.b		nFs5,	nRst,	nFs5,	nRst,	nFs5,	nRst,	nFs5,	nRst
	dc.b		nRst,	$30
	smpsJump	music84_Loop06

; FM3 Data
music84_FM3:
	smpsFMvoice	$03
	dc.b		nC7,	$03,	nC7,	nC7,	$06,	nD7,	nD7,	nC7
	dc.b		nD7,	$03,	$03,	nC7,	$06,	$06,	nD7,	$03
	dc.b		$03,	nC7,	$06,	$06,	$06,	nD7,	$03,	$03
	dc.b		$03,	$03,	nC7,	$06,	$06,	nD7,	nC7,	$03
	dc.b		nD7,	nD7,	nD7,	nD7,	$06,	nC7,	nC7,	nD7
	dc.b		$03,	$03,	nC7,	$0C
music84_Loop08:
	dc.b		nRst,	$1E,	nD7,	$03,	$03,	nC7,	$06,	nD7
	dc.b		nRst,	$1E,	nC7,	$03,	$03,	nD7,	$06,	nC7
	smpsLoop	$00,	$09,	music84_Loop08
	dc.b		nRst,	$1E,	nD7,	$03,	$03,	nC7,	$06,	nD7
	dc.b		nRst,	$30,	nC7,	$03,	nD7,	nD7,	nC7,	nD7
	dc.b		nD7,	nC7,	nD7,	nD7,	nC7,	nD7,	nD7,	nC7
	dc.b		$06,	nD7
	smpsJump	music84_Loop08

; PSG1 Data
music84_PSG1:
	smpsAlterNote	$01
	dc.b		nRst,	$02,	nRst,	$01
	smpsCall	music84_Call01
music84_Jump02:
	smpsSetVol	$03
	dc.b		nRst,	$60,	$60
	smpsPSGvoice	$00
	smpsSetVol	$FD
	smpsCall	music84_Call03
	smpsCall	music84_Call04
	smpsAlterPitch	$F4
	smpsCall	music84_Call05
	smpsAlterPitch	$0C
	smpsJump	music84_Jump02

; PSG2 Data
music84_PSG2:
	dc.b		nRst,	$01
	smpsCall	music84_Call01
music84_Jump03:
	smpsSetVol	$03
	dc.b		nRst,	$18,	nRst,	$03,	nRst,	$01
	smpsPSGvoice	$00
	smpsAlterVol	$FE
	dc.b		nC6,	$01,	nD6,	$02,	nEb6,	$02,	nFs6,	$2D
	dc.b		nAb6,	$01,	nG6,	$0B,	nEb6,	$01,	nD6,	$30
	dc.b		smpsNoAttack,	$30,	smpsNoAttack,	$05
	smpsAlterVol	$02
	smpsPSGvoice	$00
	smpsSetVol	$FD
	smpsCall	music84_Call03
	smpsCall	music84_Call04
	smpsAlterPitch	$F4
	smpsCall	music84_Call05
	smpsAlterPitch	$0C
	smpsJump	music84_Jump03

; PSG3 Data
music84_PSG3:
	dc.b		nRst,	$06,	nRst,	$30,	nE5,	$03,	nRst,	nE5
	dc.b		$03,	nRst,	$0F,	nE5,	$03,	nRst,	$09,	nE5
	dc.b		$03,	nRst,	nRst,	$06,	nE5,	$03,	nRst,	nE5
	dc.b		$03,	nRst,	$0F,	nE5,	$03,	nRst,	nE5,	$03
	dc.b		nRst,	nE5,	$03,	$03,	nRst,	$06,	nE5,	$03
	dc.b		nRst,	nE5,	$03,	nRst,	$03,	nRst,	$18,	nRst
	dc.b		$0C
music84_Loop09:
	dc.b		nE5,	$03,	nE5,	nE5,	nRst,	nE5,	nRst,	nE5
	dc.b		nE5,	nE5,	nE5,	nE5,	nRst,	nE5,	nRst,	nE5
	dc.b		nRst,	nE5,	nE5,	nE5,	nRst,	nE5,	nRst,	nE5
	dc.b		nE5,	nE5,	nE5,	nE5,	nRst,	nE5,	nRst,	nE5
	dc.b		nE5
	smpsLoop	$00,	$0A,	music84_Loop09
	dc.b		nRst,	$30
	smpsJump	music84_Loop09

; DAC Data
music84_DAC:
	dc.b		nRst,	$06,	nRst,	$30,	nRst,	nRst,	$2A,	dSnare
	dc.b		$06
music84_Loop0A:
	dc.b		dKick,	$03,	dKick,	dKick,	nRst,	dSnare,	$09,	$06
	dc.b		dKick,	$03,	dKick,	nRst,	dSnare,	$06,	dKick,	$03
	dc.b		nRst,	dKick,	dKick,	dKick,	nRst,	dSnare,	$09,	$06
	dc.b		dKick,	$03,	dKick,	nRst,	dSnare,	$06,	$03,	$03
	smpsLoop	$00,	$0A,	music84_Loop0A
	dc.b		nRst,	$24,	dSnare,	$03,	$03,	dKick,	$06
	smpsJump	music84_Loop0A

music84_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
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
	even
