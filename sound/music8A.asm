; =============================================================================================
; Project Name:		music8A
; Created:		31st July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music8A_Header:
	smpsHeaderVoice	music8A_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$05

	smpsHeaderDAC	music8A_DAC
	smpsHeaderFM	music8A_FM1,	smpsPitch00,	$16
	smpsHeaderFM	music8A_FM2,	smpsPitch00,	$08
	smpsHeaderFM	music8A_FM3,	smpsPitch00,	$10
	smpsHeaderFM	music8A_FM4,	smpsPitch00,	$10
	smpsHeaderFM	music8A_FM5,	smpsPitch00,	$06
	smpsHeaderPSG	music8A_PSG1,	smpsPitch02lo,	$06,	$00
	smpsHeaderPSG	music8A_PSG2,	smpsPitch02lo,	$06,	$00
	smpsHeaderPSG	music8A_PSG3,	smpsPitch00,	$02,	$01

; FM1 Data
music8A_FM1:
	smpsFMvoice	$00
music8A_Jump01:
	dc.b		nA5,	$04,	nG5,	nBb5,	nFs5,	nA5,	nF5,	nAb5
	dc.b		nFs5,	nB5,	nF5,	nA5,	nG5,	nBb5,	nFs5,	nAb5
	dc.b		nF5,	nA5,	nG5,	nB5,	nF5,	nBb5,	nFs5,	nC6
	dc.b		nF5,	nBb5,	nG5,	nB5,	nFs5,	nA5,	nF5,	nAb5
	dc.b		nFs5,	nBb5,	nE5,	nG5,	nEb5,	nA5,	nF5,	nBb5
	dc.b		nFs5,	nB5,	nG5,	nA5,	nF5,	nAb5,	nFs5,	nBb5
	dc.b		nG5,	nB5,	nAb5,	nC6,	nA5,	nCs6,	nG5,	nC6
	dc.b		nF5,	nB5,	nFs5,	nBb5,	nG5,	nA5,	nF5,	nAb5
	dc.b		nE5,	nG5,	nEb5,	nA5,	nF5,	nBb5,	nFs5,	nB5
	dc.b		nG5,	nC6,	nAb5,	nEb6,	nG5,	nD6,	nF5,	nC6
	dc.b		nG5,	nB5,	nFs5,	nBb5,	nG5,	nA5,	nF5,	nAb5
	dc.b		nFs5,	nB5,	nF5,	nA5,	nG5,	nBb5,	nFs5,	nC6
	dc.b		nF5,	nBb5,	nFs5,	nB5,	nF5,	nA5,	nE5,	nAb5
	dc.b		nEb5,	nA5,	nE5,	nBb5,	nF5,	nB5,	nFs5,	nC6
	dc.b		nG5,	nD6,	nF5,	nBb5,	nFs5,	nA5,	nG5,	nB5
	dc.b		nFs5,	nBb5,	nF5,	nB5,	nE5,	nA5,	nF5,	nBb5
	dc.b		nG5,	nB5,	nFs5,	nA5,	nF5,	nBb5,	nFs5,	nC6
	dc.b		nE5,	nD6,	nEb5,	nCs6,	nF5,	nC6,	nFs5,	nB5
	dc.b		nF5,	nBb5,	nG5,	nA5,	nFs5,	nAb5,	nF5,	nA5
	dc.b		nFs5,	nBb5,	nG5,	nB5,	nAb5,	nC6,	nF5,	nA5
	dc.b		nFs5,	nBb5,	nF5,	nB5,	nE5,	nC6,	nF5,	nB5
	dc.b		nFs5,	nA5,	nG5,	nBb5,	nFs5,	nAb5,	nF5,	nA5
	dc.b		nG5,	nBb5,	nFs5,	nB5,	nF5,	nC6,	nE5,	nBb5
	dc.b		nF5,	nA5,	nFs5,	nB5,	nG5,	nAb5,	nF5,	nA5
	dc.b		nFs5,	nBb5,	nF5,	nB5,	nE5,	nC6,	nEb5,	nCs6
	dc.b		nE5,	nBb5,	nF5,	nA5,	nFs5,	nAb5,	nG5,	nB5
	dc.b		nF5,	nA5,	nFs5,	nBb5,	nG5,	nAb5,	nF5,	nB5
	dc.b		nE5,	nC6,	nEb5,	nBb5,	nF5,	nA5,	nFs5,	nB5
	dc.b		nG5,	nBb5,	nF5,	nA5,	nFs5,	nAb5,	nG5,	nB5
	dc.b		nF5,	nBb5,	nFs5,	nC6,	nD5,	nB5,	nF5,	nA5
	dc.b		nFs5,	nBb5,	nG5,	nAb5,	nFs5,	nA5,	nF5,	nBb5
	dc.b		nE5,	nB5,	nEb5,	nC6,	nF5,	nCs6,	nFs5,	nB5
	dc.b		nG5,	nBb5,	nFs5,	nA5,	nF5,	nAb5,	nEb5,	nG5
	dc.b		nF5,	nA5,	nFs5,	nBb5,	nG5,	nB5,	nAb5,	nC6
	dc.b		nG5,	nBb5,	nFs5,	nA5,	nG5,	nB5,	nF5,	nBb5
	dc.b		nFs5,	nA5,	nG5,	nB5,	nF5,	nBb5,	nFs5,	nA5
	dc.b		nF5
	smpsJump	music8A_Jump01

