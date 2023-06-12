	.data
	a_global_0: .word 3
	b_global_0: .word 5
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -68
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
	li t2, 5
	sw t2, 52(sp)
	lw t0, 52(sp)
	add ,t2, t0, b_global_0
	sw t2, 56(sp)
	la t2, 56(sp)
