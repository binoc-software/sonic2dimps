; =============================================================================================
; Project Name:		music81
; Created:		17th July 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

music81_Header:
	smpsHeaderVoice	music81_Voices
	smpsHeaderChan	$06,	$03
	smpsHeaderTempo	$02,	$05

	smpsHeaderDAC	music81_DAC
	smpsHeaderFM	music81_FM1,	smpsPitch01lo,	$10
	smpsHeaderFM	music81_FM2,	smpsPitch01lo,	$0C
	smpsHeaderFM	music81_FM3,	smpsPitch01lo,	$19
	smpsHeaderFM	music81_FM4,	smpsPitch01lo,	$11
	smpsHeaderFM	music81_FM5,	smpsPitch01lo,	$10
	smpsHeaderPSG	music81_PSG1,	smpsPitch04lo,	$01,	$00
	smpsHeaderPSG	music81_PSG2,	smpsPitch04lo,	$01,	$00
	smpsHeaderPSG	music81_PSG3,	smpsPitch04lo,	$01,	$00

; FM1 Data
music81_FM1:
	smpsFMvoice	$04
	smpsModSet	$02,	$01,	$01,	$01
	smpsPan		panRight,	$00
	smpsAlterVol	$03
	dc.b		nRst,	$02
	smpsCall	music81_Call01
	dc.b		nD6,	$16
	smpsAlterVol	$FD
	smpsFMvoice	$05
	smpsPan		panRight,	$00
	smpsAlterVol	$FB
	smpsCall	music81_Call02
	smpsCall	music81_Call02
	smpsAlterVol	$05
	smpsPan		panCentre,	$00
	smpsFMvoice	$01
	smpsCall	music81_Call03
	dc.b		nRst,	$18,	nD5,	$03,	nB4,	nRst,	nD5,	nRst
	dc.b		$0C,	nRst,	$18,	nCs5,	$03,	nCs5,	nRst,	nCs5
	dc.b		nA4,	$06,	nCs5
	smpsCall	music81_Call03
	dc.b		nRst,	$0C,	nB4,	nRst,	nCs5,	nRst,	nD5,	nRst
	dc.b		nE5,	nRst,	$18,	nD6,	$0C,	nCs6
	smpsJump	music81_FM1

music81_Call01:
	smpsCall	music81_Call04
	dc.b		nA6,	$06,	nB6,	nA6,	$18
	smpsCall	music81_Call04
	dc.b		nFs6,	$06,	nE6
	smpsReturn

music81_Call04:
	dc.b		nB6,	$0C,	nCs7,	$06,	nD7,	nA6,	$0C,	nFs6
	dc.b		$06,	nD6,	nG6,	$0C
	smpsReturn

music81_Call02:
	smpsCall	music81_Call05
	dc.b		nE6,	nRst,	nE6,	nRst,	nFs6,	nFs6,	nRst,	nD6
	dc.b		nRst,	$18
	smpsCall	music81_Call05
	dc.b		nRst,	$03,	nG6,	nRst,	nFs6,	nE6,	nRst,	nD6
	dc.b		nD6,	nRst,	$18
	smpsReturn

music81_Call05:
	dc.b		nE6,	$03,	nRst,	nE6,	nRst,	nFs6,	nFs6,	nRst
	dc.b		nD6,	nRst,	nD6,	nRst,	nA5,	nB5,	$06,	nD6
	dc.b		$03,	nRst
	smpsReturn

music81_Call03:
	dc.b		nRst,	$18,	nD5,	$03,	nB4,	nRst,	nD5,	nRst
	dc.b		$0C,	nRst,	$18,	nCs5,	$03,	nA4,	nRst,	nCs5
	dc.b		nRst,	$0C
	smpsReturn

; FM2 Data
music81_FM2:
	smpsFMvoice	$00
music81_Loop01:
	dc.b		nD3,	$06,	nD4,	$03,	$03,	nD3,	$06,	nD4
	smpsLoop	$00,	$18,	music81_Loop01
	smpsCall	music81_Call06
music81_Loop02:
	dc.b		nE3,	nE4,	$03,	$03,	nE3,	$06,	nE4
	smpsLoop	$00,	$02,	music81_Loop02
music81_Loop03:
	dc.b		nFs3,	nFs4,	$03,	$03,	nFs3,	$06,	nFs4
	smpsLoop	$00,	$02,	music81_Loop03
	smpsCall	music81_Call06
	dc.b		nE3,	nE4,	$03,	$03,	nE3,	$06,	nE4,	nFs3
	dc.b		nFs4,	$03,	$03,	nFs3,	$06,	nFs4,	nG3,	nG4
	dc.b		$03,	$03,	nG3,	$06,	nG4,	nA3,	nA4,	$03
	dc.b		$03,	nA3,	$06,	nA4,	nA3,	nA4,	nA3,	nA4
	dc.b		nA3,	$0C,	$0C
	smpsJump	music81_Loop01

music81_Call06:
	dc.b		nG3,	nG4,	$03,	$03,	nG3,	$06,	nG4
	smpsLoop	$01,	$02,	music81_Call06
