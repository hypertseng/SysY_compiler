	.data
	N_global_0: .word -1
	arr_global_0: .word 1 2 33 4 5 6 
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -152
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
	li t2, 0
	sw t2, 56(sp)
	li t2, 0
	sw t2, 60(sp)
	li t2, 1
	sw t2, 64(sp)
	lw t2, -1(sp)
	lw t0, 52(sp)
	lw t1, 64(sp)
	mul t2, t0, t1
	sw t2, 68(sp)
	lw t2, 60(sp)
	lw t0, 60(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 60(sp)
	lw -1(sp), arr_global_0, main      
