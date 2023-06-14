	.text
	.globl main
	.align 2
main:
	addi sp, sp, -344
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
# mov result_main_1, 2
main_label_10:
	li t2, 2
	sw t2, 68(sp)
# mul t0, d_main_1, 1
main_label_11:
	lw t0, 64(sp)
	li t1, 1
	mul t2, t0, t1
	sw t2, 72(sp)
# div t1, t0, 2
main_label_12:
	lw t0, 72(sp)
	li t1, 2
	div t2, t0, t1
	sw t2, 76(sp)
# lss t2, t1, 0
main_label_13:
	lw t0, 76(sp)
	li t1, 0
	slt t2, t0, t1
	sw t2, 80(sp)
# if t2 goto [pc, 16]
main_label_14:
	lw t0, 80(sp)
	bnez t0, main_label_30
# sub t3, a_main_1, b_main_1
main_label_15:
	lw t0, 52(sp)
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 84(sp)
# neq t4, t3, 0
main_label_16:
	lw t0, 84(sp)
	li t1, 0
	xor t2, t0, t1
	snez t2, t2
	sw t2, 88(sp)
# if t4 goto [pc, 3]
main_label_17:
	lw t0, 88(sp)
	bnez t0, main_label_20
# mov t8, 0
main_label_18:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 8]
main_label_19:
	j main_label_27
# add t5, c_main_1, 3
main_label_20:
	lw t0, 60(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 96(sp)
# mod t6, t5, 2
main_label_21:
	lw t0, 96(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 100(sp)
# neq t7, t6, 0
main_label_22:
	lw t0, 100(sp)
	li t1, 0
	xor t2, t0, t1
	snez t2, t2
	sw t2, 104(sp)
# if t7 goto [pc, 3]
main_label_23:
	lw t0, 104(sp)
	bnez t0, main_label_26
# mov t8, 0
main_label_24:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 2]
main_label_25:
	j main_label_27
# mov t8, 1
main_label_26:
	li t2, 1
	sw t2, 92(sp)
# if t8 goto [pc, 3]
main_label_27:
	lw t0, 92(sp)
	bnez t0, main_label_30
# mov t9, 0
main_label_28:
	li t2, 0
	sw t2, 108(sp)
# goto [pc, 2]
main_label_29:
	j main_label_31
# mov t9, 1
main_label_30:
	li t2, 1
	sw t2, 108(sp)
# if t9 goto [pc, 2]
main_label_31:
	lw t0, 108(sp)
	bnez t0, main_label_33
# goto [pc, 2]
main_label_32:
	j main_label_34
# call t10, putint(result_main_1)
main_label_33:
	lw a0, 68(sp)
	call putint
# mod t11, d_main_1, 2
main_label_34:
	lw t0, 64(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 112(sp)
# add t12, t11, 67
main_label_35:
	lw t0, 112(sp)
	li t1, 67
	add t2, t0, t1
	sw t2, 116(sp)
# lss t13, t12, 0
main_label_36:
	lw t0, 116(sp)
	li t1, 0
	slt t2, t0, t1
	sw t2, 120(sp)
# if t13 goto [pc, 16]
main_label_37:
	lw t0, 120(sp)
	bnez t0, main_label_53
# sub t14, a_main_1, b_main_1
main_label_38:
	lw t0, 52(sp)
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 124(sp)
# neq t15, t14, 0
main_label_39:
	lw t0, 124(sp)
	li t1, 0
	xor t2, t0, t1
	snez t2, t2
	sw t2, 128(sp)
# if t15 goto [pc, 3]
main_label_40:
	lw t0, 128(sp)
	bnez t0, main_label_43
# mov t19, 0
main_label_41:
	li t2, 0
	sw t2, 132(sp)
# goto [pc, 8]
main_label_42:
	j main_label_50
# add t16, c_main_1, 2
main_label_43:
	lw t0, 60(sp)
	li t1, 2
	add t2, t0, t1
	sw t2, 136(sp)
# mod t17, t16, 2
main_label_44:
	lw t0, 136(sp)
	li t1, 2
	rem t2, t0, t1
	sw t2, 140(sp)
# neq t18, t17, 0
main_label_45:
	lw t0, 140(sp)
	li t1, 0
	xor t2, t0, t1
	snez t2, t2
	sw t2, 144(sp)
# if t18 goto [pc, 3]
main_label_46:
	lw t0, 144(sp)
	bnez t0, main_label_49
# mov t19, 0
main_label_47:
	li t2, 0
	sw t2, 132(sp)
# goto [pc, 2]
main_label_48:
	j main_label_50
# mov t19, 1
main_label_49:
	li t2, 1
	sw t2, 132(sp)
# if t19 goto [pc, 3]
main_label_50:
	lw t0, 132(sp)
	bnez t0, main_label_53
# mov t20, 0
main_label_51:
	li t2, 0
	sw t2, 148(sp)
# goto [pc, 2]
main_label_52:
	j main_label_54
# mov t20, 1
main_label_53:
	li t2, 1
	sw t2, 148(sp)
# if t20 goto [pc, 2]
main_label_54:
	lw t0, 148(sp)
	bnez t0, main_label_56
# goto [pc, 3]
main_label_55:
	j main_label_58
# mov result_main_1, 4
main_label_56:
	li t2, 4
	sw t2, 68(sp)
# call t21, putint(result_main_1)
main_label_57:
	lw a0, 68(sp)
	call putint
# return 0
main_label_58:
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
	addi sp, sp, 344
	ret