music81_Loop04:
	dc.b		nFs3,	nFs4,	$03,	$03,	nFs3,	$06,	nFs4
	smpsLoop	$01,	$02,	music81_Loop04
	smpsReturn

; FM3 Data
music81_FM3:
	smpsFMvoice	$02
	smpsCall	music81_Call07
	smpsAlterVol	$F9
	dc.b		nRst,	$1E,	nA4,	$03,	nB4,	nD5,	nRst,	$09
	dc.b		nRst,	$1E,	nE5,	$03,	nFs5,	nD5,	nRst,	$09
	dc.b		nRst,	$1E,	nA4,	$03,	nB4,	nD5,	nRst,	$09
	dc.b		nRst,	$18,	nFs5,	$03,	nFs5,	nRst,	nFs5,	nE5
	dc.b		$06,	nD5,	nRst,	$1E,	nA4,	$03,	nB4,	nD5
	dc.b		nRst,	$09,	nRst,	$1E,	nFs5,	$06,	nD5,	$03
	dc.b		nRst,	$09,	nRst,	$1E,	nA4,	$03,	nB4,	nD5
	dc.b		nRst,	$09,	nRst,	$18,	nG5,	$03,	nFs5,	nG5
	dc.b		nAb5,	nA5,	nRst,	nD6,	nRst
	smpsAlterVol	$07
	smpsFMvoice	$01
	smpsAlterVol	$F2
	smpsPan		panRight,	$00
	smpsCall	music81_Call08
	smpsPan		panCentre,	$00
	smpsAlterVol	$0E
	smpsJump	music81_FM3

music81_Call08:
	dc.b		nD6,	$1E,	nB5,	$03,	nCs6,	nD6,	$06,	nB5
	dc.b		$03,	nRst,	nCs6,	$1B,	nA5,	$03,	nRst,	nB5
	dc.b		nCs6,	$06,	nA5,	nB5,	$1E,	nA5,	$03,	nRst
	dc.b		nB5,	$06,	nA5,	nCs6,	$0C,	nB5,	$06,	nA5
	dc.b		$12,	nB5,	$06,	nCs6,	nD6,	$1E,	nB5,	$03
	dc.b		nCs6,	nD6,	nRst,	nB5,	$06,	nCs6,	$1E,	nA5
	dc.b		$03,	nB5,	nCs6,	nRst,	nA5,	$06,	nB5,	$12
	dc.b		nA5,	$03,	nB5,	nCs6,	$12,	nB5,	$03,	nCs6
	dc.b		nD6,	$12,	nCs6,	$03,	nD6,	nE6,	$30,	nFs6
	dc.b		$0C,	nE6
	smpsReturn

music81_Call07:
	dc.b		nRst,	$1E,	nA4,	$03,	nB4,	nD5,	nRst,	$09
	dc.b		nRst,	$1E,	nE5,	$03,	nFs5,	nD5,	nRst,	$09
	dc.b		nRst,	$1E,	nA4,	$03,	nB4,	nD5,	nRst,	$09
	dc.b		nRst,	$18,	nG5,	$03,	nFs5,	nG5,	nAb5,	nA5
	dc.b		nD5,	nRst,	nD5,	$03
	smpsReturn

; FM4 Data
music81_FM4:
	smpsFMvoice	$03
	smpsModSet	$02,	$01,	$01,	$01
music81_Jump01:
	smpsPan		panLeft,	$00
	smpsAlterVol	$02
	smpsCall	music81_Call01
	dc.b		nD6,	$18
	smpsPan		panCentre,	$00
	smpsAlterVol	$FE
	dc.b		nRst,	$30,	nRst,	nRst,	nRst,	$2A
	smpsAlterVol	$03
	dc.b		nB5,	$03,	nCs6,	nD6,	$18,	nCs6,	nB5,	nA5
	dc.b		nG5,	nFs5,	nRst,	$03,	nB5,	$03,	nRst,	nA5
	dc.b		nG5,	nRst,	nFs5,	nFs5,	nRst,	$18
	smpsAlterVol	$FD
	smpsAlterVol	$03
music81_Loop05:
	dc.b		nA6,	$03,	nG6,	nFs6,	nE6
	smpsLoop	$00,	$18,	music81_Loop05
	smpsAlterVol	$FD
	dc.b		nRst,	$0C,	nD6,	nRst,	nE6,	nRst,	nFs6,	nRst
	dc.b		nG6,	$18,	nRst,	$24
	smpsJump	music81_Jump01

; FM5 Data
music81_FM5:
	smpsFMvoice	$01
	smpsAlterVol	$FE
	smpsAlterNote	$02
	smpsCall	music81_Call07
	smpsAlterVol	$02
	smpsFMvoice	$01
	smpsPan		panLeft,	$00
	smpsAlterVol	$FB
	smpsCall	music81_Call02
	smpsCall	music81_Call02
	smpsAlterVol	$05
	smpsAlterPitch	$F4
	smpsAlterVol	$FB
	smpsCall	music81_Call08
	smpsAlterPitch	$0C
	smpsAlterVol	$05
	smpsPan		panCentre,	$00
	smpsJump	music81_FM5