; FM3 Data
music8A_FM3:
	smpsFMvoice	$02
	smpsModSet	$08,	$01,	$05,	$04
music8A_Loop02:
	dc.b		nRst,	$30
music8A_Loop01:
	dc.b		nRst,	$08,	nEb6,	$02,	nCs6,	nA5,	nRst,	nEb6
	dc.b		nCs6,	nA5,	nRst
	smpsLoop	$01,	$02,	music8A_Loop01
	smpsLoop	$00,	$02,	music8A_Loop02
	smpsCall	music8A_Call01
	dc.b		nA4,	$10,	nB4,	$08,	nCs5,	$10,	nA4,	$08
	dc.b		nE5,	$0C,	nFs5,	$04,	nE5,	$08,	nCs5,	$10
	dc.b		nA4,	$08,	nA5,	$10,	nFs5,	$04,	nA5,	nFs5
	dc.b		$10,	nE5,	$04,	nFs5,	nE5,	$18,	nFs5,	$10
	dc.b		nCs5,	$08,	nA4,	$10,	nB4,	$08,	nCs5,	$10
	dc.b		nA4,	$08,	nE5,	$0C,	nFs5,	$04,	nE5,	$08
	dc.b		nCs5,	$10,	nA4,	$08,	nA5,	$60
music8A_Loop03:
	dc.b		nE6,	$04,	nD6,	nCs6,	$10
	smpsLoop	$00,	$03,	music8A_Loop03
	dc.b		nE6,	$04,	nD6,	nCs6,	$08,	nA5,	nCs6,	$30
	dc.b		nRst
	smpsJump	music8A_FM3

music8A_Call01:
	smpsFMvoice	$03
	dc.b		nA4,	$10,	nB4,	$08,	nCs5,	$10,	nA4,	$08
	dc.b		nE5,	$0C,	nFs5,	$04,	nE5,	$08,	nCs5,	$10
	dc.b		nA4,	$08,	nA5,	$18,	nFs5,	nE5,	nCs5,	nA4
	dc.b		$10,	nB4,	$08,	nCs5,	$10,	nA4,	$08,	nE5
	dc.b		$0C,	nFs5,	$04,	nE5,	$08,	nCs5,	$10,	nA4
	dc.b		$08,	nA5,	$20,	nFs5,	$08,	nAb5,	nA5,	$30
	smpsReturn

; FM4 Data
music8A_FM4:
	smpsFMvoice	$02
	smpsModSet	$08,	$01,	$05,	$04
music8A_Loop05:
	smpsAlterNote	$02
	dc.b		nRst,	$30
