	.arch armv8-a
	.file	"sort.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	sub	sp, sp, #48
	adr	x0, .LANCHOR0
	ldp	x4, x5, [x0]
	ldp	x2, x3, [x0, 16]
	ldr	x0, [x0, 32]
	stp	x4, x5, [sp, 8]
	stp	x2, x3, [sp, 24]
	str	x0, [sp, 40]
	mov	w4, 10
.L2:
	subs	w4, w4, #1
	beq	.L8
	add	x0, sp, 8
	mov	w1, 0
	b	.L4
.L3:
	add	x0, x0, 4
	cmp	w1, w4
	bge	.L2
.L4:
	add	w1, w1, 1
	ldp	w3, w2, [x0]
	cmp	w3, w2
	ble	.L3
	stp	w2, w3, [x0]
	b	.L3
.L8:
	add	sp, sp, 48
	ret
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	323
	.word	123
	.word	-455
	.word	2
	.word	98
	.word	125
	.word	10
	.word	65
	.word	-56
	.word	0
	.ident	"GCC: (Arm GNU Toolchain 15.2.Rel1 (Build arm-15.86)) 15.2.1 20251203"
