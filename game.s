	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #20
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #152
	mov	r5, #117
	mov	r4, #3
	mov	lr, #7
	mov	r7, #31744
	mov	ip, #1
	mov	r0, #31
	mov	r1, #5
	ldr	r8, .L8
	str	r3, [r8]
	ldr	r8, .L8+4
	str	r3, [r8]
	ldr	r8, .L8+8
	str	r3, [r8]
	ldr	r3, .L8+12
	str	r2, [r3]
	ldr	r2, .L8+16
	ldr	r3, .L8+20
	str	r6, [r2, #4]
	str	r6, [r2, #12]
	strh	r7, [r2, #24]	@ movhi
	str	r5, [r2]
	str	r5, [r2, #8]
	str	r4, [r2, #28]
	str	r4, [r2, #36]
	str	lr, [r2, #20]
	str	lr, [r2, #16]
	add	r2, r3, #800
.L2:
	str	ip, [r3, #36]
	strh	r0, [r3, #24]	@ movhi
	str	r1, [r3, #16]
	add	r3, r3, #40
	cmp	r3, r2
	bne	.L2
	mvn	r0, #1
	mov	r1, #7
	ldr	r3, .L8+24
	add	r2, r3, #2400
.L3:
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	score
	.word	generate_count
	.word	bullet_count
	.word	enemy_count
	.word	player
	.word	enemies
	.word	bullets
	.size	initGame, .-initGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #152
	mov	lr, #31744
	mov	r0, #117
	mov	r1, #3
	mov	r2, #7
	ldr	r3, .L12
	strh	lr, [r3, #24]	@ movhi
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #28]
	str	r1, [r3, #36]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	ldr	lr, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #1
	mov	r0, #31
	mov	r1, #5
	ldr	r3, .L18
	add	r2, r3, #800
.L15:
	str	ip, [r3, #36]
	strh	r0, [r3, #24]	@ movhi
	str	r1, [r3, #16]
	add	r3, r3, #40
	cmp	r3, r2
	bne	.L15
	bx	lr
.L19:
	.align	2
.L18:
	.word	enemies
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r0, #1
	mov	r1, #7
	ldr	r3, .L24
	add	r2, r3, #2400
.L21:
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L21
	bx	lr
.L25:
	.align	2
.L24:
	.word	bullets
	.size	initBullet, .-initBullet
	.align	2
	.global	generate_enemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	generate_enemies, %function
generate_enemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #3
	mov	r8, #2
	ldr	r10, .L35
	ldr	r6, .L35+4
.L27:
	mov	r4, #0
	ldr	r3, .L35
	b	.L31
.L28:
	add	r4, r4, #1
	cmp	r4, #20
	add	r3, r3, #40
	beq	.L30
.L31:
	ldr	r5, [r3, #36]
	cmp	r5, #1
	bne	.L28
	add	r7, r4, r4, lsl #2
	add	fp, r10, r7, lsl #3
	str	r8, [fp, #36]
	mov	lr, pc
	bx	r6
	mov	r1, #0
	ldr	ip, .L35+8
	smull	r3, ip, r0, ip
	asr	r3, r0, #31
	add	ip, ip, r0
	rsb	r3, r3, ip, asr #7
	add	ip, r3, r3, lsl #1
	rsb	r3, r3, ip, lsl #4
	add	r3, r3, r3, lsl #2
	str	r1, [fp, #4]
	sub	r3, r0, r3
	str	r3, [r10, r7, lsl #3]
	mov	lr, pc
	bx	r6
	subs	r3, r0, #0
	and	r3, r3, #1
	rsblt	r3, r3, #0
	add	r3, r3, #1
	str	r3, [fp, #28]
	str	r5, [fp, #32]
	mov	lr, pc
	bx	r6
	tst	r0, #1
	ldreq	r2, [fp, #28]
	lsl	r3, r4, #2
	add	r4, r3, r4
	add	r3, r10, r4, lsl #3
	rsbeq	r2, r2, #0
	streq	r2, [fp, #28]
	ldr	r1, [r10, r4, lsl #3]
	ldr	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
.L30:
	subs	r9, r9, #1
	bne	.L27
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	enemies
	.word	rand
	.word	-1955580853
	.size	generate_enemies, .-generate_enemies
	.align	2
	.global	generate_bullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	generate_bullet, %function
generate_bullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	mov	r2, #0
	mov	r1, r3
.L39:
	ldr	r0, [r1, #20]
	cmp	r0, #6
	beq	.L46
	push	{r4, r5, lr}
	mov	ip, #67108864
	mov	r5, #6
	mvn	r4, #1
	mov	lr, #20992
	ldr	r0, .L47+4
	ldr	r1, [r0]
	add	r2, r2, r2, lsl #1
	ldr	r0, [r0, #4]
	add	r1, r1, #2
	str	r1, [r3, r2, lsl #3]
	add	r3, r3, r2, lsl #3
	ldr	r2, .L47+8
	sub	r0, r0, #1
	str	r5, [r3, #20]
	str	r4, [r3, #16]
	stmib	r3, {r0, r1}
	strh	lr, [ip, #104]	@ movhi
	strh	r2, [ip, #108]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L46:
	add	r2, r2, #1
	cmp	r2, #100
	add	r1, r1, #24
	bne	.L39
	bx	lr
.L48:
	.align	2
.L47:
	.word	bullets
	.word	player
	.word	-30804
	.size	generate_bullet, .-generate_bullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L60
	ldr	r2, .L60+4
	ldrh	r3, [r3]
	ldr	ip, [r2]
	lsr	r1, r3, #5
	eor	r1, r1, #1
	cmp	ip, #1
	movle	r1, #0
	andgt	r1, r1, #1
	push	{r4, lr}
	ldr	r4, .L60+8
	ldr	r0, [r4]
	ldr	lr, [r2, #4]
	cmp	r1, #0
	add	r1, r0, #1
	str	ip, [r2, #8]
	str	lr, [r2, #12]
	str	r1, [r4]
	bne	.L57
	tst	r3, #16
	beq	.L58
.L51:
	lsr	r3, r3, #6
	eor	r3, r3, #1
	cmp	r1, #20
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	bne	.L59
	pop	{r4, lr}
	bx	lr
.L58:
	ldr	r0, [r2, #16]
	add	r0, ip, r0
	cmp	r0, #238
	ldrle	r0, [r2, #28]
	addle	ip, r0, ip
	strle	ip, [r2]
	b	.L51
.L57:
	ldr	r0, [r2, #28]
	sub	ip, ip, r0
	str	ip, [r2]
	b	.L51
.L59:
	bl	generate_bullet
	mov	r3, #0
	str	r3, [r4]
	pop	{r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	buttons
	.word	player
	.word	bullet_count
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L94
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	strgt	r3, [r2]
	sub	sp, sp, #12
	ble	.L91
.L64:
	ldr	r6, .L94+4
	ldr	r5, .L94+8
	ldr	fp, .L94+12
	ldr	r9, .L94+16
	ldr	r8, .L94+20
	ldr	r10, .L94+24
.L74:
	ldr	r3, [r6, #36]
	cmp	r3, #1
	beq	.L66
	ldr	r1, [r6, #4]
	cmp	r1, #159
	movgt	r3, #1
	strgt	r3, [r6, #36]
	ldr	r3, [r6, #28]
	ldr	r0, [r6]
	rsb	r2, r3, #0
	cmp	r0, r2
	movle	r3, r2
	ldr	ip, [r6, #16]
	strle	r2, [r6, #28]
	add	ip, r0, ip
	rsb	r2, r3, #239
	cmp	ip, r2
	rsbge	r3, r3, #0
	strge	r3, [r6, #28]
	ldr	r2, [fp, #16]
	ldr	r3, [fp]
	rsb	r2, r2, #0
	sub	r3, r3, r0
	cmp	r3, #4
	cmple	r2, r3
	blt	.L92
.L70:
	ldr	r4, .L94+28
	b	.L72
.L71:
	add	r4, r4, #24
	cmp	r4, r5
	beq	.L93
.L72:
	ldr	r3, [r4, #20]
	cmp	r3, #7
	beq	.L71
	ldr	r3, [r4]
	sub	r3, r3, r0
	add	r3, r3, #1
	cmp	r3, #5
	bhi	.L71
	ldr	r3, [r4, #4]
	sub	r3, r3, r1
	add	r3, r3, #3
	cmp	r3, #7
	bhi	.L71
	mov	ip, #1
	mov	r3, #5
	mov	lr, #7
	mov	r7, #0
	ldr	r2, [r9]
	add	r2, r2, ip
	str	r7, [sp]
	str	r2, [r9]
	str	lr, [r4, #20]
	mov	r2, r3
	str	ip, [r6, #36]
	mov	lr, pc
	bx	r8
	str	r7, [sp]
	mov	r3, #4
	ldm	r4, {r0, r1}
	mov	r2, #2
	mov	lr, pc
	bx	r8
	mov	r3, #67108864
	mov	r2, #22272
	add	r4, r4, #24
	cmp	r4, r5
	ldr	r0, [r6]
	ldr	r1, [r6, #4]
	strh	r2, [r3, #104]	@ movhi
	strh	r10, [r3, #108]	@ movhi
	bne	.L72
.L93:
	ldr	r3, [r6, #28]
	ldr	ip, [r6, #16]
	add	r3, r0, r3
	add	lr, r3, ip
	ldr	r2, [r6, #32]
	cmp	lr, #238
	add	r2, r2, r1
	rsbgt	ip, ip, #239
	str	r3, [r6]
	str	r0, [r6, #8]
	str	r1, [r6, #12]
	str	r2, [r6, #4]
	strgt	ip, [r6]
.L66:
	ldr	r3, .L94+32
	add	r6, r6, #40
	cmp	r6, r3
	bne	.L74
	mov	r0, #7
	ldr	r3, .L94+28
.L77:
	ldr	r2, [r3, #20]
	cmp	r2, #6
	bne	.L75
	ldr	r2, [r3, #4]
	cmn	r2, #4
	sub	r1, r2, #2
	strlt	r0, [r3, #20]
	str	r2, [r3, #12]
	str	r1, [r3, #4]
.L75:
	add	r3, r3, #24
	cmp	r3, r5
	bne	.L77
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #20]
	sub	r3, r3, r1
	rsb	r2, r2, #0
	cmp	r3, #4
	cmple	r2, r3
	bge	.L70
	mov	r3, #5
	mov	r4, #0
	mov	ip, #1
	ldr	lr, [fp, #36]
	mov	r2, r3
	sub	lr, lr, #1
	str	r4, [sp]
	str	lr, [fp, #36]
	str	ip, [r6, #36]
	mov	lr, pc
	bx	r8
	mov	r3, #5
	ldr	r0, [fp, #36]
	lsl	r0, r0, #3
	mov	r1, #2
	add	r0, r0, #2
	mov	r2, r3
	str	r4, [sp]
	mov	lr, pc
	bx	r8
	ldm	r6, {r0, r1}
	b	.L70
.L91:
	mov	r3, #180
	str	r3, [r2]
	bl	generate_enemies
	b	.L64
.L95:
	.align	2
.L94:
	.word	generate_count
	.word	enemies
	.word	bullets+2400
	.word	player
	.word	score
	.word	drawRect
	.word	-31429
	.word	bullets
	.word	enemies+800
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	pop	{r4, lr}
	b	updateEnemy
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L110
	sub	sp, sp, #8
	str	r3, [sp]
	add	r0, r6, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r7, .L110+4
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	cmp	r3, #3
	beq	.L107
	cmp	r3, #2
	ldm	r6, {r0, r1}
	beq	.L108
.L100:
	cmp	r3, #1
	beq	.L109
.L101:
	mov	r4, #0
	mov	r3, #3
	mov	r2, #2
	str	r4, [sp]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	ldr	r0, [r6, #16]
	add	r0, r0, r3
	mov	r2, #2
	mov	r3, #3
	str	r4, [sp]
	ldr	r1, [r6, #4]
	sub	r0, r0, #2
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	cmp	r3, r4
	ble	.L98
	mov	r5, #2
	ldr	r8, .L110+8
.L102:
	mov	r3, #5
	mov	r0, r5
	mov	r2, r3
	mov	r1, #2
	str	r8, [sp]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #8
	bgt	.L102
.L98:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L107:
	mov	r2, #31744
	ldr	r3, [r6, #20]
	str	r2, [sp]
	ldm	r6, {r0, r1}
	ldr	r2, [r6, #16]
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	cmp	r3, #2
	ldm	r6, {r0, r1}
	bne	.L100
.L108:
	ldr	r3, .L110+12
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #36]
	cmp	r3, #1
	ldm	r6, {r0, r1}
	bne	.L101
.L109:
	ldr	r3, .L110+16
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r7
	ldm	r6, {r0, r1}
	b	.L101
.L111:
	.align	2
.L110:
	.word	player
	.word	drawRect
	.word	1023
	.word	31759
	.word	31775
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #0
	ldr	r4, .L126
	ldr	r5, .L126+4
	sub	sp, sp, #12
	add	r6, r4, #800
.L114:
	ldr	r3, [r4, #36]
	cmp	r3, #1
	beq	.L113
	mov	r3, #5
	str	r7, [sp]
	add	r0, r4, #8
	mov	r2, r3
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r3, #5
	ldrh	r1, [r4, #24]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
.L113:
	add	r4, r4, #40
	cmp	r4, r6
	bne	.L114
	mov	r7, #0
	ldr	r4, .L126+8
	ldr	r5, .L126+4
	add	r6, r4, #2400
.L116:
	ldr	r3, [r4, #20]
	cmp	r3, #7
	beq	.L115
	str	r7, [sp]
	add	r0, r4, #8
	mov	r3, #4
	mov	r2, #2
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	mov	r2, #992
	str	r2, [sp]
	mov	r3, #4
	mov	r2, #2
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
.L115:
	add	r4, r4, #24
	cmp	r4, r6
	bne	.L116
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	enemies
	.word	drawRect
	.word	bullets
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	pop	{r4, lr}
	b	drawBall
	.size	drawGame, .-drawGame
	.comm	bullet_count,4,4
	.comm	generate_count,4,4
	.comm	enemy_count,4,4
	.comm	spawned,4,4
	.comm	score,4,4
	.comm	bullets,2400,4
	.comm	enemies,800,4
	.comm	player,40,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
