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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L2
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+8
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	SplashBitmap
	.word	drawFullscreenImage
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1024
	add	r3, r3, #3
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	b	goToSplash
	.size	initialize, .-initialize
	.align	2
	.global	goToTutorial
	.type	goToTutorial, %function
goToTutorial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L6
	ldr	r3, .L6+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L6+8
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	tutorialBitmap
	.word	drawFullscreenImage
	.word	state
	.size	goToTutorial, .-goToTutorial
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L11+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToTutorial
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #32512
	stmfd	sp!, {r3, lr}
	add	r0, r0, #255
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+4
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	tutorial
	.type	tutorial, %function
tutorial:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L19+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L18
.L16:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	bl	goToGame
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	b	.L16
.L20:
	.align	2
.L19:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	tutorial, .-tutorial
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L22
	ldr	r3, .L22+4
	mov	lr, pc
	bx	r3
	mov	r3, #32512
	ldr	r2, .L22+8
	add	r3, r3, #255
	mov	r0, #85
	mov	r1, #55
	ldr	ip, .L22+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L22+16
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	pauseBitmap
	.word	drawFullscreenImage
	.word	.LC0
	.word	drawString
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L27
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	mov	ip, #16896
	add	ip, ip, #16
	mov	r0, #85
	mov	r1, #160
	mov	r2, #10
	mov	r3, #12
	str	ip, [sp, #0]
	ldr	ip, .L27+4
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #85
	mov	r1, #160
	ldr	r2, .L27+8
	ldr	ip, .L27+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L27+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L24
	ldr	r3, .L27+20
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L26
.L24:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L26:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	b	goToGame
.L28:
	.align	2
.L27:
	.word	waitForVBlank
	.word	drawRect
	.word	buffer
	.word	drawString
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L30
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+8
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	winBitmap
	.word	drawFullscreenImage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L35+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L34
.L32:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L34:
	ldmfd	sp!, {r4, lr}
	b	initialize
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r0, .L38
	ldr	r3, .L38+4
	mov	lr, pc
	bx	r3
	mov	r3, #32512
	ldr	r2, .L38+8
	add	r3, r3, #255
	mov	r0, #98
	mov	r1, #89
	ldr	ip, .L38+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L38+16
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	loseBitmap
	.word	drawFullscreenImage
	.word	buffer
	.word	drawString
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L47
	ldr	r3, .L47+4
	mov	lr, pc
	bx	r3
	ldr	r1, .L47+8
	ldr	r2, [r4, #0]
	ldr	r3, .L47+12
	ldr	r0, .L47+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+28
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L47+32
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L44
.L41:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L45
	ldr	r3, .L47+36
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L46
	ldmfd	sp!, {r4, lr}
	bx	lr
.L46:
	ldmfd	sp!, {r4, lr}
	b	goToLose
.L44:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L45:
	ldmfd	sp!, {r4, lr}
	b	goToWin
.L48:
	.align	2
.L47:
	.word	blocksRemaining
	.word	updateGame
	.word	.LC1
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	loseGame
	.size	game, .-game
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L52+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
.L49:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	ldmfd	sp!, {r4, lr}
	b	initialize
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L67
	ldr	r7, .L67+4
	ldr	r6, .L67+8
	add	r5, r5, #256
.L66:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L56:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L56
.L63:
	.word	.L57
	.word	.L58
	.word	.L59
	.word	.L60
	.word	.L61
	.word	.L62
.L62:
	bl	lose
	b	.L66
.L61:
	bl	win
	b	.L66
.L60:
	bl	pause
	b	.L66
.L59:
	bl	game
	b	.L66
.L58:
	bl	tutorial
	b	.L66
.L57:
	bl	splash
	b	.L66
.L68:
	.align	2
.L67:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	buffer,41,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Blocks Remaining: \000"
	.space	1
.LC1:
	.ascii	"%d\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