music8A_Loop04:
	dc.b		nRst,	$08,	nEb6,	$02,	nCs6,	nA5,	nRst,	nEb6
	dc.b		nCs6,	nA5,	nRst
	smpsLoop	$01,	$02,	music8A_Loop04
	smpsLoop	$00,	$02,	music8A_Loop05
	smpsCall	music8A_Call01
	dc.b		nCs5,	$10,	nD5,	$08,	nE5,	$10,	nCs5,	$08
	dc.b		nAb5,	$0C,	nA5,	$04,	nAb5,	$08,	nE5,	$10
	dc.b		nCs5,	$08,	nCs6,	$10,	nA5,	$04,	nCs6,	nA5
	dc.b		$10,	nAb5,	$04,	nA5,	nAb5,	$18,	nA5,	$10
	dc.b		nE5,	$08,	nCs5,	$10,	nD5,	$08,	nE5,	$10
	dc.b		nCs5,	$08,	nAb5,	$0C,	nA5,	$04,	nAb5,	$08
	dc.b		nE5,	$10,	nCs5,	$08,	nCs6,	$60
music8A_Loop06:
	dc.b		nCs6,	$04,	nB5,	nA5,	$10
	smpsLoop	$00,	$03,	music8A_Loop06
	dc.b		nCs6,	$04,	nB5,	nA5,	$08,	nFs5,	nA5,	$30
	dc.b		nRst
	smpsJump	music8A_Loop05

; FM5 Data
music8A_FM5:
	smpsFMvoice	$05
	smpsNoteFill	$00
	smpsAlterVol	$0C
	dc.b		nA2,	$30
	smpsModSet	$10,	$01,	$FF,	$FF
	dc.b		smpsNoAttack,	$30,	smpsNoAttack
	smpsModSet	$00,	$01,	$10,	$FF
	dc.b		nG2,	$08,	smpsModOff,	nC3,	$40
	smpsModSet	$10,	$01,	$FE,	$FF
	dc.b		smpsNoAttack,	$18
	smpsAlterVol	$F4
	smpsFMvoice	$04
	smpsNoteFill	$09
music8A_Loop07:
	dc.b		nA2,	$04,	nRst,	$28,	nAb2,	$04,	nA2,	nA2
	dc.b		$02,	nRst,	$2A,	nA2,	$04,	nRst,	$28,	nAb2
	dc.b		$04,	nA2,	nA2,	nRst,	$18,	nA4,	$04,	nB4
	dc.b		nC5,	nCs5
	smpsLoop	$00,	$04,	music8A_Loop07
music8A_Loop08:
	dc.b		nA2,	$04,	nRst,	nA4,	nA4,	nFs4,	nA4
	smpsLoop	$00,	$04,	music8A_Loop08
	dc.b		nA2,	$04,	nRst,	$28,	nAb2,	$04,	nA2,	nA2
	dc.b		nA4,	nB4,	nC5,	nCs5,	nRst,	$08,	nA4,	$04
	dc.b		nB4,	nC5,	nCs5
	smpsJump	music8A_FM5

; FM2 Data
music8A_FM2:
	smpsFMvoice	$01
	smpsNoteFill	$0A
music8A_Jump02:
	dc.b		nA1,	$04,	nA2,	nA2,	nA1,	nG2,	nA1,	nFs2
	dc.b		nA1,	nF2,	nF2,	nA1,	nE2,	nA1,	$02,	nRst
	dc.b		$2E,	nA1,	$04,	nA2,	nA2,	nA1,	nG2,	nA1
	dc.b		nFs2,	nA1,	nC3,	nC3,	nA1,	nC3,	nA1,	$02
	dc.b		nRst,	$2E
	smpsJump	music8A_Jump02

; PSG2 Data
music8A_PSG2:
	smpsAlterNote	$FE

; PSG1 Data
music8A_PSG1:
	dc.b		nRst,	$18
	smpsLoop	$00,	$18,	music8A_PSG1
music8A_Loop09:
	smpsModSet	$06,	$02,	$FE,	$FF
	dc.b		nG2,	$18,	smpsModOff,	nA2,	$30
	smpsModSet	$06,	$01,	$01,	$FF
	dc.b		smpsNoAttack,	$18
	smpsModSet	$00,	$01,	$FA,	$FF
	dc.b		nG2,	$08,	smpsModOff,	nC3,	$40
	smpsModSet	$00,	$01,	$01,	$FF
	dc.b		smpsNoAttack,	$18
	smpsLoop	$00,	$02,	music8A_Loop09
