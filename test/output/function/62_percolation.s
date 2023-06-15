	.bss
	n_global_0: .word 0
	.data
	array_global_0: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
# def i_init_1, 1
init_label_0:
	li t2, 1
	sw t2, 56(sp)
# mul t0, n_init_1, n_init_1
init_label_1:
	lw t0, 52(sp)
	lw t1, 52(sp)
	mul t2, t0, t1
	sw t2, 60(sp)
# add t1, t0, 1
init_label_2:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 64(sp)
# leq t2, i_init_1, t1
init_label_3:
	lw t0, 56(sp)
	lw t1, 64(sp)
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 68(sp)
# if t2 goto [pc, 2]
init_label_4:
	lw t0, 68(sp)
	bnez t0, init_label_6
# goto [pc, 9]
init_label_5:
	j init_label_14
# def t3, 0
init_label_6:
	li t2, 0
	sw t2, 72(sp)
# def t4, 1
init_label_7:
	li t2, 1
	sw t2, 76(sp)
# mul t5, i_init_1, t4
init_label_8:
	lw t0, 56(sp)
	lw t1, 76(sp)
	mul t2, t0, t1
	sw t2, 80(sp)
# add t3, t3, t5
init_label_9:
	lw t0, 72(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 72(sp)
# store -1, array_global_0, t3
init_label_10:
	la t2, array_global_0
	lw t1, 72(sp)
	slli t1, t1, 2
	add t2, t2, t1
	li t1, -1
	sw t1, 0(t2)
# add t6, i_init_1, 1
init_label_11:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 84(sp)
# mov i_init_1, t6
init_label_12:
	lw t2, 84(sp)
	sw t2, 56(sp)
# goto [pc, -12]
init_label_13:
	j init_label_1
# return null
init_label_14:
	lw a0, -1(sp)
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
	addi sp, sp, 204
	ret
findfa:
	addi sp, sp, -376
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
# def t7, 0
findfa_label_0:
	li t2, 0
	sw t2, 56(sp)
# def t8, 1
findfa_label_1:
	li t2, 1
	sw t2, 60(sp)
# mul t9, a_findfa_3, t8
findfa_label_2:
	lw t0, 52(sp)
	lw t1, 60(sp)
	mul t2, t0, t1
	sw t2, 64(sp)
# add t7, t7, t9
findfa_label_3:
	lw t0, 56(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 56(sp)
# load t10, array_global_0, t7
findfa_label_4:
	la t2, array_global_0
	lw t1, 56(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 68(sp)
# eq t11, t10, a_findfa_3
findfa_label_5:
	lw t0, 68(sp)
	lw t1, 52(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 72(sp)
# if t11 goto [pc, 2]
findfa_label_6:
	lw t0, 72(sp)
	bnez t0, findfa_label_8
# goto [pc, 2]
findfa_label_7:
	j findfa_label_9
# return a_findfa_3
findfa_label_8:
	lw a0, 52(sp)
# if t11 goto [pc, 18]
findfa_label_9:
	lw t0, 72(sp)
	bnez t0, findfa_label_27
# def t12, 0
findfa_label_10:
	li t2, 0
	sw t2, 76(sp)
# def t13, 1
findfa_label_11:
	li t2, 1
	sw t2, 80(sp)
# mul t14, a_findfa_3, t13
findfa_label_12:
	lw t0, 52(sp)
	lw t1, 80(sp)
	mul t2, t0, t1
	sw t2, 84(sp)
# add t12, t12, t14
findfa_label_13:
	lw t0, 76(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 76(sp)
# def t16, 0
findfa_label_14:
	li t2, 0
	sw t2, 88(sp)
# def t17, 1
findfa_label_15:
	li t2, 1
	sw t2, 92(sp)
# mul t18, a_findfa_3, t17
findfa_label_16:
	lw t0, 52(sp)
	lw t1, 92(sp)
	mul t2, t0, t1
	sw t2, 96(sp)
# add t16, t16, t18
findfa_label_17:
	lw t0, 88(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 88(sp)
# load t19, array_global_0, t16
findfa_label_18:
	la t2, array_global_0
	lw t1, 88(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 100(sp)
# call t15, findfa(t19)
findfa_label_19:
	sw a0, 104(sp)
	lw a0, 100(sp)
	call findfa
	sw a0, 108(sp)
	lw a0, 100(sp)
# store t15, array_global_0, t12
findfa_label_20:
	la t2, array_global_0
	lw t1, 76(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 108(sp)
	sw t1, 0(t2)
# def t20, 0
findfa_label_21:
	li t2, 0
	sw t2, 112(sp)
# def t21, 1
findfa_label_22:
	li t2, 1
	sw t2, 116(sp)
# mul t22, a_findfa_3, t21
findfa_label_23:
	lw t0, 52(sp)
	lw t1, 116(sp)
	mul t2, t0, t1
	sw t2, 120(sp)
# add t20, t20, t22
findfa_label_24:
	lw t0, 112(sp)
	lw t1, 120(sp)
	add t2, t0, t1
	sw t2, 112(sp)
# load t23, array_global_0, t20
findfa_label_25:
	la t2, array_global_0
	lw t1, 112(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 124(sp)
# return t23
findfa_label_26:
	lw a0, 124(sp)
findfa_label_27:
	nop
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
	addi sp, sp, 376
	ret
mmerge:
	addi sp, sp, -276
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
	sw a1, 56(sp)
# call t24, findfa(a_mmerge_5)
mmerge_label_0:
	sw a0, 60(sp)
	lw a0, 52(sp)
	call findfa
	sw a0, 64(sp)
	lw a0, 52(sp)
# def m_mmerge_5, t24
mmerge_label_1:
	lw t2, 64(sp)
	sw t2, 68(sp)
# call t25, findfa(b_mmerge_5)
mmerge_label_2:
	sw a0, 72(sp)
	lw a0, 56(sp)
	call findfa
	sw a0, 76(sp)
	lw a0, 56(sp)
# def n_mmerge_5, t25
mmerge_label_3:
	lw t2, 76(sp)
	sw t2, 80(sp)
# neq t26, m_mmerge_5, n_mmerge_5
mmerge_label_4:
	lw t0, 68(sp)
	lw t1, 80(sp)
	xor t2, t0, t1
	snez t2, t2
	sw t2, 84(sp)
# if t26 goto [pc, 2]
mmerge_label_5:
	lw t0, 84(sp)
	bnez t0, mmerge_label_7
# goto [pc, 6]
mmerge_label_6:
	j mmerge_label_12
# def t27, 0
mmerge_label_7:
	li t2, 0
	sw t2, 88(sp)
# def t28, 1
mmerge_label_8:
	li t2, 1
	sw t2, 92(sp)
# mul t29, m_mmerge_5, t28
mmerge_label_9:
	lw t0, 68(sp)
	lw t1, 92(sp)
	mul t2, t0, t1
	sw t2, 96(sp)
# add t27, t27, t29
mmerge_label_10:
	lw t0, 88(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 88(sp)
# store n_mmerge_5, array_global_0, t27
mmerge_label_11:
	la t2, array_global_0
	lw t1, 88(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 80(sp)
	sw t1, 0(t2)
# return null
mmerge_label_12:
	lw a0, -1(sp)
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
	addi sp, sp, 276
	ret
main:
	addi sp, sp, -1184
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
# def t_main_6, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# def m_main_6, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# def a_main_6, 0
main_label_3:
	li t2, 0
	sw t2, 60(sp)
# def b_main_6, 0
main_label_4:
	li t2, 0
	sw t2, 64(sp)
# mov t_main_6, 1
main_label_5:
	li t2, 1
	sw t2, 52(sp)
# if t_main_6 goto [pc, 2]
main_label_6:
	lw t0, 52(sp)
	bnez t0, main_label_8
# goto [pc, 161]
main_label_7:
	j main_label_168
# sub t30, t_main_6, 1
main_label_8:
	lw t0, 52(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 68(sp)
# mov t_main_6, t30
main_label_9:
	lw t2, 68(sp)
	sw t2, 52(sp)
# mov n_global_0, 4
main_label_10:
	li t2, 4
	la t3, n_global_0
	sw t2, 0(t3)
# mov m_main_6, 10
main_label_11:
	li t2, 10
	sw t2, 56(sp)
# def i_while_7, 0
main_label_12:
	li t2, 0
	sw t2, 72(sp)
# def flag_while_7, 0
main_label_13:
	li t2, 0
	sw t2, 76(sp)
# call t31, init(n_global_0)
main_label_14:
	lw a0, n_global_0
	call init
	lw a0, -1(sp)
# mul t32, n_global_0, n_global_0
main_label_15:
	lw t0, n_global_0
	lw t1, n_global_0
	mul t2, t0, t1
	sw t2, 80(sp)
# add t33, t32, 1
main_label_16:
	lw t0, 80(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 84(sp)
# def k_while_7, t33
main_label_17:
	lw t2, 84(sp)
	sw t2, 88(sp)
# lss t34, i_while_7, m_main_6
main_label_18:
	lw t0, 72(sp)
	lw t1, 56(sp)
	slt t2, t0, t1
	sw t2, 92(sp)
# if t34 goto [pc, 2]
main_label_19:
	lw t0, 92(sp)
	bnez t0, main_label_21
# goto [pc, 142]
main_label_20:
	j main_label_162
# call t35, getint()
main_label_21:
	call getint
	sw a0, 96(sp)
# mov a_main_6, t35
main_label_22:
	lw t2, 96(sp)
	sw t2, 60(sp)
# call t36, getint()
main_label_23:
	call getint
	sw a0, 100(sp)
# mov b_main_6, t36
main_label_24:
	lw t2, 100(sp)
	sw t2, 64(sp)
# not t37, flag_while_7
main_label_25:
	lw t0, 76(sp)
	seqz t2, t0
	sw t2, 104(sp)
# if t37 goto [pc, 2]
main_label_26:
	lw t0, 104(sp)
	bnez t0, main_label_28
# goto [pc, 132]
main_label_27:
	j main_label_159
# sub t38, a_main_6, 1
main_label_28:
	lw t0, 60(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 108(sp)
# mul t39, n_global_0, t38
main_label_29:
	lw t0, n_global_0
	lw t1, 108(sp)
	mul t2, t0, t1
	sw t2, 112(sp)
# add t40, t39, b_main_6
main_label_30:
	lw t0, 112(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 116(sp)
# def loc_if_9, t40
main_label_31:
	lw t2, 116(sp)
	sw t2, 120(sp)
# def t41, 0
main_label_32:
	li t2, 0
	sw t2, 124(sp)
# def t42, 1
main_label_33:
	li t2, 1
	sw t2, 128(sp)
# mul t43, loc_if_9, t42
main_label_34:
	lw t0, 120(sp)
	lw t1, 128(sp)
	mul t2, t0, t1
	sw t2, 132(sp)
# add t41, t41, t43
main_label_35:
	lw t0, 124(sp)
	lw t1, 132(sp)
	add t2, t0, t1
	sw t2, 124(sp)
# store loc_if_9, array_global_0, t41
main_label_36:
	la t2, array_global_0
	lw t1, 124(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 120(sp)
	sw t1, 0(t2)
# eq t44, a_main_6, 1
main_label_37:
	lw t0, 60(sp)
	li t1, 1
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 136(sp)
# if t44 goto [pc, 2]
main_label_38:
	lw t0, 136(sp)
	bnez t0, main_label_40
# goto [pc, 3]
main_label_39:
	j main_label_42
# store 0, array_global_0, 0
main_label_40:
	la t2, array_global_0
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# call t45, mmerge(loc_if_9, 0)
main_label_41:
	sw a0, 140(sp)
	lw a0, 120(sp)
	li a1, 0
	call mmerge
	lw a0, 120(sp)
# eq t46, a_main_6, n_global_0
main_label_42:
	lw t0, 60(sp)
	lw t1, n_global_0
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 144(sp)
# if t46 goto [pc, 2]
main_label_43:
	lw t0, 144(sp)
	bnez t0, main_label_45
# goto [pc, 7]
main_label_44:
	j main_label_51
# def t47, 0
main_label_45:
	li t2, 0
	sw t2, 148(sp)
# def t48, 1
main_label_46:
	li t2, 1
	sw t2, 152(sp)
# mul t49, k_while_7, t48
main_label_47:
	lw t0, 88(sp)
	lw t1, 152(sp)
	mul t2, t0, t1
	sw t2, 156(sp)
# add t47, t47, t49
main_label_48:
	lw t0, 148(sp)
	lw t1, 156(sp)
	add t2, t0, t1
	sw t2, 148(sp)
# store k_while_7, array_global_0, t47
main_label_49:
	la t2, array_global_0
	lw t1, 148(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 88(sp)
	sw t1, 0(t2)
# call t50, mmerge(loc_if_9, k_while_7)
main_label_50:
	sw a0, 160(sp)
	lw a0, 120(sp)
	sw a1, 164(sp)
	lw a1, 88(sp)
	call mmerge
	lw a0, 120(sp)
	lw a1, 88(sp)
# lss t51, b_main_6, n_global_0
main_label_51:
	lw t0, 64(sp)
	lw t1, n_global_0
	slt t2, t0, t1
	sw t2, 168(sp)
# if t51 goto [pc, 3]
main_label_52:
	lw t0, 168(sp)
	bnez t0, main_label_55
# mov t58, 0
main_label_53:
	li t2, 0
	sw t2, 172(sp)
# goto [pc, 12]
main_label_54:
	j main_label_66
# add t52, loc_if_9, 1
main_label_55:
	lw t0, 120(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 176(sp)
# def t53, 0
main_label_56:
	li t2, 0
	sw t2, 180(sp)
# def t54, 1
main_label_57:
	li t2, 1
	sw t2, 184(sp)
# mul t55, t52, t54
main_label_58:
	lw t0, 176(sp)
	lw t1, 184(sp)
	mul t2, t0, t1
	sw t2, 188(sp)
# add t53, t53, t55
main_label_59:
	lw t0, 180(sp)
	lw t1, 188(sp)
	add t2, t0, t1
	sw t2, 180(sp)
# load t56, array_global_0, t53
main_label_60:
	la t2, array_global_0
	lw t1, 180(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 192(sp)
# neq t57, t56, -1
main_label_61:
	lw t0, 192(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 196(sp)
# if t57 goto [pc, 3]
main_label_62:
	lw t0, 196(sp)
	bnez t0, main_label_65
# mov t58, 0
main_label_63:
	li t2, 0
	sw t2, 172(sp)
# goto [pc, 2]
main_label_64:
	j main_label_66
# mov t58, 1
main_label_65:
	li t2, 1
	sw t2, 172(sp)
# if t58 goto [pc, 2]
main_label_66:
	lw t0, 172(sp)
	bnez t0, main_label_68
# goto [pc, 3]
main_label_67:
	j main_label_70
# add t60, loc_if_9, 1
main_label_68:
	lw t0, 120(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 200(sp)
# call t59, mmerge(loc_if_9, t60)
main_label_69:
	sw a0, 204(sp)
	lw a0, 120(sp)
	sw a1, 208(sp)
	lw a1, 200(sp)
	call mmerge
	lw a0, 120(sp)
	lw a1, 200(sp)
# gtr t61, b_main_6, 1
main_label_70:
	lw t0, 64(sp)
	li t1, 1
	slt t2, t1, t0
	sw t2, 212(sp)
# if t61 goto [pc, 3]
main_label_71:
	lw t0, 212(sp)
	bnez t0, main_label_74
# mov t68, 0
main_label_72:
	li t2, 0
	sw t2, 216(sp)
# goto [pc, 12]
main_label_73:
	j main_label_85
# sub t62, loc_if_9, 1
main_label_74:
	lw t0, 120(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 220(sp)
# def t63, 0
main_label_75:
	li t2, 0
	sw t2, 224(sp)
# def t64, 1
main_label_76:
	li t2, 1
	sw t2, 228(sp)
# mul t65, t62, t64
main_label_77:
	lw t0, 220(sp)
	lw t1, 228(sp)
	mul t2, t0, t1
	sw t2, 232(sp)
# add t63, t63, t65
main_label_78:
	lw t0, 224(sp)
	lw t1, 232(sp)
	add t2, t0, t1
	sw t2, 224(sp)
# load t66, array_global_0, t63
main_label_79:
	la t2, array_global_0
	lw t1, 224(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 236(sp)
# neq t67, t66, -1
main_label_80:
	lw t0, 236(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 240(sp)
# if t67 goto [pc, 3]
main_label_81:
	lw t0, 240(sp)
	bnez t0, main_label_84
# mov t68, 0
main_label_82:
	li t2, 0
	sw t2, 216(sp)
# goto [pc, 2]
main_label_83:
	j main_label_85
# mov t68, 1
main_label_84:
	li t2, 1
	sw t2, 216(sp)
# if t68 goto [pc, 2]
main_label_85:
	lw t0, 216(sp)
	bnez t0, main_label_87
# goto [pc, 3]
main_label_86:
	j main_label_89
# sub t70, loc_if_9, 1
main_label_87:
	lw t0, 120(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 244(sp)
# call t69, mmerge(loc_if_9, t70)
main_label_88:
	sw a0, 248(sp)
	lw a0, 120(sp)
	sw a1, 252(sp)
	lw a1, 244(sp)
	call mmerge
	lw a0, 120(sp)
	lw a1, 244(sp)
# lss t71, a_main_6, n_global_0
main_label_89:
	lw t0, 60(sp)
	lw t1, n_global_0
	slt t2, t0, t1
	sw t2, 256(sp)
# if t71 goto [pc, 3]
main_label_90:
	lw t0, 256(sp)
	bnez t0, main_label_93
# mov t78, 0
main_label_91:
	li t2, 0
	sw t2, 260(sp)
# goto [pc, 12]
main_label_92:
	j main_label_104
# add t72, loc_if_9, n_global_0
main_label_93:
	lw t0, 120(sp)
	lw t1, n_global_0
	add t2, t0, t1
	sw t2, 264(sp)
# def t73, 0
main_label_94:
	li t2, 0
	sw t2, 268(sp)
# def t74, 1
main_label_95:
	li t2, 1
	sw t2, 272(sp)
# mul t75, t72, t74
main_label_96:
	lw t0, 264(sp)
	lw t1, 272(sp)
	mul t2, t0, t1
	sw t2, 276(sp)
# add t73, t73, t75
main_label_97:
	lw t0, 268(sp)
	lw t1, 276(sp)
	add t2, t0, t1
	sw t2, 268(sp)
# load t76, array_global_0, t73
main_label_98:
	la t2, array_global_0
	lw t1, 268(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 280(sp)
# neq t77, t76, -1
main_label_99:
	lw t0, 280(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 284(sp)
# if t77 goto [pc, 3]
main_label_100:
	lw t0, 284(sp)
	bnez t0, main_label_103
# mov t78, 0
main_label_101:
	li t2, 0
	sw t2, 260(sp)
# goto [pc, 2]
main_label_102:
	j main_label_104
# mov t78, 1
main_label_103:
	li t2, 1
	sw t2, 260(sp)
# if t78 goto [pc, 2]
main_label_104:
	lw t0, 260(sp)
	bnez t0, main_label_106
# goto [pc, 3]
main_label_105:
	j main_label_108
# add t80, loc_if_9, n_global_0
main_label_106:
	lw t0, 120(sp)
	lw t1, n_global_0
	add t2, t0, t1
	sw t2, 288(sp)
# call t79, mmerge(loc_if_9, t80)
main_label_107:
	sw a0, 292(sp)
	lw a0, 120(sp)
	sw a1, 296(sp)
	lw a1, 288(sp)
	call mmerge
	lw a0, 120(sp)
	lw a1, 288(sp)
# gtr t81, a_main_6, 1
main_label_108:
	lw t0, 60(sp)
	li t1, 1
	slt t2, t1, t0
	sw t2, 300(sp)
# if t81 goto [pc, 3]
main_label_109:
	lw t0, 300(sp)
	bnez t0, main_label_112
# mov t88, 0
main_label_110:
	li t2, 0
	sw t2, 304(sp)
# goto [pc, 12]
main_label_111:
	j main_label_123
# sub t82, loc_if_9, n_global_0
main_label_112:
	lw t0, 120(sp)
	lw t1, n_global_0
	sub t2, t0, t1
	sw t2, 308(sp)
# def t83, 0
main_label_113:
	li t2, 0
	sw t2, 312(sp)
# def t84, 1
main_label_114:
	li t2, 1
	sw t2, 316(sp)
# mul t85, t82, t84
main_label_115:
	lw t0, 308(sp)
	lw t1, 316(sp)
	mul t2, t0, t1
	sw t2, 320(sp)
# add t83, t83, t85
main_label_116:
	lw t0, 312(sp)
	lw t1, 320(sp)
	add t2, t0, t1
	sw t2, 312(sp)
# load t86, array_global_0, t83
main_label_117:
	la t2, array_global_0
	lw t1, 312(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 324(sp)
# neq t87, t86, -1
main_label_118:
	lw t0, 324(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 328(sp)
# if t87 goto [pc, 3]
main_label_119:
	lw t0, 328(sp)
	bnez t0, main_label_122
# mov t88, 0
main_label_120:
	li t2, 0
	sw t2, 304(sp)
# goto [pc, 2]
main_label_121:
	j main_label_123
# mov t88, 1
main_label_122:
	li t2, 1
	sw t2, 304(sp)
# if t88 goto [pc, 2]
main_label_123:
	lw t0, 304(sp)
	bnez t0, main_label_125
# goto [pc, 3]
main_label_124:
	j main_label_127
# sub t90, loc_if_9, n_global_0
main_label_125:
	lw t0, 120(sp)
	lw t1, n_global_0
	sub t2, t0, t1
	sw t2, 332(sp)
# call t89, mmerge(loc_if_9, t90)
main_label_126:
	sw a0, 336(sp)
	lw a0, 120(sp)
	sw a1, 340(sp)
	lw a1, 332(sp)
	call mmerge
	lw a0, 120(sp)
	lw a1, 332(sp)
# load t91, array_global_0, 0
main_label_127:
	la t2, array_global_0
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 344(sp)
# neq t92, t91, -1
main_label_128:
	lw t0, 344(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 348(sp)
# if t92 goto [pc, 3]
main_label_129:
	lw t0, 348(sp)
	bnez t0, main_label_132
# mov t102, 0
main_label_130:
	li t2, 0
	sw t2, 352(sp)
# goto [pc, 21]
main_label_131:
	j main_label_152
# def t93, 0
main_label_132:
	li t2, 0
	sw t2, 356(sp)
# def t94, 1
main_label_133:
	li t2, 1
	sw t2, 360(sp)
# mul t95, k_while_7, t94
main_label_134:
	lw t0, 88(sp)
	lw t1, 360(sp)
	mul t2, t0, t1
	sw t2, 364(sp)
# add t93, t93, t95
main_label_135:
	lw t0, 356(sp)
	lw t1, 364(sp)
	add t2, t0, t1
	sw t2, 356(sp)
# load t96, array_global_0, t93
main_label_136:
	la t2, array_global_0
	lw t1, 356(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 368(sp)
# neq t97, t96, -1
main_label_137:
	lw t0, 368(sp)
	li t1, -1
	xor t2, t0, t1
	snez t2, t2
	sw t2, 372(sp)
# if t97 goto [pc, 3]
main_label_138:
	lw t0, 372(sp)
	bnez t0, main_label_141
# mov t101, 0
main_label_139:
	li t2, 0
	sw t2, 376(sp)
# goto [pc, 8]
main_label_140:
	j main_label_148
# call t98, findfa(0)
main_label_141:
	li a0, 0
	call findfa
	sw a0, 380(sp)
# call t99, findfa(k_while_7)
main_label_142:
	sw a0, 384(sp)
	lw a0, 88(sp)
	call findfa
	sw a0, 388(sp)
	lw a0, 88(sp)
# eq t100, t98, t99
main_label_143:
	lw t0, 380(sp)
	lw t1, 388(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 392(sp)
# if t100 goto [pc, 3]
main_label_144:
	lw t0, 392(sp)
	bnez t0, main_label_147
# mov t101, 0
main_label_145:
	li t2, 0
	sw t2, 376(sp)
# goto [pc, 2]
main_label_146:
	j main_label_148
# mov t101, 1
main_label_147:
	li t2, 1
	sw t2, 376(sp)
# if t101 goto [pc, 3]
main_label_148:
	lw t0, 376(sp)
	bnez t0, main_label_151
# mov t102, 0
main_label_149:
	li t2, 0
	sw t2, 352(sp)
# goto [pc, 2]
main_label_150:
	j main_label_152
# mov t102, 1
main_label_151:
	li t2, 1
	sw t2, 352(sp)
# if t102 goto [pc, 2]
main_label_152:
	lw t0, 352(sp)
	bnez t0, main_label_154
# goto [pc, 6]
main_label_153:
	j main_label_159
# mov flag_while_7, 1
main_label_154:
	li t2, 1
	sw t2, 76(sp)
# add t103, i_while_7, 1
main_label_155:
	lw t0, 72(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 396(sp)
# def tmp_if_16, t103
main_label_156:
	lw t2, 396(sp)
	sw t2, 400(sp)
# call t104, putint(tmp_if_16)
main_label_157:
	sw a0, 404(sp)
	lw a0, 400(sp)
	call putint
	lw a0, 400(sp)
# call t105, putch(10)
main_label_158:
	li a0, 10
	call putch
# add t106, i_while_7, 1
main_label_159:
	lw t0, 72(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 408(sp)
# mov i_while_7, t106
main_label_160:
	lw t2, 408(sp)
	sw t2, 72(sp)
# goto [pc, -143]
main_label_161:
	j main_label_18
# not t107, flag_while_7
main_label_162:
	lw t0, 76(sp)
	seqz t2, t0
	sw t2, 412(sp)
# if t107 goto [pc, 2]
main_label_163:
	lw t0, 412(sp)
	bnez t0, main_label_165
# goto [pc, 3]
main_label_164:
	j main_label_167
# call t108, putint(-1)
main_label_165:
	li a0, -1
	call putint
# call t109, putch(10)
main_label_166:
	li a0, 10
	call putch
# goto [pc, -161]
main_label_167:
	j main_label_6
# return 0
main_label_168:
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
	addi sp, sp, 1184
	ret
