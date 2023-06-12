	.bss
	a_global_0: .word 0
	b_global_0: .word 0
	c_global_0: .word 0
	d_global_0: .word 0
	e_global_0: .word 0
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -192
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
	li t2, 0
	sw t2, 52(sp)
	lw t2, -1(sp)
	lw t0, b_global_0
	lw t1, c_global_0
	mul t2, t0, t1
	sw t2, 56(sp)
	lw t2, -1(sp)
	lw t0, a_global_0
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 60(sp)
	lw t2, -1(sp)
	lw t0, a_global_0
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 64(sp)
	lw t2, -1(sp)
	lw t0, d_global_0
	lw t1, 64(sp)
	sub t2, t0, t1
	sw t2, 68(sp)
	lw t2, -1(sp)
	lw t0, a_global_0
	lw t1, b_global_0
	mul t2, t0, t1
	sw t2, 72(sp)
	lw t2, -1(sp)
	lw t0, 72(sp)
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 76(sp)
	lw t2, -1(sp)
	lw t0, e_global_0
	lw t1, d_global_0
	add t2, t0, t1
	sw t2, 80(sp)
	lw t2, -1(sp)
	lw t0, a_global_0
	lw t1, b_global_0
	add t2, t0, t1
	sw t2, 84(sp)
	lw t2, -1(sp)
	lw t0, 84(sp)
	lw t1, c_global_0
	add t2, t0, t1
	sw t2, 88(sp)
	lw t2, -1(sp)
	lw t0, d_global_0
	lw t1, e_global_0
	add t2, t0, t1
	sw t2, 92(sp)
	lw a0, 52(sp)
	lw s0, 4(sp)
	lw s1, 8(sp)
	lw s2, 12(sp)
	lw s3, 16(sp)
	lw s4, 20(sp)
	lw s5, 24(sp)
	lw s6, 28(sp)
	lw s7, 32(sp)
	lw s8, 36(sp)
	lw s9, 40(sp)
	lw s10, 44(sp)
	lw s11, 48(sp)
	lw ra, 0(sp)
	addi sp, sp, 192
	ret