music8A_Loop0A:
	smpsModSet	$00,	$01,	$FD,	$FF
	dc.b		nG2,	$08,	smpsModOff,	nA2,	$10
	smpsModSet	$00,	$01,	$FC,	$FF
	dc.b		$08,	smpsModOff,	nC3,	$10
	smpsLoop	$00,	$02,	music8A_Loop0A
	smpsModSet	$00,	$01,	$FD,	$FF
	dc.b		nG2,	$08,	smpsModOff,	nA2,	$40
	smpsModSet	$06,	$01,	$01,	$FF
	dc.b		smpsNoAttack,	$18
	smpsJump	music8A_PSG1

; DAC Data
music8A_DAC:
	dc.b		nRst,	$30,	dSnare,	$04,	dKick,	dKick,	$10,	dSnare
	dc.b		$04,	dKick,	dKick,	$10,	nRst,	$30,	dSnare,	$04
	dc.b		dKick,	nRst,	dKick,	nRst,	dKick,	dKick,	dKick,	dSnare
	dc.b		$08,	dSnare,	dKick,	$08,	dSnare,	$04,	$04,	$08
	dc.b		dKick,	dSnare,	dSnare,	dKick,	dSnare,	$0C,	$04,	dKick
	dc.b		$08,	dSnare,	dSnare,	dKick,	dSnare,	$04,	$08,	$04
	dc.b		dKick,	$08,	dSnare,	dSnare,	dKick,	dSnare,	$04,	$08
	dc.b		$04,	dKick,	$08,	dSnare,	$04,	$04,	$08,	dKick
	dc.b		dSnare,	dSnare,	dKick,	dSnare,	$04,	$08,	$04,	dKick
	dc.b		$08,	dSnare,	dSnare,	dKick,	$08,	dSnare,	$04,	$04
	dc.b		$08,	dKick,	dSnare,	dSnare,	dKick,	dSnare,	$04,	$08
	dc.b		$04,	dKick,	$08,	dSnare,	dSnare,	dKick,	dSnare,	$04
	dc.b		dSnare,	dKick,	dSnare,	dKick,	$08,	dSnare,	dSnare,	dKick
	dc.b		dSnare,	$04,	$08,	$04,	dKick,	$08,	dSnare,	dSnare
	dc.b		dKick,	$08,	dSnare,	$04,	$04,	$08,	dKick,	dSnare
	dc.b		dSnare,	dKick,	dSnare,	$04,	$08,	$04,	dKick,	$08
	dc.b		dSnare,	dSnare,	dKick,	$04,	dKick,	dSnare,	dKick,	dSnare
	dc.b		dKick,	dKick,	$08,	dSnare,	dSnare,	dKick,	dSnare,	$04
	dc.b		$08,	$04,	dKick,	$08,	dSnare,	dSnare,	dKick,	dSnare
	dc.b		$04,	$04,	$08,	dKick,	dSnare,	dSnare,	dKick,	dSnare
	dc.b		$04,	$08,	$04,	dKick,	$08,	dSnare,	dSnare,	dSnare
	dc.b		$04,	dKick,	$08,	$04,	dSnare,	dKick,	dKick,	$08
	dc.b		dSnare,	dSnare,	dKick,	$08,	dSnare,	$04,	dSnare,	dSnare
	dc.b		dSnare,	dKick,	$08,	dSnare,	dSnare,	dKick,	$08,	dSnare
	dc.b		$04,	dSnare,	dSnare,	dSnare,	dKick,	$08,	dSnare,	dSnare
	dc.b		dKick,	$08,	dSnare,	$04,	$08,	$04,	dSnare,	$04
	dc.b		dKick,	$08,	$04,	dSnare,	dKick,	dSnare,	$04,	dKick
	dc.b		$08,	$04,	dSnare,	dKick
	smpsJump	music8A_DAC

; PSG3 Data
music8A_PSG3:
	smpsPSGform	$E7
music8A_Jump03:
	dc.b		nRst,	$08,	nA5,	nA5,	nRst,	$08,	nA5,	nA5
	dc.b		nRst,	$30,	nRst,	$08,	nA5,	nA5,	nRst,	$08
	dc.b		nA5,	nA5,	nRst,	$30
music8A_Loop0B:
	dc.b		nRst,	$18
	smpsLoop	$00,	$28,	music8A_Loop0B
	smpsJump	music8A_Jump03

music8A_Voices:
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
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	dc.b	$3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b	$0,$17,$9,$19,$19,$13,$c,$14,$80	; Voice 0 (Synth Brass)
	even