; PSG1 Data
music81_PSG1:
	smpsPSGvoice	$04
	smpsNoteFill	$0A
music81_Jump02:
	smpsCall	music81_Call09
	smpsSetVol	$01
	smpsCall	music81_Call09
	smpsCall	music81_Call09
	smpsCall	music81_Call0A
	dc.b		nRst,	$03,	nB5,	$06,	$03,	$06,	nG5,	$09
	dc.b		nB5,	$06,	$03,	$06,	nG5,	nRst,	$03,	nCs6
	dc.b		$06,	$03,	$06,	nA5,	$09,	nCs6,	$06,	$09
	dc.b		nA5,	$06
	smpsCall	music81_Call0A
	smpsCall	music81_Call0B
	dc.b		nCs6,	$03,	nE6,	$0C,	$24
	smpsSetVol	$FF
	smpsJump	music81_Jump02

music81_Call0B:
	dc.b		nB5,	$03,	nG5,	nB5,	nG5,	nB5,	nG5,	nB5
	dc.b		nG5,	nCs6,	nA5,	nCs6,	nA5,	nCs6,	nA5,	nCs6
	dc.b		nA5,	nD6,	nB5,	nD6,	nB5,	nD6,	nB5,	nD6
	dc.b		nB5,	nE6,	nCs6,	nE6,	nCs6,	nE6,	nCs6,	nE6
	smpsReturn

music81_Call09:
	dc.b		nB5,	$09,	$09,	nA5,	$1E,	nG5,	$09,	$09
	dc.b		nA5,	$1E,	nB5,	$09,	$09,	nA5,	$1E,	nG5
	dc.b		$09,	nA5,	nFs5,	$1E
	smpsReturn

music81_Call0A:
	dc.b		nRst,	$03,	nD6,	$06,	$03,	$06,	nB5,	$09
	dc.b		nD6,	$06,	$03,	$06,	nB5,	nRst,	$03,	nCs6
	dc.b		$06,	$03,	$06,	nA5,	$09,	nCs6,	$06,	$03
	dc.b		$06,	nA5
	smpsReturn

; PSG2 Data
music81_PSG2:
	smpsPSGvoice	$04
	smpsNoteFill	$0A
music81_Jump03:
	smpsCall	music81_Call0C
	smpsSetVol	$01
	smpsCall	music81_Call0C
	smpsCall	music81_Call0C
	smpsCall	music81_Call0D
	dc.b		nRst,	$03,	nG5,	$06,	$03,	$06,	nE5,	$09
	dc.b		nG5,	$06,	$03,	$06,	nE5,	nRst,	$03,	nA5
	dc.b		$06,	$03,	$06,	nFs5,	$09,	nA5,	$06,	$09
	dc.b		nFs5,	$06
	smpsCall	music81_Call0D
	dc.b		nRst,	$01
	smpsCall	music81_Call0B
	dc.b		nCs6,	$02,	nCs6,	$0C,	$24
	smpsSetVol	$FF
	smpsJump	music81_Jump03

music81_Call0C:
	dc.b		nG5,	$09,	$09,	nFs5,	$1E,	nE5,	$09,	$09
	dc.b		nFs5,	$1E,	nG5,	$09,	$09,	nFs5,	$1E,	nE5
	dc.b		$09,	nFs5,	nD5,	$1E
	smpsReturn

music81_Call0D:
	dc.b		nRst,	$03,	nB5,	$06,	$03,	$06,	nG5,	$09
	dc.b		nB5,	$06,	$03,	$06,	nG5,	nRst,	$03,	nA5
	dc.b		$06,	$03,	$06,	nFs5,	$09,	nA5,	$06,	$03
	dc.b		nCs6,	$06,	nFs5
	smpsReturn

; PSG3 Data
music81_PSG3:
	smpsPSGvoice	$02
	smpsNoteFill	$04
music81_Jump04:
	dc.b		nF6,	$06,	nD6,	$03,	$03,	nF6,	nRst,	nD6
	dc.b		nRst
	smpsJump	music81_Jump04

; DAC Data
music81_DAC:
	dc.b		dKick,	$06,	nRst,	$03,	dKick,	dKick,	$06,	$8C
	dc.b		dKick,	$06,	nRst,	$03,	dKick,	dKick,	$06,	$8C
	dc.b		dKick,	$06,	nRst,	$03,	dKick,	dKick,	$06,	$8C
	dc.b		dKick,	$03,	$06,	$03,	$06,	$8C,	$06
	smpsLoop	$00,	$0A,	music81_DAC
	dc.b		dKick,	$06,	$8C,	$06,	$06,	$06,	$0C,	$0C
	smpsJump	music81_DAC

music81_Voices:
	dc.b	$3b,$0,$0,$30,$0,$9f,$9f,$db,$9f,$c,$0,$0,$0,$5,$6,$10
	dc.b	$7,$6f,$f,$f,$f,$1b,$1b,$13,$80
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	dc.b $3d,$1,$1,$3,$1,$50,$52,$58,$59,$f,$2,$2,$2,$4,$0,$0
	dc.b $0,$17,$9,$19,$19,$13,$c,$14,$80 ; Voice 0 (Synth Brass)
	even
