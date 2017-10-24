	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	r2, #110
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	mov	r2, #1
	str	r2, [r3, #16]
	mov	r2, #4
	str	r2, [r3, #20]
	mov	r2, #25
	mov	r1, #153
	str	r2, [r3, #24]
	mov	r2, #13312	@ movhi
	str	r1, [r3, #0]
	str	r1, [r3, #8]
	strh	r2, [r3, #28]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBlocks
	.type	initBlocks, %function
initBlocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r2, .L16
	mov	r4, #5
	mov	r9, #10
	mov	sl, #40
	mov	fp, #1
	mov	r3, r1
	mov	r7, #48
	ldr	r6, .L16+4
	ldr	r8, .L16+8
	b	.L5
.L9:
	smull	ip, r0, r8, r1
	rsb	r5, r5, r0, asr #1
	add	r5, r5, r5, asl #2
	cmp	r1, r5
	addeq	r4, r4, #15
	add	r2, r2, #28
.L5:
	tst	r1, #1
	movne	r0, #0	@ movhi
	strneh	r0, [r2, #-8]	@ movhi
	mul	r0, r7, r1
	moveq	r5, #31	@ movhi
	add	r0, r0, #4
	streqh	r5, [r2, #-8]	@ movhi
	smull	r5, ip, r6, r0
	mov	r5, r0, asr #31
	add	ip, ip, r0
	rsb	ip, r5, ip, asr #7
	add	r1, r1, #1
	rsb	ip, ip, ip, asl #4
	sub	ip, r0, ip, asl #4
	cmp	r1, #15
	mov	r5, r1, asr #31
	str	r4, [r2, #-24]
	str	r9, [r2, #-16]
	str	sl, [r2, #-12]
	str	fp, [r2, #-4]
	str	r3, [r2, #0]
	str	ip, [r2, #-20]
	bne	.L9
	ldr	ip, .L16+12
	mov	r8, fp
	ldr	r1, [ip, #12]
	ldr	r2, .L16+16
	mov	r4, #50
	mov	r7, r3
	ldr	r6, .L16+4
	ldr	fp, .L16+8
	b	.L10
.L14:
	smull	r0, r1, fp, r3
	rsb	r5, r5, r1, asr #1
	add	r5, r5, r5, asl #2
	cmp	r3, r5
	ldr	r1, [ip, #40]
	addeq	r4, r4, #15
	add	r2, r2, #28
	add	ip, ip, #28
.L10:
	add	r1, r1, #8
	mul	r1, r3, r1
	ands	r0, r3, #1
	movne	r5, #31	@ movhi
	add	r1, r1, #4
	strneh	r5, [r2, #-8]	@ movhi
	streqh	r0, [r2, #-8]	@ movhi
	smull	r5, r0, r6, r1
	mov	r5, r1, asr #31
	add	r0, r0, r1
	rsb	r0, r5, r0, asr #7
	add	r3, r3, #1
	rsb	r0, r0, r0, asl #4
	sub	r0, r1, r0, asl #4
	cmp	r3, #15
	mov	r5, r3, asr #31
	str	r4, [r2, #-24]
	str	r9, [r2, #-16]
	str	sl, [r2, #-12]
	str	r8, [r2, #-4]
	str	r7, [r2, #0]
	str	r0, [r2, #-20]
	bne	.L14
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L17:
	.align	2
.L16:
	.word	blocks+24
	.word	-2004318071
	.word	1717986919
	.word	blocks
	.word	blocks2+24
	.size	initBlocks, .-initBlocks
	.align	2
	.global	initBall
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	ldmia	r3, {r1, r2}	@ phole ldm
	ldr	r3, .L19+4
	add	r2, r2, #5
	mov	ip, #10
	sub	r1, r1, #10
	mov	r0, #1
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	mov	r2, #0
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #0]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r2, [r3, #32]
	bx	lr
.L20:
	.align	2
.L19:
	.word	player
	.word	ball
	.size	initBall, .-initBall
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	bl	initPlayer
	bl	initBall
	bl	initBlocks
	ldr	r3, .L22
	mov	r2, #30
	str	r2, [r3, #0]
	ldr	r3, .L22+4
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	blocksRemaining
	.word	loseGame
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrne	r3, .L32
	bne	.L25
	ldr	r3, .L32
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	cmp	r1, r2
	bge	.L30
.L25:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L27
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	ldr	ip, [r3, #24]
	rsb	r0, r1, #240
	add	ip, r2, ip
	cmp	ip, r0
	ldr	r0, .L32
	ble	.L31
.L27:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L30:
	rsb	r2, r2, r1
	str	r2, [r3, #4]
	mvn	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L31:
	add	r2, r1, r2
	mov	r3, #1
	str	r2, [r0, #4]
	str	r3, [r0, #32]
	bx	lr
.L33:
	.align	2
.L32:
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBall
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L50
	sub	sp, sp, #16
	ldrh	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L35
	ldr	r2, .L50+4
	ldrh	r2, [r2, #0]
	tst	r2, #1
	bne	.L35
	ldr	r4, .L50+8
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L47
.L36:
	ldr	r3, [r4, #20]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [r4, #20]
.L34:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	ldr	r4, .L50+8
	ldr	r2, [r4, #32]
	cmp	r2, #0
	bne	.L38
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L39
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #4]
	add	r1, r2, #4
	cmp	r1, r3
	blt	.L48
.L39:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L34
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #28]
	rsb	r1, r2, #235
	add	r0, r3, r0
	cmp	r0, r1
	ldr	r1, .L50+8
	addle	r2, r2, r3
	strle	r3, [r1, #12]
	strle	r2, [r1, #4]
	b	.L34
.L38:
	cmp	r3, #0
	bne	.L49
.L40:
	ldr	r3, [r4, #0]
	ldr	ip, [r4, #16]
	ldr	r2, [r4, #4]
	add	r0, ip, r3
	ldr	r1, [r4, #20]
	cmp	r0, #1
	ldr	r5, .L50+8
	add	r1, r2, r1
	rsble	ip, ip, #0
	str	r2, [r4, #12]
	stmia	r4, {r0, r1, r3}	@ phole stm
	strle	ip, [r5, #16]
	ble	.L42
	ldr	r6, .L50+12
	ldr	r7, [r6, #0]
	ldr	ip, [r6, #20]
	ldr	lr, [r6, #4]
	ldr	r8, [r6, #24]
	sub	r7, r7, #2
	add	r2, r5, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #8]
	stmia	sp, {r7, lr}	@ phole stm
	str	r8, [sp, #12]
	ldr	ip, .L50+16
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r2, [r5, #16]
	ldrne	r3, [r6, #32]
	rsbne	r2, r2, #0
	strne	r2, [r5, #16]
	strne	r3, [r5, #20]
	ldmia	r5, {r0, r1}	@ phole ldm
.L42:
	cmp	r1, #1
	ble	.L44
	ldr	r3, [r4, #28]
	add	r1, r1, r3
	cmp	r1, #238
	bgt	.L44
.L45:
	cmp	r0, #150
	bne	.L34
	ldr	r3, .L50+20
	ldr	r2, [r3, #0]
	ldr	r1, .L50+24
	add	r2, r2, #1
	mov	r0, #1
	str	r0, [r1, #0]
	str	r2, [r3, #0]
	b	.L34
.L44:
	ldr	r3, [r4, #20]
	rsb	r3, r3, #0
	str	r3, [r4, #20]
	b	.L45
.L47:
	ldr	r3, .L50+12
	ldr	r2, [r4, #20]
	ldr	r3, [r3, #32]
	mul	r2, r3, r2
	ldr	r3, [r4, #16]
	mov	r1, #1
	rsb	r3, r3, #0
	str	r1, [r4, #32]
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	b	.L34
.L48:
	rsb	r2, r2, r3
	str	r3, [r4, #12]
	str	r2, [r4, #4]
	b	.L34
.L49:
	ldr	r3, .L50+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L40
	b	.L36
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	buttons
	.word	ball
	.word	player
	.word	collision
	.word	gamesLost
	.word	loseGame
	.size	updateBall, .-updateBall
	.align	2
	.global	updateBlock
	.type	updateBlock, %function
updateBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #20]
	cmp	r3, #0
	mov	r4, r0
	bne	.L54
.L52:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L54:
	ldr	r5, .L55
	ldr	ip, [r5, #28]
	ldr	r7, [r5, #0]
	ldr	r6, [r5, #4]
	ldr	lr, [r5, #24]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #12]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L55+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L52
	ldr	r3, .L55+8
	add	r0, r5, #16
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r3, #0]
	rsb	r1, r1, #0
	rsb	r0, r0, #0
	sub	r2, r2, #1
	mov	ip, #0
	str	ip, [r4, #20]
	str	r0, [r5, #16]
	str	r1, [r5, #20]
	str	r2, [r3, #0]
	b	.L52
.L56:
	.align	2
.L55:
	.word	ball
	.word	collision
	.word	blocksRemaining
	.size	updateBlock, .-updateBlock
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	updatePlayer
	bl	updateBall
	ldr	r7, .L60
	ldr	r6, .L60+4
	mov	r4, #0
.L58:
	rsb	r5, r4, r4, asl #3
	mov	r5, r5, asl #2
	add	r0, r7, r5
	bl	updateBlock
	add	r4, r4, #1
	add	r0, r6, r5
	bl	updateBlock
	cmp	r4, #15
	bne	.L58
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	blocks
	.word	blocks2
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L63
	mov	ip, #32512
	sub	sp, sp, #12
	add	ip, ip, #255
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r5, .L63+4
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldmia	r4, {r0, r1}	@ phole ldm
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r5
	ldmia	r4, {r2, r3}	@ phole ldm
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	ip, #32512
	ldr	r4, .L72
	sub	sp, sp, #12
	add	ip, ip, #255
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L72+4
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L66
.L67:
	cmp	r3, #0
	ble	.L69
	ldr	ip, .L72+8
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L72+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L65
.L69:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ldr	r5, .L72
	blt	.L71
.L70:
	cmp	r3, #0
	ble	.L65
	ldr	ip, .L72+16
	ldr	r0, [r4, #0]
	str	ip, [sp, #0]
	ldr	r1, [r4, #4]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	ip, .L72+12
	mov	lr, pc
	bx	ip
.L65:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L66:
	ldr	ip, .L72+20
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L72+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L65
	ldr	r3, .L72
	ldr	r3, [r3, #16]
	b	.L67
.L71:
	ldr	ip, .L72+24
	ldr	r3, [r5, #28]
	str	ip, [sp, #0]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #24]
	ldr	ip, .L72+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L65
	ldr	r3, [r5, #20]
	b	.L70
.L73:
	.align	2
.L72:
	.word	ball
	.word	drawRect
	.word	BallDownBitmap
	.word	drawImage
	.word	BallRightBitmap
	.word	BallUpBitmap
	.word	BallLeftBitmap
	.size	drawBall, .-drawBall
	.align	2
	.global	drawBlock
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	cmp	r3, #0
	mov	r4, r0
	bne	.L77
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L78
.L74:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L78:
	mov	ip, #32512
	add	ip, ip, #255
	ldr	r3, [r4, #12]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L79
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #24]
	b	.L74
.L77:
	ldrh	ip, [r4, #16]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L79
	mov	lr, pc
	bx	ip
	b	.L74
.L80:
	.align	2
.L79:
	.word	drawRect
	.size	drawBlock, .-drawBlock
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	drawPlayer
	bl	drawBall
	ldr	r7, .L84
	ldr	r6, .L84+4
	mov	r4, #0
.L82:
	rsb	r5, r4, r4, asl #3
	mov	r5, r5, asl #2
	add	r0, r7, r5
	bl	drawBlock
	add	r4, r4, #1
	add	r0, r6, r5
	bl	drawBlock
	cmp	r4, #15
	bne	.L82
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	blocks
	.word	blocks2
	.size	drawGame, .-drawGame
	.comm	player,36,4
	.comm	ball,36,4
	.comm	blocks,420,4
	.comm	blocks2,420,4
	.comm	blocksRemaining,4,4
	.comm	loseGame,4,4
	.comm	gamesLost,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
