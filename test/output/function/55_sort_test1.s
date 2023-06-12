	.bss
	n_global_0: .word 0
	.text
	.globl main
	.align 2
bubblesort:
	addi sp, sp, -700
	sw ra, 0(sp)
	sw s0, 4(sp)
	sw s1, 8(sp)
	sw s2, 12(sp)
	sw s3, 16(sp)
	sw s4, 20(sp)
	sw s5, 24(sp)
	sw s6, 28(sp)
	sw s7, 32(sp)
	sw s8, 36(sp)
	sw s9, 40(sp)
	sw s10, 44(sp)
	sw s11, 48(sp)
	sw a0, 52(sp)
	li t2, 0
	sw t2, 56(sp)
	li t2, 0
	sw t2, 60(sp)
	lw t2, -1(sp)
	lw t0, n_global_0
	lw t1, -1(sp)
	sub t2, t0, t1
	sw t2, 64(sp)
	lw t2, -1(sp)
	lw t0, n_global_0
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 68(sp)
	lw t2, -1(sp)
	lw t0, 68(sp)
	lw t1, -1(sp)
	sub t2, t0, t1
	sw t2, 72(sp)
	li t2, 0
	sw t2, 76(sp)
	li t2, 1
	sw t2, 80(sp)
	lw t2, -1(sp)
	lw t0, 60(sp)
	lw t1, 80(sp)
	mul t2, t0, t1
	sw t2, 84(sp)
	lw t2, 76(sp)
	lw t0, 76(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 76(sp)
	lw -1(sp), 