	.bss
	n_global_0: .word 0
	m_global_0: .word 0
	v1_global_0: .word 0
	v2_global_0: .word 0
	w_global_0: .word 0
	.data
	INF_global_0: .word 65535
	e_global_0: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	book_global_0: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dis_global_0: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.text
	.globl main
	.align 2
Dijkstra:
	addi sp, sp, -976
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
# def i_Dijkstra_1, 0
Dijkstra_label_0:
	li t2, 0
	sw t2, 52(sp)
# def j_Dijkstra_1, 0
Dijkstra_label_1:
	li t2, 0
	sw t2, 56(sp)
# mov i_Dijkstra_1, 1
Dijkstra_label_2:
	li t2, 1
	sw t2, 52(sp)
# leq t0, i_Dijkstra_1, n_global_0
Dijkstra_label_3:
	lw t0, 52(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 60(sp)
# if t0 goto [pc, 2]
Dijkstra_label_4:
	lw t0, 60(sp)
	bnez t0, Dijkstra_label_6
# goto [pc, 22]
Dijkstra_label_5:
	j Dijkstra_label_27
# def t1, 0
Dijkstra_label_6:
	li t2, 0
	sw t2, 64(sp)
# def t2, 1
Dijkstra_label_7:
	li t2, 1
	sw t2, 68(sp)
# mul t3, i_Dijkstra_1, t2
Dijkstra_label_8:
	lw t0, 52(sp)
	lw t1, 68(sp)
	mul t2, t0, t1
	sw t2, 72(sp)
# add t1, t1, t3
Dijkstra_label_9:
	lw t0, 64(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 64(sp)
# def t4, 0
Dijkstra_label_10:
	li t2, 0
	sw t2, 76(sp)
# def t5, 16
Dijkstra_label_11:
	li t2, 16
	sw t2, 80(sp)
# mul t6, 1, t5
Dijkstra_label_12:
	li t0, 1
	lw t1, 80(sp)
	mul t2, t0, t1
	sw t2, 84(sp)
# add t4, t4, t6
Dijkstra_label_13:
	lw t0, 76(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 76(sp)
# def t7, 1
Dijkstra_label_14:
	li t2, 1
	sw t2, 88(sp)
# mul t8, i_Dijkstra_1, t7
Dijkstra_label_15:
	lw t0, 52(sp)
	lw t1, 88(sp)
	mul t2, t0, t1
	sw t2, 92(sp)
# add t4, t4, t8
Dijkstra_label_16:
	lw t0, 76(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 76(sp)
# load t9, e_global_0, t4
Dijkstra_label_17:
	la t2, e_global_0
	lw t1, 76(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 96(sp)
# store t9, dis_global_0, t1
Dijkstra_label_18:
	la t2, dis_global_0
	lw t1, 64(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 96(sp)
	sw t1, 0(t2)
# def t10, 0
Dijkstra_label_19:
	li t2, 0
	sw t2, 100(sp)
# def t11, 1
Dijkstra_label_20:
	li t2, 1
	sw t2, 104(sp)
# mul t12, i_Dijkstra_1, t11
Dijkstra_label_21:
	lw t0, 52(sp)
	lw t1, 104(sp)
	mul t2, t0, t1
	sw t2, 108(sp)
# add t10, t10, t12
Dijkstra_label_22:
	lw t0, 100(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 100(sp)
# store 0, book_global_0, t10
Dijkstra_label_23:
	la t2, book_global_0
	lw t1, 100(sp)
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# add t13, i_Dijkstra_1, 1
Dijkstra_label_24:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 112(sp)
# mov i_Dijkstra_1, t13
Dijkstra_label_25:
	lw t2, 112(sp)
	sw t2, 52(sp)
# goto [pc, -23]
Dijkstra_label_26:
	j Dijkstra_label_3
# store 1, book_global_0, 1
Dijkstra_label_27:
	la t2, book_global_0
	li t1, 1
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# mov i_Dijkstra_1, 1
Dijkstra_label_28:
	li t2, 1
	sw t2, 52(sp)
# sub t14, n_global_0, 1
Dijkstra_label_29:
	lw t0, n_global_0
	li t1, 1
	sub t2, t0, t1
	sw t2, 116(sp)
# leq t15, i_Dijkstra_1, t14
Dijkstra_label_30:
	lw t0, 52(sp)
	lw t1, 116(sp)
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 120(sp)
# if t15 goto [pc, 2]
Dijkstra_label_31:
	lw t0, 120(sp)
	bnez t0, Dijkstra_label_33
# goto [pc, 105]
Dijkstra_label_32:
	j Dijkstra_label_137
# def min_num_while_3, INF_global_0
Dijkstra_label_33:
	lw t2, INF_global_0
	sw t2, 124(sp)
# def min_index_while_3, 0
Dijkstra_label_34:
	li t2, 0
	sw t2, 128(sp)
# def k_while_3, 1
Dijkstra_label_35:
	li t2, 1
	sw t2, 132(sp)
# leq t16, k_while_3, n_global_0
Dijkstra_label_36:
	lw t0, 132(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 136(sp)
# if t16 goto [pc, 2]
Dijkstra_label_37:
	lw t0, 136(sp)
	bnez t0, Dijkstra_label_39
# goto [pc, 32]
Dijkstra_label_38:
	j Dijkstra_label_70
# def t17, 0
Dijkstra_label_39:
	li t2, 0
	sw t2, 140(sp)
# def t18, 1
Dijkstra_label_40:
	li t2, 1
	sw t2, 144(sp)
# mul t19, k_while_3, t18
Dijkstra_label_41:
	lw t0, 132(sp)
	lw t1, 144(sp)
	mul t2, t0, t1
	sw t2, 148(sp)
# add t17, t17, t19
Dijkstra_label_42:
	lw t0, 140(sp)
	lw t1, 148(sp)
	add t2, t0, t1
	sw t2, 140(sp)
# load t20, dis_global_0, t17
Dijkstra_label_43:
	la t2, dis_global_0
	lw t1, 140(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 152(sp)
# gtr t21, min_num_while_3, t20
Dijkstra_label_44:
	lw t0, 124(sp)
	lw t1, 152(sp)
	slt t2, t1, t0
	sw t2, 156(sp)
# if t21 goto [pc, 3]
Dijkstra_label_45:
	lw t0, 156(sp)
	bnez t0, Dijkstra_label_48
# mov t27, 0
Dijkstra_label_46:
	li t2, 0
	sw t2, 160(sp)
# goto [pc, 11]
Dijkstra_label_47:
	j Dijkstra_label_58
# def t22, 0
Dijkstra_label_48:
	li t2, 0
	sw t2, 164(sp)
# def t23, 1
Dijkstra_label_49:
	li t2, 1
	sw t2, 168(sp)
# mul t24, k_while_3, t23
Dijkstra_label_50:
	lw t0, 132(sp)
	lw t1, 168(sp)
	mul t2, t0, t1
	sw t2, 172(sp)
# add t22, t22, t24
Dijkstra_label_51:
	lw t0, 164(sp)
	lw t1, 172(sp)
	add t2, t0, t1
	sw t2, 164(sp)
# load t25, book_global_0, t22
Dijkstra_label_52:
	la t2, book_global_0
	lw t1, 164(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 176(sp)
# eq t26, t25, 0
Dijkstra_label_53:
	lw t0, 176(sp)
	li t1, 0
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 180(sp)
# if t26 goto [pc, 3]
Dijkstra_label_54:
	lw t0, 180(sp)
	bnez t0, Dijkstra_label_57
# mov t27, 0
Dijkstra_label_55:
	li t2, 0
	sw t2, 160(sp)
# goto [pc, 2]
Dijkstra_label_56:
	j Dijkstra_label_58
# mov t27, 1
Dijkstra_label_57:
	li t2, 1
	sw t2, 160(sp)
# if t27 goto [pc, 2]
Dijkstra_label_58:
	lw t0, 160(sp)
	bnez t0, Dijkstra_label_60
# goto [pc, 8]
Dijkstra_label_59:
	j Dijkstra_label_67
# def t28, 0
Dijkstra_label_60:
	li t2, 0
	sw t2, 184(sp)
# def t29, 1
Dijkstra_label_61:
	li t2, 1
	sw t2, 188(sp)
# mul t30, k_while_3, t29
Dijkstra_label_62:
	lw t0, 132(sp)
	lw t1, 188(sp)
	mul t2, t0, t1
	sw t2, 192(sp)
# add t28, t28, t30
Dijkstra_label_63:
	lw t0, 184(sp)
	lw t1, 192(sp)
	add t2, t0, t1
	sw t2, 184(sp)
# load t31, dis_global_0, t28
Dijkstra_label_64:
	la t2, dis_global_0
	lw t1, 184(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 196(sp)
# mov min_num_while_3, t31
Dijkstra_label_65:
	lw t2, 196(sp)
	sw t2, 124(sp)
# mov min_index_while_3, k_while_3
Dijkstra_label_66:
	lw t2, 132(sp)
	sw t2, 128(sp)
# add t32, k_while_3, 1
Dijkstra_label_67:
	lw t0, 132(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 200(sp)
# mov k_while_3, t32
Dijkstra_label_68:
	lw t2, 200(sp)
	sw t2, 132(sp)
# goto [pc, -33]
Dijkstra_label_69:
	j Dijkstra_label_36
# def t33, 0
Dijkstra_label_70:
	li t2, 0
	sw t2, 204(sp)
# def t34, 1
Dijkstra_label_71:
	li t2, 1
	sw t2, 208(sp)
# mul t35, min_index_while_3, t34
Dijkstra_label_72:
	lw t0, 128(sp)
	lw t1, 208(sp)
	mul t2, t0, t1
	sw t2, 212(sp)
# add t33, t33, t35
Dijkstra_label_73:
	lw t0, 204(sp)
	lw t1, 212(sp)
	add t2, t0, t1
	sw t2, 204(sp)
# store 1, book_global_0, t33
Dijkstra_label_74:
	la t2, book_global_0
	lw t1, 204(sp)
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# def j_while_3, 1
Dijkstra_label_75:
	li t2, 1
	sw t2, 216(sp)
# leq t36, j_while_3, n_global_0
Dijkstra_label_76:
	lw t0, 216(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 220(sp)
# if t36 goto [pc, 2]
Dijkstra_label_77:
	lw t0, 220(sp)
	bnez t0, Dijkstra_label_79
# goto [pc, 56]
Dijkstra_label_78:
	j Dijkstra_label_134
# def t37, 0
Dijkstra_label_79:
	li t2, 0
	sw t2, 224(sp)
# def t38, 16
Dijkstra_label_80:
	li t2, 16
	sw t2, 228(sp)
# mul t39, min_index_while_3, t38
Dijkstra_label_81:
	lw t0, 128(sp)
	lw t1, 228(sp)
	mul t2, t0, t1
	sw t2, 232(sp)
# add t37, t37, t39
Dijkstra_label_82:
	lw t0, 224(sp)
	lw t1, 232(sp)
	add t2, t0, t1
	sw t2, 224(sp)
# def t40, 1
Dijkstra_label_83:
	li t2, 1
	sw t2, 236(sp)
# mul t41, j_while_3, t40
Dijkstra_label_84:
	lw t0, 216(sp)
	lw t1, 236(sp)
	mul t2, t0, t1
	sw t2, 240(sp)
# add t37, t37, t41
Dijkstra_label_85:
	lw t0, 224(sp)
	lw t1, 240(sp)
	add t2, t0, t1
	sw t2, 224(sp)
# load t42, e_global_0, t37
Dijkstra_label_86:
	la t2, e_global_0
	lw t1, 224(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 244(sp)
# lss t43, t42, INF_global_0
Dijkstra_label_87:
	lw t0, 244(sp)
	lw t1, INF_global_0
	slt t2, t0, t1
	sw t2, 248(sp)
# if t43 goto [pc, 2]
Dijkstra_label_88:
	lw t0, 248(sp)
	bnez t0, Dijkstra_label_90
# goto [pc, 42]
Dijkstra_label_89:
	j Dijkstra_label_131
# def t44, 0
Dijkstra_label_90:
	li t2, 0
	sw t2, 252(sp)
# def t45, 1
Dijkstra_label_91:
	li t2, 1
	sw t2, 256(sp)
# mul t46, j_while_3, t45
Dijkstra_label_92:
	lw t0, 216(sp)
	lw t1, 256(sp)
	mul t2, t0, t1
	sw t2, 260(sp)
# add t44, t44, t46
Dijkstra_label_93:
	lw t0, 252(sp)
	lw t1, 260(sp)
	add t2, t0, t1
	sw t2, 252(sp)
# load t47, dis_global_0, t44
Dijkstra_label_94:
	la t2, dis_global_0
	lw t1, 252(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 264(sp)
# def t48, 0
Dijkstra_label_95:
	li t2, 0
	sw t2, 268(sp)
# def t49, 1
Dijkstra_label_96:
	li t2, 1
	sw t2, 272(sp)
# mul t50, min_index_while_3, t49
Dijkstra_label_97:
	lw t0, 128(sp)
	lw t1, 272(sp)
	mul t2, t0, t1
	sw t2, 276(sp)
# add t48, t48, t50
Dijkstra_label_98:
	lw t0, 268(sp)
	lw t1, 276(sp)
	add t2, t0, t1
	sw t2, 268(sp)
# load t51, dis_global_0, t48
Dijkstra_label_99:
	la t2, dis_global_0
	lw t1, 268(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 280(sp)
# def t52, 0
Dijkstra_label_100:
	li t2, 0
	sw t2, 284(sp)
# def t53, 16
Dijkstra_label_101:
	li t2, 16
	sw t2, 288(sp)
# mul t54, min_index_while_3, t53
Dijkstra_label_102:
	lw t0, 128(sp)
	lw t1, 288(sp)
	mul t2, t0, t1
	sw t2, 292(sp)
# add t52, t52, t54
Dijkstra_label_103:
	lw t0, 284(sp)
	lw t1, 292(sp)
	add t2, t0, t1
	sw t2, 284(sp)
# def t55, 1
Dijkstra_label_104:
	li t2, 1
	sw t2, 296(sp)
# mul t56, j_while_3, t55
Dijkstra_label_105:
	lw t0, 216(sp)
	lw t1, 296(sp)
	mul t2, t0, t1
	sw t2, 300(sp)
# add t52, t52, t56
Dijkstra_label_106:
	lw t0, 284(sp)
	lw t1, 300(sp)
	add t2, t0, t1
	sw t2, 284(sp)
# load t57, e_global_0, t52
Dijkstra_label_107:
	la t2, e_global_0
	lw t1, 284(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 304(sp)
# add t58, t51, t57
Dijkstra_label_108:
	lw t0, 280(sp)
	lw t1, 304(sp)
	add t2, t0, t1
	sw t2, 308(sp)
# gtr t59, t47, t58
Dijkstra_label_109:
	lw t0, 264(sp)
	lw t1, 308(sp)
	slt t2, t1, t0
	sw t2, 312(sp)
# if t59 goto [pc, 2]
Dijkstra_label_110:
	lw t0, 312(sp)
	bnez t0, Dijkstra_label_112
# goto [pc, 20]
Dijkstra_label_111:
	j Dijkstra_label_131
# def t60, 0
Dijkstra_label_112:
	li t2, 0
	sw t2, 316(sp)
# def t61, 1
Dijkstra_label_113:
	li t2, 1
	sw t2, 320(sp)
# mul t62, j_while_3, t61
Dijkstra_label_114:
	lw t0, 216(sp)
	lw t1, 320(sp)
	mul t2, t0, t1
	sw t2, 324(sp)
# add t60, t60, t62
Dijkstra_label_115:
	lw t0, 316(sp)
	lw t1, 324(sp)
	add t2, t0, t1
	sw t2, 316(sp)
# def t63, 0
Dijkstra_label_116:
	li t2, 0
	sw t2, 328(sp)
# def t64, 1
Dijkstra_label_117:
	li t2, 1
	sw t2, 332(sp)
# mul t65, min_index_while_3, t64
Dijkstra_label_118:
	lw t0, 128(sp)
	lw t1, 332(sp)
	mul t2, t0, t1
	sw t2, 336(sp)
# add t63, t63, t65
Dijkstra_label_119:
	lw t0, 328(sp)
	lw t1, 336(sp)
	add t2, t0, t1
	sw t2, 328(sp)
# load t66, dis_global_0, t63
Dijkstra_label_120:
	la t2, dis_global_0
	lw t1, 328(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 340(sp)
# def t67, 0
Dijkstra_label_121:
	li t2, 0
	sw t2, 344(sp)
# def t68, 16
Dijkstra_label_122:
	li t2, 16
	sw t2, 348(sp)
# mul t69, min_index_while_3, t68
Dijkstra_label_123:
	lw t0, 128(sp)
	lw t1, 348(sp)
	mul t2, t0, t1
	sw t2, 352(sp)
# add t67, t67, t69
Dijkstra_label_124:
	lw t0, 344(sp)
	lw t1, 352(sp)
	add t2, t0, t1
	sw t2, 344(sp)
# def t70, 1
Dijkstra_label_125:
	li t2, 1
	sw t2, 356(sp)
# mul t71, j_while_3, t70
Dijkstra_label_126:
	lw t0, 216(sp)
	lw t1, 356(sp)
	mul t2, t0, t1
	sw t2, 360(sp)
# add t67, t67, t71
Dijkstra_label_127:
	lw t0, 344(sp)
	lw t1, 360(sp)
	add t2, t0, t1
	sw t2, 344(sp)
# load t72, e_global_0, t67
Dijkstra_label_128:
	la t2, e_global_0
	lw t1, 344(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 364(sp)
# add t73, t66, t72
Dijkstra_label_129:
	lw t0, 340(sp)
	lw t1, 364(sp)
	add t2, t0, t1
	sw t2, 368(sp)
# store t73, dis_global_0, t60
Dijkstra_label_130:
	la t2, dis_global_0
	lw t1, 316(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 368(sp)
	sw t1, 0(t2)
# add t74, j_while_3, 1
Dijkstra_label_131:
	lw t0, 216(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 372(sp)
# mov j_while_3, t74
Dijkstra_label_132:
	lw t2, 372(sp)
	sw t2, 216(sp)
# goto [pc, -57]
Dijkstra_label_133:
	j Dijkstra_label_76
# add t75, i_Dijkstra_1, 1
Dijkstra_label_134:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 376(sp)
# mov i_Dijkstra_1, t75
Dijkstra_label_135:
	lw t2, 376(sp)
	sw t2, 52(sp)
# goto [pc, -107]
Dijkstra_label_136:
	j Dijkstra_label_29
# return null
Dijkstra_label_137:
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
	addi sp, sp, 976
	ret
main:
	addi sp, sp, -532
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
# def i_main_9, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# call t76, getint()
main_label_2:
	call getint
	sw a0, 56(sp)
# mov n_global_0, t76
main_label_3:
	lw t2, 56(sp)
	la t3, n_global_0
	sw t2, 0(t3)
# call t77, getint()
main_label_4:
	call getint
	sw a0, 60(sp)
# mov m_global_0, t77
main_label_5:
	lw t2, 60(sp)
	la t3, m_global_0
	sw t2, 0(t3)
# mov i_main_9, 1
main_label_6:
	li t2, 1
	sw t2, 52(sp)
# leq t78, i_main_9, n_global_0
main_label_7:
	lw t0, 52(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 64(sp)
# if t78 goto [pc, 2]
main_label_8:
	lw t0, 64(sp)
	bnez t0, main_label_10
# goto [pc, 32]
main_label_9:
	j main_label_41
# def j_while_10, 1
main_label_10:
	li t2, 1
	sw t2, 68(sp)
# leq t79, j_while_10, n_global_0
main_label_11:
	lw t0, 68(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 72(sp)
# if t79 goto [pc, 2]
main_label_12:
	lw t0, 72(sp)
	bnez t0, main_label_14
# goto [pc, 25]
main_label_13:
	j main_label_38
# eq t80, i_main_9, j_while_10
main_label_14:
	lw t0, 52(sp)
	lw t1, 68(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 76(sp)
# if t80 goto [pc, 2]
main_label_15:
	lw t0, 76(sp)
	bnez t0, main_label_17
# goto [pc, 9]
main_label_16:
	j main_label_25
# def t81, 0
main_label_17:
	li t2, 0
	sw t2, 80(sp)
# def t82, 16
main_label_18:
	li t2, 16
	sw t2, 84(sp)
# mul t83, i_main_9, t82
main_label_19:
	lw t0, 52(sp)
	lw t1, 84(sp)
	mul t2, t0, t1
	sw t2, 88(sp)
# add t81, t81, t83
main_label_20:
	lw t0, 80(sp)
	lw t1, 88(sp)
	add t2, t0, t1
	sw t2, 80(sp)
# def t84, 1
main_label_21:
	li t2, 1
	sw t2, 92(sp)
# mul t85, j_while_10, t84
main_label_22:
	lw t0, 68(sp)
	lw t1, 92(sp)
	mul t2, t0, t1
	sw t2, 96(sp)
# add t81, t81, t85
main_label_23:
	lw t0, 80(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 80(sp)
# store 0, e_global_0, t81
main_label_24:
	la t2, e_global_0
	lw t1, 80(sp)
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# if t80 goto [pc, 9]
main_label_25:
	lw t0, 76(sp)
	bnez t0, main_label_34
# def t86, 0
main_label_26:
	li t2, 0
	sw t2, 100(sp)
# def t87, 16
main_label_27:
	li t2, 16
	sw t2, 104(sp)
# mul t88, i_main_9, t87
main_label_28:
	lw t0, 52(sp)
	lw t1, 104(sp)
	mul t2, t0, t1
	sw t2, 108(sp)
# add t86, t86, t88
main_label_29:
	lw t0, 100(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 100(sp)
# def t89, 1
main_label_30:
	li t2, 1
	sw t2, 112(sp)
# mul t90, j_while_10, t89
main_label_31:
	lw t0, 68(sp)
	lw t1, 112(sp)
	mul t2, t0, t1
	sw t2, 116(sp)
# add t86, t86, t90
main_label_32:
	lw t0, 100(sp)
	lw t1, 116(sp)
	add t2, t0, t1
	sw t2, 100(sp)
# store INF_global_0, e_global_0, t86
main_label_33:
	la t2, e_global_0
	lw t1, 100(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, INF_global_0
	sw t1, 0(t2)
main_label_34:
	nop
# add t91, j_while_10, 1
main_label_35:
	lw t0, 68(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 120(sp)
# mov j_while_10, t91
main_label_36:
	lw t2, 120(sp)
	sw t2, 68(sp)
# goto [pc, -26]
main_label_37:
	j main_label_11
# add t92, i_main_9, 1
main_label_38:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 124(sp)
# mov i_main_9, t92
main_label_39:
	lw t2, 124(sp)
	sw t2, 52(sp)
# goto [pc, -33]
main_label_40:
	j main_label_7
# mov i_main_9, 1
main_label_41:
	li t2, 1
	sw t2, 52(sp)
# leq t93, i_main_9, m_global_0
main_label_42:
	lw t0, 52(sp)
	lw t1, m_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 128(sp)
# if t93 goto [pc, 2]
main_label_43:
	lw t0, 128(sp)
	bnez t0, main_label_45
# goto [pc, 17]
main_label_44:
	j main_label_61
# call t94, getint()
main_label_45:
	call getint
	sw a0, 132(sp)
# def u_while_12, t94
main_label_46:
	lw t2, 132(sp)
	sw t2, 136(sp)
# call t95, getint()
main_label_47:
	call getint
	sw a0, 140(sp)
# def v_while_12, t95
main_label_48:
	lw t2, 140(sp)
	sw t2, 144(sp)
# def t96, 0
main_label_49:
	li t2, 0
	sw t2, 148(sp)
# def t97, 16
main_label_50:
	li t2, 16
	sw t2, 152(sp)
# mul t98, u_while_12, t97
main_label_51:
	lw t0, 136(sp)
	lw t1, 152(sp)
	mul t2, t0, t1
	sw t2, 156(sp)
# add t96, t96, t98
main_label_52:
	lw t0, 148(sp)
	lw t1, 156(sp)
	add t2, t0, t1
	sw t2, 148(sp)
# def t99, 1
main_label_53:
	li t2, 1
	sw t2, 160(sp)
# mul t100, v_while_12, t99
main_label_54:
	lw t0, 144(sp)
	lw t1, 160(sp)
	mul t2, t0, t1
	sw t2, 164(sp)
# add t96, t96, t100
main_label_55:
	lw t0, 148(sp)
	lw t1, 164(sp)
	add t2, t0, t1
	sw t2, 148(sp)
# call t101, getint()
main_label_56:
	call getint
	sw a0, 168(sp)
# store t101, e_global_0, t96
main_label_57:
	la t2, e_global_0
	lw t1, 148(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 168(sp)
	sw t1, 0(t2)
# add t102, i_main_9, 1
main_label_58:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 172(sp)
# mov i_main_9, t102
main_label_59:
	lw t2, 172(sp)
	sw t2, 52(sp)
# goto [pc, -18]
main_label_60:
	j main_label_42
# call t103, Dijkstra()
main_label_61:
	call Dijkstra
# mov i_main_9, 1
main_label_62:
	li t2, 1
	sw t2, 52(sp)
# leq t104, i_main_9, n_global_0
main_label_63:
	lw t0, 52(sp)
	lw t1, n_global_0
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 176(sp)
# if t104 goto [pc, 2]
main_label_64:
	lw t0, 176(sp)
	bnez t0, main_label_66
# goto [pc, 11]
main_label_65:
	j main_label_76
# def t106, 0
main_label_66:
	li t2, 0
	sw t2, 180(sp)
# def t107, 1
main_label_67:
	li t2, 1
	sw t2, 184(sp)
# mul t108, i_main_9, t107
main_label_68:
	lw t0, 52(sp)
	lw t1, 184(sp)
	mul t2, t0, t1
	sw t2, 188(sp)
# add t106, t106, t108
main_label_69:
	lw t0, 180(sp)
	lw t1, 188(sp)
	add t2, t0, t1
	sw t2, 180(sp)
# load t109, dis_global_0, t106
main_label_70:
	la t2, dis_global_0
	lw t1, 180(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 192(sp)
# call t105, putint(t109)
main_label_71:
	sw a0, 196(sp)
	lw a0, 192(sp)
	call putint
	lw a0, 192(sp)
# call t110, putch(32)
main_label_72:
	li a0, 32
	call putch
# add t111, i_main_9, 1
main_label_73:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 200(sp)
# mov i_main_9, t111
main_label_74:
	lw t2, 200(sp)
	sw t2, 52(sp)
# goto [pc, -12]
main_label_75:
	j main_label_63
# call t112, putch(10)
main_label_76:
	li a0, 10
	call putch
# return 0
main_label_77:
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
	addi sp, sp, 532
	ret
