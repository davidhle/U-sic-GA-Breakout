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
	mov	r1, #156
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
	mov	r2, #0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r3, .L11
	mov	ip, #5
	mov	r9, #10
	mov	sl, #40
	mov	r8, #1
	mov	r7, r2
	mov	r6, #48
	ldr	r5, .L11+4
	ldr	fp, .L11+8
	b	.L5
.L9:
	smull	r0, r1, fp, r2
	rsb	r4, r4, r1, asr #1
	add	r4, r4, r4, asl #2
	cmp	r2, r4
	addeq	ip, ip, #15
	add	r3, r3, #28
.L5:
	tst	r2, #1
	movne	r1, #0	@ movhi
	strneh	r1, [r3, #-8]	@ movhi
	mul	r1, r6, r2
	moveq	r4, #31	@ movhi
	add	r1, r1, #4
	streqh	r4, [r3, #-8]	@ movhi
	smull	r4, r0, r5, r1
	mov	r4, r1, asr #31
	add	r0, r0, r1
	rsb	r0, r4, r0, asr #7
	add	r2, r2, #1
	rsb	r0, r0, r0, asl #4
	sub	r0, r1, r0, asl #4
	cmp	r2, #15
	mov	r4, r2, asr #31
	str	ip, [r3, #-24]
	str	r9, [r3, #-16]
	str	sl, [r3, #-12]
	str	r8, [r3, #-4]
	str	r7, [r3, #0]
	str	r0, [r3, #-20]
	bne	.L9
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L12:
	.align	2
.L11:
	.word	blocks+24
	.word	-2004318071
	.word	1717986919
	.size	initBlocks, .-initBlocks
	.align	2
	.global	initBall
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldmia	r3, {r1, r2}	@ phole ldm
	ldr	r3, .L14+4
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
.L15:
	.align	2
.L14:
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
	ldr	r3, .L17
	mov	r2, #15
	str	r2, [r3, #0]
	ldr	r3, .L17+4
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
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
	ldrne	r3, .L27
	bne	.L20
	ldr	r3, .L27
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	cmp	r1, r2
	bge	.L25
.L20:
	mov	r2, #67108864
	add	r2, r2, #256
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L22
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	ldr	ip, [r3, #24]
	rsb	r0, r1, #240
	add	ip, r2, ip
	cmp	ip, r0
	ldr	r0, .L27
	ble	.L26
.L22:
	mov	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L25:
	rsb	r2, r2, r1
	str	r2, [r3, #4]
	mvn	r2, #0
	str	r2, [r3, #32]
	bx	lr
.L26:
	add	r2, r1, r2
	mov	r3, #1
	str	r2, [r0, #4]
	str	r3, [r0, #32]
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r3, .L42
	sub	sp, sp, #16
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L30
	ldr	r3, .L42+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L30
	ldr	r4, .L42+8
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L40
.L31:
	ldr	r3, [r4, #0]
	ldr	ip, [r4, #16]
	ldr	r2, [r4, #4]
	add	r0, ip, r3
	ldr	r1, [r4, #20]
	cmp	r0, #1
	ldr	r5, .L42+8
	add	r1, r2, r1
	rsble	ip, ip, #0
	str	r2, [r4, #12]
	stmia	r4, {r0, r1, r3}	@ phole stm
	strle	ip, [r5, #16]
	ble	.L35
	ldr	r6, .L42+12
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
	ldr	ip, .L42+16
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r2, [r5, #16]
	ldrne	r3, [r6, #32]
	rsbne	r2, r2, #0
	strne	r2, [r5, #16]
	strne	r3, [r5, #20]
	ldmia	r5, {r0, r1}	@ phole ldm
.L35:
	cmp	r1, #1
	ble	.L37
	ldr	r3, [r4, #28]
	add	r1, r1, r3
	cmp	r1, #238
	bgt	.L37
.L38:
	cmp	r0, #150
	ldreq	r3, .L42+20
	moveq	r2, #1
	streq	r2, [r3, #0]
.L29:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L30:
	ldr	r4, .L42+8
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L31
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L33
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #4]
	add	r1, r2, #4
	cmp	r1, r3
	blt	.L41
.L33:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L29
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #28]
	rsb	r1, r2, #235
	add	r0, r3, r0
	cmp	r0, r1
	ldr	r1, .L42+8
	addle	r2, r2, r3
	strle	r3, [r1, #12]
	strle	r2, [r1, #4]
	b	.L29
.L37:
	ldr	r3, [r4, #20]
	rsb	r3, r3, #0
	str	r3, [r4, #20]
	b	.L38
.L40:
	ldr	r3, .L42+12
	ldr	r2, [r4, #20]
	ldr	r3, [r3, #32]
	mul	r2, r3, r2
	ldr	r3, [r4, #16]
	mov	r1, #1
	rsb	r3, r3, #0
	str	r1, [r4, #32]
	str	r2, [r4, #20]
	str	r3, [r4, #16]
	b	.L29
.L41:
	rsb	r2, r2, r3
	str	r3, [r4, #12]
	str	r2, [r4, #4]
	b	.L29
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	ball
	.word	player
	.word	collision
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
	bne	.L46
.L44:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L46:
	ldr	r5, .L47
	ldr	ip, [r5, #28]
	ldr	r7, [r5, #0]
	ldr	r6, [r5, #4]
	ldr	lr, [r5, #24]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #12]
	str	r7, [sp, #0]
	stmib	sp, {r6, lr}	@ phole stm
	ldr	ip, .L47+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L44
	ldr	r3, .L47+8
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
	b	.L44
.L48:
	.align	2
.L47:
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
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	bl	updateBall
	ldr	r5, .L52
	mov	r4, #0
.L50:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	updateBlock
	cmp	r4, #15
	bne	.L50
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	blocks
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L55
	mov	ip, #32512
	sub	sp, sp, #12
	add	ip, ip, #255
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	add	r2, r4, #20
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r5, .L55+4
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
.L56:
	.align	2
.L55:
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
	ldr	r4, .L64
	sub	sp, sp, #12
	add	ip, ip, #255
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	add	r0, r4, #8
	ldmia	r0, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L64+4
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L58
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L58
.L59:
	cmp	r3, #0
	ble	.L61
	ldr	ip, .L64+8
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L64+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L57
.L61:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ldr	r5, .L64
	blt	.L63
.L62:
	cmp	r3, #0
	ble	.L57
	ldr	ip, .L64+16
	ldr	r0, [r4, #0]
	str	ip, [sp, #0]
	ldr	r1, [r4, #4]
	add	r2, r4, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	ip, .L64+12
	mov	lr, pc
	bx	ip
.L57:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L58:
	ldr	ip, .L64+20
	ldr	r3, [r4, #28]
	str	ip, [sp, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	ldr	r2, [r4, #24]
	ldr	ip, .L64+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L57
	ldr	r3, .L64
	ldr	r3, [r3, #16]
	b	.L59
.L63:
	ldr	ip, .L64+24
	ldr	r3, [r5, #28]
	str	ip, [sp, #0]
	ldmia	r5, {r0, r1}	@ phole ldm
	ldr	r2, [r5, #24]
	ldr	ip, .L64+12
	mov	lr, pc
	bx	ip
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r5, #20]
	b	.L62
.L65:
	.align	2
.L64:
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
	bne	.L69
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L70
.L66:
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L70:
	mov	ip, #32512
	add	ip, ip, #255
	ldr	r3, [r4, #12]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L71
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #24]
	b	.L66
.L69:
	ldrh	ip, [r4, #16]
	ldr	r0, [r0, #0]
	ldmib	r4, {r1, r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L71
	mov	lr, pc
	bx	ip
	b	.L66
.L72:
	.align	2
.L71:
	.word	drawRect
	.size	drawBlock, .-drawBlock
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	drawPlayer
	bl	drawBall
	ldr	r5, .L76
	mov	r4, #0
.L74:
	rsb	r0, r4, r4, asl #3
	add	r0, r5, r0, asl #2
	add	r4, r4, #1
	bl	drawBlock
	cmp	r4, #15
	bne	.L74
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	blocks
	.size	drawGame, .-drawGame
	.comm	player,36,4
	.comm	ball,36,4
	.comm	blocks,420,4
	.comm	blocksRemaining,4,4
	.comm	loseGame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
