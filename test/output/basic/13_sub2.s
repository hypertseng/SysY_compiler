	.data
	a_global_0: .word 10
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -72
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
# call t0, global()
main_label_0:
# def b_main_1, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# mov b_main_1, 2
main_label_2:
	li t2, 2
	sw t2, 52(sp)
# sub t0, b_main_1, a_global_0
main_label_3:
	lw t0, 52(sp)
	lw t1, a_global_0
	sub t2, t0, t1
	sw t2, 56(sp)
# return t0
main_label_4:
	lw a0, 56(sp)
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
	addi sp, sp, 72
	ret
