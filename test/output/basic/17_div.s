	.text
	.globl main
	.align 2
main:
	addi sp, sp, -84
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
# def a_main_1, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# def b_main_1, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov a_main_1, 10
main_label_3:
	li t2, 10
	sw t2, 52(sp)
# mov b_main_1, 5
main_label_4:
	li t2, 5
	sw t2, 56(sp)
# div t0, a_main_1, b_main_1
main_label_5:
	lw t0, 52(sp)
	lw t1, 56(sp)
	div t2, t0, t1
	sw t2, 60(sp)
# return t0
main_label_6:
	lw a0, 60(sp)
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
	addi sp, sp, 84
	ret
