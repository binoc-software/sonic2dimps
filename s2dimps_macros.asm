sonic_normal_top_speed macro
	move.w	#$600,(Sonic_top_speed).w
	endm
	
sonic_water_top_speed macro
	move.w	#$300,(Sonic_top_speed).w
	endm
	
sonic_shoes_top_speed macro
	move.w	#$C00,(Sonic_top_speed).w
	endm
	
sonic_super_top_speed macro
	move.w	#$A00,(Sonic_top_speed).w
	endm 
	
tails_normal_top_speed macro
	move.w	#$600,(Tails_top_speed).w
	endm
	
tails_water_top_speed macro
	move.w	#$300,(Tails_top_speed).w
	endm	
	
tails_shoes_top_speed macro
	move.w	#$C00,(Tails_top_speed).w
	endm	
	
sonicroll macro
	move.b	#2,anim(a0)	; use "rolling" animation	
	endm

	
bgm_speedshoesX macro
	btst	#1,status_secondary(a0)	; is Sonic invincible?
	bne.w	+			; if yes, branch
	move.b	#$97,d0
+	
	cmpi.w	#0,(Current_Zone).w
	bne.w	+
	move.b	#$82,d0
+	
	cmpi.w	#1,(Current_Zone).w
	bne.w	+
	move.b	#$82,d0
+	
	cmpi.w	#2,(Current_Zone).w
	bne.w	+
	move.b	#$85,d0
+	
	cmpi.w	#3,(Current_Zone).w
	bne.w	+
	move.b	#$84,d0
+	
	cmpi.w	#4,(Current_Zone).w
	bne.w	+
	move.b	#$85,d0
+	
	cmpi.w	#5,(Current_Zone).w
	bne.w	+
	move.b	#$85,d0	
+
	cmpi.w	#6,(Current_Zone).w
	bne.w	+
	move.b	#$8F,d0
+	
	cmpi.w	#7,(Current_Zone).w
	bne.w	+
	move.b	#$86,d0
+	
	cmpi.w	#8,(Current_Zone).w
	bne.w	+
	move.b	#$10,d0
+	
	cmpi.w	#9,(Current_Zone).w
	bne.w	+
	move.b	#$8D,d0
+	
	cmpi.w	#$A,(Current_Zone).w
	bne.w	+
	move.b	#$84,d0
+	
	cmpi.w	#$B,(Current_Zone).w
	bne.w	+
	move.b	#$8B,d0	
+	
	cmpi.w	#$C,(Current_Zone).w
	bne.w	+
	move.b	#$89,d0
+	
	cmpi.w	#$D,(Current_Zone).w
	bne.w	+
	move.b	#$8E,d0
+	
	cmpi.w	#$E,(Current_Zone).w
	bne.w	+
	move.b	#$8A,d0
+	
	cmpi.w	#$F,(Current_Zone).w
	bne.w	+
	move.b	#$87,d0
+	
	cmpi.w	#$10,(Current_Zone).w
	beq.s	+
+	
	move.b	#$8D,d0
	endm 	
	
