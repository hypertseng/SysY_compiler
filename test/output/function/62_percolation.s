	.bss
	n_global_0: .word 0
	.data
	array_global_0: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 
	.text
	.globl main
	.align 2
init:
	addi sp, sp, -204
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
	li t2, 1
	sw t2, 56(sp)
	lw t2, -1(sp)
	lw t0, 52(sp)
	lw t1, 52(sp)
	mul t2, t0, t1
	sw t2, 60(sp)
	lw t2, -1(sp)
	lw t0, 60(sp)
	lw t1, -1(sp)
	add t2, t0, t1
	sw t2, 64(sp)
	li t2, 0
	sw t2, 68(sp)
	li t2, 1
	sw t2, 72(sp)
	lw t2, -1(sp)
	lw t0, 56(sp)
	lw t1, 72(sp)
	mul t2, t0, t1
	sw t2, 76(sp)
	lw t2, 68(sp)
	lw t0, 68(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 68(sp)
	sw -1(sp), array_global_0, init U  `�
