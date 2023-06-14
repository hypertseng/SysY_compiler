	.bss
	g_global_0: .word 0
	h_global_0: .word 0
	f_global_0: .word 0
	e_global_0: .word 0
	.text
	.globl main
	.align 2
EightWhile:
	addi sp, sp, -416
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
# def a_EightWhile_1, 0
EightWhile_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_EightWhile_1, 5
EightWhile_label_1:
	li t2, 5
	sw t2, 52(sp)
# def b_EightWhile_1, 0
EightWhile_label_2:
	li t2, 0
	sw t2, 56(sp)
# def c_EightWhile_1, 0
EightWhile_label_3:
	li t2, 0
	sw t2, 60(sp)
# mov b_EightWhile_1, 6
EightWhile_label_4:
	li t2, 6
	sw t2, 56(sp)
# mov c_EightWhile_1, 7
EightWhile_label_5:
	li t2, 7
	sw t2, 60(sp)
# def d_EightWhile_1, 0
EightWhile_label_6:
	li t2, 0
	sw t2, 64(sp)
# mov d_EightWhile_1, 10
EightWhile_label_7:
	li t2, 10
	sw t2, 64(sp)
# lss t0, a_EightWhile_1, 20
EightWhile_label_8:
	lw t0, 52(sp)
	li t1, 20
	slt t2, t0, t1
	sw t2, 68(sp)
# if t0 goto [pc, 2]
EightWhile_label_9:
	lw t0, 68(sp)
	bnez t0, EightWhile_label_11
# goto [pc, 60]
EightWhile_label_10:
	j EightWhile_label_70
# add t1, a_EightWhile_1, 3
EightWhile_label_11:
	lw t0, 52(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 72(sp)
# mov a_EightWhile_1, t1
EightWhile_label_12:
	lw t2, 72(sp)
	sw t2, 52(sp)
# lss t2, b_EightWhile_1, 10
EightWhile_label_13:
	lw t0, 56(sp)
	li t1, 10
	slt t2, t0, t1
	sw t2, 76(sp)
# if t2 goto [pc, 2]
EightWhile_label_14:
	lw t0, 76(sp)
	bnez t0, EightWhile_label_16
# goto [pc, 52]
EightWhile_label_15:
	j EightWhile_label_67
# add t3, b_EightWhile_1, 1
EightWhile_label_16:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 80(sp)
# mov b_EightWhile_1, t3
EightWhile_label_17:
	lw t2, 80(sp)
	sw t2, 56(sp)
# eq t4, c_EightWhile_1, 7
EightWhile_label_18:
	lw t0, 60(sp)
	li t1, 7
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 84(sp)
# if t4 goto [pc, 2]
EightWhile_label_19:
	lw t0, 84(sp)
	bnez t0, EightWhile_label_21
# goto [pc, 44]
EightWhile_label_20:
	j EightWhile_label_64
# sub t5, c_EightWhile_1, 1
EightWhile_label_21:
	lw t0, 60(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 88(sp)
# mov c_EightWhile_1, t5
EightWhile_label_22:
	lw t2, 88(sp)
	sw t2, 60(sp)
# lss t6, d_EightWhile_1, 20
EightWhile_label_23:
	lw t0, 64(sp)
	li t1, 20
	slt t2, t0, t1
	sw t2, 92(sp)
# if t6 goto [pc, 2]
EightWhile_label_24:
	lw t0, 92(sp)
	bnez t0, EightWhile_label_26
# goto [pc, 36]
EightWhile_label_25:
	j EightWhile_label_61
# add t7, d_EightWhile_1, 3
EightWhile_label_26:
	lw t0, 64(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 96(sp)
# mov d_EightWhile_1, t7
EightWhile_label_27:
	lw t2, 96(sp)
	sw t2, 64(sp)
# gtr t8, e_global_0, 1
EightWhile_label_28:
	lw t0, e_global_0
	li t1, 1
	slt t2, t1, t0
	sw t2, 100(sp)
# if t8 goto [pc, 2]
EightWhile_label_29:
	lw t0, 100(sp)
	bnez t0, EightWhile_label_31
# goto [pc, 28]
EightWhile_label_30:
	j EightWhile_label_58
# sub t9, e_global_0, 1
EightWhile_label_31:
	lw t0, e_global_0
	li t1, 1
	sub t2, t0, t1
	sw t2, 104(sp)
# mov e_global_0, t9
EightWhile_label_32:
	lw t2, 104(sp)
	la t3, e_global_0
	sw t2, 0(t3)
# gtr t10, f_global_0, 2
EightWhile_label_33:
	lw t0, f_global_0
	li t1, 2
	slt t2, t1, t0
	sw t2, 108(sp)
# if t10 goto [pc, 2]
EightWhile_label_34:
	lw t0, 108(sp)
	bnez t0, EightWhile_label_36
# goto [pc, 20]
EightWhile_label_35:
	j EightWhile_label_55
# sub t11, f_global_0, 2
EightWhile_label_36:
	lw t0, f_global_0
	li t1, 2
	sub t2, t0, t1
	sw t2, 112(sp)
# mov f_global_0, t11
EightWhile_label_37:
	lw t2, 112(sp)
	la t3, f_global_0
	sw t2, 0(t3)
# lss t12, g_global_0, 3
EightWhile_label_38:
	lw t0, g_global_0
	li t1, 3
	slt t2, t0, t1
	sw t2, 116(sp)
# if t12 goto [pc, 2]
EightWhile_label_39:
	lw t0, 116(sp)
	bnez t0, EightWhile_label_41
# goto [pc, 12]
EightWhile_label_40:
	j EightWhile_label_52
# add t13, g_global_0, 10
EightWhile_label_41:
	lw t0, g_global_0
	li t1, 10
	add t2, t0, t1
	sw t2, 120(sp)
# mov g_global_0, t13
EightWhile_label_42:
	lw t2, 120(sp)
	la t3, g_global_0
	sw t2, 0(t3)
# lss t14, h_global_0, 10
EightWhile_label_43:
	lw t0, h_global_0
	li t1, 10
	slt t2, t0, t1
	sw t2, 124(sp)
# if t14 goto [pc, 2]
EightWhile_label_44:
	lw t0, 124(sp)
	bnez t0, EightWhile_label_46
# goto [pc, 4]
EightWhile_label_45:
	j EightWhile_label_49
# add t15, h_global_0, 8
EightWhile_label_46:
	lw t0, h_global_0
	li t1, 8
	add t2, t0, t1
	sw t2, 128(sp)
# mov h_global_0, t15
EightWhile_label_47:
	lw t2, 128(sp)
	la t3, h_global_0
	sw t2, 0(t3)
# goto [pc, -5]
EightWhile_label_48:
	j EightWhile_label_43
# sub t16, h_global_0, 1
EightWhile_label_49:
	lw t0, h_global_0
	li t1, 1
	sub t2, t0, t1
	sw t2, 132(sp)
# mov h_global_0, t16
EightWhile_label_50:
	lw t2, 132(sp)
	la t3, h_global_0
	sw t2, 0(t3)
# goto [pc, -13]
EightWhile_label_51:
	j EightWhile_label_38
# sub t17, g_global_0, 8
EightWhile_label_52:
	lw t0, g_global_0
	li t1, 8
	sub t2, t0, t1
	sw t2, 136(sp)
# mov g_global_0, t17
EightWhile_label_53:
	lw t2, 136(sp)
	la t3, g_global_0
	sw t2, 0(t3)
# goto [pc, -21]
EightWhile_label_54:
	j EightWhile_label_33
# add t18, f_global_0, 1
EightWhile_label_55:
	lw t0, f_global_0
	li t1, 1
	add t2, t0, t1
	sw t2, 140(sp)
# mov f_global_0, t18
EightWhile_label_56:
	lw t2, 140(sp)
	la t3, f_global_0
	sw t2, 0(t3)
# goto [pc, -29]
EightWhile_label_57:
	j EightWhile_label_28
# add t19, e_global_0, 1
EightWhile_label_58:
	lw t0, e_global_0
	li t1, 1
	add t2, t0, t1
	sw t2, 144(sp)
# mov e_global_0, t19
EightWhile_label_59:
	lw t2, 144(sp)
	la t3, e_global_0
	sw t2, 0(t3)
# goto [pc, -37]
EightWhile_label_60:
	j EightWhile_label_23
# sub t20, d_EightWhile_1, 1
EightWhile_label_61:
	lw t0, 64(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 148(sp)
# mov d_EightWhile_1, t20
EightWhile_label_62:
	lw t2, 148(sp)
	sw t2, 64(sp)
# goto [pc, -45]
EightWhile_label_63:
	j EightWhile_label_18
# add t21, c_EightWhile_1, 1
EightWhile_label_64:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 152(sp)
# mov c_EightWhile_1, t21
EightWhile_label_65:
	lw t2, 152(sp)
	sw t2, 60(sp)
# goto [pc, -53]
EightWhile_label_66:
	j EightWhile_label_13
# sub t22, b_EightWhile_1, 2
EightWhile_label_67:
	lw t0, 56(sp)
	li t1, 2
	sub t2, t0, t1
	sw t2, 156(sp)
# mov b_EightWhile_1, t22
EightWhile_label_68:
	lw t2, 156(sp)
	sw t2, 56(sp)
# goto [pc, -61]
EightWhile_label_69:
	j EightWhile_label_8
# add t23, b_EightWhile_1, d_EightWhile_1
EightWhile_label_70:
	lw t0, 56(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 160(sp)
# add t24, a_EightWhile_1, t23
EightWhile_label_71:
	lw t0, 52(sp)
	lw t1, 160(sp)
	add t2, t0, t1
	sw t2, 164(sp)
# add t25, t24, c_EightWhile_1
EightWhile_label_72:
	lw t0, 164(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 168(sp)
# add t26, e_global_0, d_EightWhile_1
EightWhile_label_73:
	lw t0, e_global_0
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 172(sp)
# sub t27, t26, g_global_0
EightWhile_label_74:
	lw t0, 172(sp)
	lw t1, g_global_0
	sub t2, t0, t1
	sw t2, 176(sp)
# add t28, t27, h_global_0
EightWhile_label_75:
	lw t0, 176(sp)
	lw t1, h_global_0
	add t2, t0, t1
	sw t2, 180(sp)
# sub t29, t25, t28
EightWhile_label_76:
	lw t0, 168(sp)
	lw t1, 180(sp)
	sub t2, t0, t1
	sw t2, 184(sp)
# return t29
EightWhile_label_77:
	lw a0, 184(sp)
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
	addi sp, sp, 416
	ret
main:
	addi sp, sp, -60
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
# mov g_global_0, 1
main_label_1:
	li t2, 1
	la t3, g_global_0
	sw t2, 0(t3)
# mov h_global_0, 2
main_label_2:
	li t2, 2
	la t3, h_global_0
	sw t2, 0(t3)
# mov e_global_0, 4
main_label_3:
	li t2, 4
	la t3, e_global_0
	sw t2, 0(t3)
# mov f_global_0, 6
main_label_4:
	li t2, 6
	la t3, f_global_0
	sw t2, 0(t3)
# call t30, EightWhile()
main_label_5:
	call EightWhile
	sw a0, 52(sp)
# return t30
main_label_6:
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
	addi sp, sp, 60
	ret
