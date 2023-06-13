	.text
	.globl main
	.align 2
main:
	addi sp, sp, -124
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
# def c_main_1, 0
main_label_3:
	li t2, 0
	sw t2, 60(sp)
# def d_main_1, 0
main_label_4:
	li t2, 0
	sw t2, 64(sp)
# mov a_main_1, 10
main_label_5:
	li t2, 10
	sw t2, 52(sp)
# mov b_main_1, 4
main_label_6:
	li t2, 4
	sw t2, 56(sp)
# mov c_main_1, 2
main_label_7:
	li t2, 2
	sw t2, 60(sp)
# mov d_main_1, 2
main_label_8:
	li t2, 2
	sw t2, 64(sp)
# mul t0, a_main_1, b_main_1
main_label_9:
	lw t0, 52(sp)
	lw t1, 56(sp)
	mul t2, t0, t1
	sw t2, 68(sp)
# add t1, c_main_1, t0
main_label_10:
	lw t0, 60(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 72(sp)
# sub t2, t1, d_main_1
main_label_11:
	lw t0, 72(sp)
	lw t1, 64(sp)
	sub t2, t0, t1
	sw t2, 76(sp)
# return t2
main_label_12:
	lw a0, 76(sp)
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
	addi sp, sp, 124
	ret
