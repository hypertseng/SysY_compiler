	.text
	.globl main
	.align 2
main:
	addi sp, sp, -336
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
# def result_main_1, 0
main_label_5:
	li t2, 0
	sw t2, 68(sp)
# mov a_main_1, 5
main_label_6:
	li t2, 5
	sw t2, 52(sp)
# mov b_main_1, 5
main_label_7:
	li t2, 5
	sw t2, 56(sp)
# mov c_main_1, 1
main_label_8:
	li t2, 1
	sw t2, 60(sp)
# mov d_main_1, -2
main_label_9:
	li t2, -2
	sw t2, 64(sp)
# mul t0, d_main_1, 1
main_label_10:
	lw t0, 64(sp)
	li t1, 1
	mul t2, t0, t1
	sw t2, 72(sp)
# div t1, t0, 2
main_label_11:
	lw t0, 72(sp)
	li t1, 2
	div t2, t0, t1
	sw t2, 76(sp)
# sub t2, a_main_1, b_main_1
main_label_12:
	lw t0, 52(sp)
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 80(sp)
# add t3, t1, t2
main_label_13:
	lw t0, 76(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 84(sp)
# add t4, c_main_1, 3
main_label_14:
	lw t0, 60(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 88(sp)
# mov t5, 0
main_label_15:
	li t2, 0
	sw t2, 92(sp)
# sub t5, t5, t4
main_label_16:
	lw t0, 92(sp)
	lw t1, 88(sp)
	sub t2, t0, t1
	sw t2, 92(sp)
# mod t6, t5, 2
main_label_17:
	lw t0, 92(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 96(sp)
# sub t7, t3, t6
main_label_18:
	lw t0, 84(sp)
	lw t1, 96(sp)
	sub t2, t0, t1
	sw t2, 100(sp)
# mov result_main_1, t7
main_label_19:
	lw t2, 100(sp)
	sw t2, 68(sp)
# call t8, putint(result_main_1)
main_label_20:
	lw a0, 68(sp)
	call putint
# mod t9, d_main_1, 2
main_label_21:
	lw t0, 64(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 104(sp)
# add t10, t9, 67
main_label_22:
	lw t0, 104(sp)
	li t1, 67
	add t2, t0, t1
	sw t2, 108(sp)
# sub t11, a_main_1, b_main_1
main_label_23:
	lw t0, 52(sp)
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 112(sp)
# mov t12, 0
main_label_24:
	li t2, 0
	sw t2, 116(sp)
# sub t12, t12, t11
main_label_25:
	lw t0, 116(sp)
	lw t1, 112(sp)
	sub t2, t0, t1
	sw t2, 116(sp)
# add t13, t10, t12
main_label_26:
	lw t0, 108(sp)
	lw t1, 116(sp)
	add t2, t0, t1
	sw t2, 120(sp)
# add t14, c_main_1, 2
main_label_27:
	lw t0, 60(sp)
	li t1, 2
	add t2, t0, t1
	sw t2, 124(sp)
# mod t15, t14, 2
main_label_28:
	lw t0, 124(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 128(sp)
# mov t16, 0
main_label_29:
	li t2, 0
	sw t2, 132(sp)
# sub t16, t16, t15
main_label_30:
	lw t0, 132(sp)
	lw t1, 128(sp)
	sub t2, t0, t1
	sw t2, 132(sp)
# sub t17, t13, t16
main_label_31:
	lw t0, 120(sp)
	lw t1, 132(sp)
	sub t2, t0, t1
	sw t2, 136(sp)
# mov result_main_1, t17
main_label_32:
	lw t2, 136(sp)
	sw t2, 68(sp)
# add t18, result_main_1, 3
main_label_33:
	lw t0, 68(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 140(sp)
# mov result_main_1, t18
main_label_34:
	lw t2, 140(sp)
	sw t2, 68(sp)
# call t19, putint(result_main_1)
main_label_35:
	lw a0, 68(sp)
	call putint
# return 0
main_label_36:
	li a0, 0
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
	addi sp, sp, 336
	ret
