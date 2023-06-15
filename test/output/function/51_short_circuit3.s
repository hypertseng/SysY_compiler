	.bss
	a_global_0: .word 0
	b_global_0: .word 0
	d_global_0: .word 0
	.text
	.globl main
	.align 2
set_a:
	addi sp, sp, -64
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
# mov a_global_0, val_set_a_1
set_a_label_0:
	lw t2, 52(sp)
	la t3, a_global_0
	sw t2, 0(t3)
# return a_global_0
set_a_label_1:
	lw a0, a_global_0
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
	addi sp, sp, 64
	ret
set_b:
	addi sp, sp, -64
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
# mov b_global_0, val_set_b_2
set_b_label_0:
	lw t2, 52(sp)
	la t3, b_global_0
	sw t2, 0(t3)
# return b_global_0
set_b_label_1:
	lw a0, b_global_0
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
	addi sp, sp, 64
	ret
set_d:
	addi sp, sp, -64
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
# mov d_global_0, val_set_d_3
set_d_label_0:
	lw t2, 52(sp)
	la t3, d_global_0
	sw t2, 0(t3)
# return d_global_0
set_d_label_1:
	lw a0, d_global_0
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
	addi sp, sp, 64
	ret
main:
	addi sp, sp, -1200
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
# mov a_global_0, 2
main_label_1:
	li t2, 2
	la t3, a_global_0
	sw t2, 0(t3)
# mov b_global_0, 3
main_label_2:
	li t2, 3
	la t3, b_global_0
	sw t2, 0(t3)
# call t0, set_a(0)
main_label_3:
	li a0, 0
	call set_a
	sw a0, 52(sp)
# if t0 goto [pc, 3]
main_label_4:
	lw t0, 52(sp)
	bnez t0, main_label_7
# mov t2, 0
main_label_5:
	li t2, 0
	sw t2, 56(sp)
# goto [pc, 6]
main_label_6:
	j main_label_12
# call t1, set_b(1)
main_label_7:
	li a0, 1
	call set_b
	sw a0, 60(sp)
# if t1 goto [pc, 3]
main_label_8:
	lw t0, 60(sp)
	bnez t0, main_label_11
# mov t2, 0
main_label_9:
	li t2, 0
	sw t2, 56(sp)
# goto [pc, 2]
main_label_10:
	j main_label_12
# mov t2, 1
main_label_11:
	li t2, 1
	sw t2, 56(sp)
# if t2 goto [pc, 2]
main_label_12:
	lw t0, 56(sp)
	bnez t0, main_label_14
# goto [pc, 1]
main_label_13:
	j main_label_14
# call t3, putint(a_global_0)
main_label_14:
	lw a0, a_global_0
	call putint
	lw a0, -1(sp)
# call t4, putch(32)
main_label_15:
	li a0, 32
	call putch
# call t5, putint(b_global_0)
main_label_16:
	lw a0, b_global_0
	call putint
	lw a0, -1(sp)
# call t6, putch(32)
main_label_17:
	li a0, 32
	call putch
# mov a_global_0, 2
main_label_18:
	li t2, 2
	la t3, a_global_0
	sw t2, 0(t3)
# mov b_global_0, 3
main_label_19:
	li t2, 3
	la t3, b_global_0
	sw t2, 0(t3)
# call t7, set_a(0)
main_label_20:
	li a0, 0
	call set_a
	sw a0, 64(sp)
# if t7 goto [pc, 3]
main_label_21:
	lw t0, 64(sp)
	bnez t0, main_label_24
# mov t9, 0
main_label_22:
	li t2, 0
	sw t2, 68(sp)
# goto [pc, 6]
main_label_23:
	j main_label_29
# call t8, set_b(1)
main_label_24:
	li a0, 1
	call set_b
	sw a0, 72(sp)
# if t8 goto [pc, 3]
main_label_25:
	lw t0, 72(sp)
	bnez t0, main_label_28
# mov t9, 0
main_label_26:
	li t2, 0
	sw t2, 68(sp)
# goto [pc, 2]
main_label_27:
	j main_label_29
# mov t9, 1
main_label_28:
	li t2, 1
	sw t2, 68(sp)
# if t9 goto [pc, 2]
main_label_29:
	lw t0, 68(sp)
	bnez t0, main_label_31
# goto [pc, 1]
main_label_30:
	j main_label_31
# call t10, putint(a_global_0)
main_label_31:
	lw a0, a_global_0
	call putint
	lw a0, -1(sp)
# call t11, putch(32)
main_label_32:
	li a0, 32
	call putch
# call t12, putint(b_global_0)
main_label_33:
	lw a0, b_global_0
	call putint
	lw a0, -1(sp)
# call t13, putch(10)
main_label_34:
	li a0, 10
	call putch
# def c_main_4, 1
main_label_35:
	li t2, 1
	sw t2, 76(sp)
# mov d_global_0, 2
main_label_36:
	li t2, 2
	la t3, d_global_0
	sw t2, 0(t3)
# geq t14, c_main_4, 1
main_label_37:
	lw t0, 76(sp)
	li t1, 1
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 80(sp)
# if t14 goto [pc, 3]
main_label_38:
	lw t0, 80(sp)
	bnez t0, main_label_41
# mov t16, 0
main_label_39:
	li t2, 0
	sw t2, 84(sp)
# goto [pc, 6]
main_label_40:
	j main_label_46
# call t15, set_d(3)
main_label_41:
	li a0, 3
	call set_d
	sw a0, 88(sp)
# if t15 goto [pc, 3]
main_label_42:
	lw t0, 88(sp)
	bnez t0, main_label_45
# mov t16, 0
main_label_43:
	li t2, 0
	sw t2, 84(sp)
# goto [pc, 2]
main_label_44:
	j main_label_46
# mov t16, 1
main_label_45:
	li t2, 1
	sw t2, 84(sp)
# if t16 goto [pc, 2]
main_label_46:
	lw t0, 84(sp)
	bnez t0, main_label_48
# goto [pc, 1]
main_label_47:
	j main_label_48
# call t17, putint(d_global_0)
main_label_48:
	lw a0, d_global_0
	call putint
	lw a0, -1(sp)
# call t18, putch(32)
main_label_49:
	li a0, 32
	call putch
# leq t19, c_main_4, 1
main_label_50:
	lw t0, 76(sp)
	li t1, 1
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 92(sp)
# if t19 goto [pc, 5]
main_label_51:
	lw t0, 92(sp)
	bnez t0, main_label_56
# call t20, set_d(4)
main_label_52:
	li a0, 4
	call set_d
	sw a0, 96(sp)
# if t20 goto [pc, 3]
main_label_53:
	lw t0, 96(sp)
	bnez t0, main_label_56
# mov t21, 0
main_label_54:
	li t2, 0
	sw t2, 100(sp)
# goto [pc, 2]
main_label_55:
	j main_label_57
# mov t21, 1
main_label_56:
	li t2, 1
	sw t2, 100(sp)
# if t21 goto [pc, 2]
main_label_57:
	lw t0, 100(sp)
	bnez t0, main_label_59
# goto [pc, 1]
main_label_58:
	j main_label_59
# call t22, putint(d_global_0)
main_label_59:
	lw a0, d_global_0
	call putint
	lw a0, -1(sp)
# call t23, putch(10)
main_label_60:
	li a0, 10
	call putch
# add t24, 2, 1
main_label_61:
	li t0, 2
	li t1, 1
	add t2, t0, t1
	sw t2, 104(sp)
# sub t25, 3, t24
main_label_62:
	li t0, 3
	lw t1, 104(sp)
	sub t2, t0, t1
	sw t2, 108(sp)
# geq t26, 16, t25
main_label_63:
	li t0, 16
	lw t1, 108(sp)
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 112(sp)
# if t26 goto [pc, 2]
main_label_64:
	lw t0, 112(sp)
	bnez t0, main_label_66
# goto [pc, 2]
main_label_65:
	j main_label_67
# call t27, putch(65)
main_label_66:
	li a0, 65
	call putch
# sub t28, 25, 7
main_label_67:
	li t0, 25
	li t1, 7
	sub t2, t0, t1
	sw t2, 116(sp)
# mul t29, 6, 3
main_label_68:
	li t0, 6
	li t1, 3
	mul t2, t0, t1
	sw t2, 120(sp)
# sub t30, 36, t29
main_label_69:
	li t0, 36
	lw t1, 120(sp)
	sub t2, t0, t1
	sw t2, 124(sp)
# neq t31, t28, t30
main_label_70:
	lw t0, 116(sp)
	lw t1, 124(sp)
	xor t2, t0, t1
	snez t2, t2
	sw t2, 128(sp)
# if t31 goto [pc, 2]
main_label_71:
	lw t0, 128(sp)
	bnez t0, main_label_73
# goto [pc, 2]
main_label_72:
	j main_label_74
# call t32, putch(66)
main_label_73:
	li a0, 66
	call putch
# lss t33, 1, 8
main_label_74:
	li t0, 1
	li t1, 8
	slt t2, t0, t1
	sw t2, 132(sp)
# mod t34, 7, 2
main_label_75:
	li t0, 7
	li t1, 2
	rem t2, t0, t1
	sw t2, 136(sp)
# neq t35, t33, t34
main_label_76:
	lw t0, 132(sp)
	lw t1, 136(sp)
	xor t2, t0, t1
	snez t2, t2
	sw t2, 140(sp)
# if t35 goto [pc, 2]
main_label_77:
	lw t0, 140(sp)
	bnez t0, main_label_79
# goto [pc, 2]
main_label_78:
	j main_label_80
# call t36, putch(67)
main_label_79:
	li a0, 67
	call putch
# gtr t37, 3, 4
main_label_80:
	li t0, 3
	li t1, 4
	slt t2, t1, t0
	sw t2, 144(sp)
# eq t38, t37, 0
main_label_81:
	lw t0, 144(sp)
	li t1, 0
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 148(sp)
# if t38 goto [pc, 2]
main_label_82:
	lw t0, 148(sp)
	bnez t0, main_label_84
# goto [pc, 2]
main_label_83:
	j main_label_85
# call t39, putch(68)
main_label_84:
	li a0, 68
	call putch
# leq t40, 0x66, 077
main_label_85:
	li t0, 0x66
	li t1, 077
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 152(sp)
# eq t41, 1, t40
main_label_86:
	li t0, 1
	lw t1, 152(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 156(sp)
# if t41 goto [pc, 2]
main_label_87:
	lw t0, 156(sp)
	bnez t0, main_label_89
# goto [pc, 2]
main_label_88:
	j main_label_90
# call t42, putch(69)
main_label_89:
	li a0, 69
	call putch
# sub t43, 5, 6
main_label_90:
	li t0, 5
	li t1, 6
	sub t2, t0, t1
	sw t2, 160(sp)
# not t44, 0
main_label_91:
	li t0, 0
	seqz t2, t0
	sw t2, 164(sp)
# mov t45, 0
main_label_92:
	li t2, 0
	sw t2, 168(sp)
# sub t45, t45, t44
main_label_93:
	lw t0, 168(sp)
	lw t1, 164(sp)
	sub t2, t0, t1
	sw t2, 168(sp)
# eq t46, t43, t45
main_label_94:
	lw t0, 160(sp)
	lw t1, 168(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 172(sp)
# if t46 goto [pc, 2]
main_label_95:
	lw t0, 172(sp)
	bnez t0, main_label_97
# goto [pc, 2]
main_label_96:
	j main_label_98
# call t47, putch(70)
main_label_97:
	li a0, 70
	call putch
# call t48, putch(10)
main_label_98:
	li a0, 10
	call putch
# def i0_main_4, 0
main_label_99:
	li t2, 0
	sw t2, 176(sp)
# def i1_main_4, 1
main_label_100:
	li t2, 1
	sw t2, 180(sp)
# def i2_main_4, 2
main_label_101:
	li t2, 2
	sw t2, 184(sp)
# def i3_main_4, 3
main_label_102:
	li t2, 3
	sw t2, 188(sp)
# def i4_main_4, 4
main_label_103:
	li t2, 4
	sw t2, 192(sp)
# if i0_main_4 goto [pc, 3]
main_label_104:
	lw t0, 176(sp)
	bnez t0, main_label_107
# mov t49, 0
main_label_105:
	li t2, 0
	sw t2, 196(sp)
# goto [pc, 5]
main_label_106:
	j main_label_111
# if i1_main_4 goto [pc, 3]
main_label_107:
	lw t0, 180(sp)
	bnez t0, main_label_110
# mov t49, 0
main_label_108:
	li t2, 0
	sw t2, 196(sp)
# goto [pc, 2]
main_label_109:
	j main_label_111
# mov t49, 1
main_label_110:
	li t2, 1
	sw t2, 196(sp)
# if t49 goto [pc, 2]
main_label_111:
	lw t0, 196(sp)
	bnez t0, main_label_113
# goto [pc, 3]
main_label_112:
	j main_label_115
# call t50, putch(32)
main_label_113:
	li a0, 32
	call putch
# goto [pc, -10]
main_label_114:
	j main_label_104
# if i0_main_4 goto [pc, 4]
main_label_115:
	lw t0, 176(sp)
	bnez t0, main_label_119
# if i1_main_4 goto [pc, 3]
main_label_116:
	lw t0, 180(sp)
	bnez t0, main_label_119
# mov t51, 0
main_label_117:
	li t2, 0
	sw t2, 200(sp)
# goto [pc, 2]
main_label_118:
	j main_label_120
# mov t51, 1
main_label_119:
	li t2, 1
	sw t2, 200(sp)
# if t51 goto [pc, 2]
main_label_120:
	lw t0, 200(sp)
	bnez t0, main_label_122
# goto [pc, 2]
main_label_121:
	j main_label_123
# call t52, putch(67)
main_label_122:
	li a0, 67
	call putch
# geq t53, i0_main_4, i1_main_4
main_label_123:
	lw t0, 176(sp)
	lw t1, 180(sp)
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 204(sp)
# if t53 goto [pc, 5]
main_label_124:
	lw t0, 204(sp)
	bnez t0, main_label_129
# leq t54, i1_main_4, i0_main_4
main_label_125:
	lw t0, 180(sp)
	lw t1, 176(sp)
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 208(sp)
# if t54 goto [pc, 3]
main_label_126:
	lw t0, 208(sp)
	bnez t0, main_label_129
# mov t55, 0
main_label_127:
	li t2, 0
	sw t2, 212(sp)
# goto [pc, 2]
main_label_128:
	j main_label_130
# mov t55, 1
main_label_129:
	li t2, 1
	sw t2, 212(sp)
# if t55 goto [pc, 2]
main_label_130:
	lw t0, 212(sp)
	bnez t0, main_label_132
# goto [pc, 2]
main_label_131:
	j main_label_133
# call t56, putch(72)
main_label_132:
	li a0, 72
	call putch
# geq t57, i2_main_4, i1_main_4
main_label_133:
	lw t0, 184(sp)
	lw t1, 180(sp)
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 216(sp)
# if t57 goto [pc, 3]
main_label_134:
	lw t0, 216(sp)
	bnez t0, main_label_137
# mov t59, 0
main_label_135:
	li t2, 0
	sw t2, 220(sp)
# goto [pc, 6]
main_label_136:
	j main_label_142
# neq t58, i4_main_4, i3_main_4
main_label_137:
	lw t0, 192(sp)
	lw t1, 188(sp)
	xor t2, t0, t1
	snez t2, t2
	sw t2, 224(sp)
# if t58 goto [pc, 3]
main_label_138:
	lw t0, 224(sp)
	bnez t0, main_label_141
# mov t59, 0
main_label_139:
	li t2, 0
	sw t2, 220(sp)
# goto [pc, 2]
main_label_140:
	j main_label_142
# mov t59, 1
main_label_141:
	li t2, 1
	sw t2, 220(sp)
# if t59 goto [pc, 2]
main_label_142:
	lw t0, 220(sp)
	bnez t0, main_label_144
# goto [pc, 2]
main_label_143:
	j main_label_145
# call t60, putch(73)
main_label_144:
	li a0, 73
	call putch
# not t61, i1_main_4
main_label_145:
	lw t0, 180(sp)
	seqz t2, t0
	sw t2, 228(sp)
# eq t62, i0_main_4, t61
main_label_146:
	lw t0, 176(sp)
	lw t1, 228(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 232(sp)
# if t62 goto [pc, 3]
main_label_147:
	lw t0, 232(sp)
	bnez t0, main_label_150
# mov t64, 0
main_label_148:
	li t2, 0
	sw t2, 236(sp)
# goto [pc, 6]
main_label_149:
	j main_label_155
# lss t63, i3_main_4, i3_main_4
main_label_150:
	lw t0, 188(sp)
	lw t1, 188(sp)
	slt t2, t0, t1
	sw t2, 240(sp)
# if t63 goto [pc, 3]
main_label_151:
	lw t0, 240(sp)
	bnez t0, main_label_154
# mov t64, 0
main_label_152:
	li t2, 0
	sw t2, 236(sp)
# goto [pc, 2]
main_label_153:
	j main_label_155
# mov t64, 1
main_label_154:
	li t2, 1
	sw t2, 236(sp)
# if t64 goto [pc, 5]
main_label_155:
	lw t0, 236(sp)
	bnez t0, main_label_160
# geq t65, i4_main_4, i4_main_4
main_label_156:
	lw t0, 192(sp)
	lw t1, 192(sp)
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 244(sp)
# if t65 goto [pc, 3]
main_label_157:
	lw t0, 244(sp)
	bnez t0, main_label_160
# mov t66, 0
main_label_158:
	li t2, 0
	sw t2, 248(sp)
# goto [pc, 2]
main_label_159:
	j main_label_161
# mov t66, 1
main_label_160:
	li t2, 1
	sw t2, 248(sp)
# if t66 goto [pc, 2]
main_label_161:
	lw t0, 248(sp)
	bnez t0, main_label_163
# goto [pc, 2]
main_label_162:
	j main_label_164
# call t67, putch(74)
main_label_163:
	li a0, 74
	call putch
# not t68, i1_main_4
main_label_164:
	lw t0, 180(sp)
	seqz t2, t0
	sw t2, 252(sp)
# eq t69, i0_main_4, t68
main_label_165:
	lw t0, 176(sp)
	lw t1, 252(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 256(sp)
# if t69 goto [pc, 13]
main_label_166:
	lw t0, 256(sp)
	bnez t0, main_label_179
# lss t70, i3_main_4, i3_main_4
main_label_167:
	lw t0, 188(sp)
	lw t1, 188(sp)
	slt t2, t0, t1
	sw t2, 260(sp)
# if t70 goto [pc, 3]
main_label_168:
	lw t0, 260(sp)
	bnez t0, main_label_171
# mov t72, 0
main_label_169:
	li t2, 0
	sw t2, 264(sp)
# goto [pc, 6]
main_label_170:
	j main_label_176
# geq t71, i4_main_4, i4_main_4
main_label_171:
	lw t0, 192(sp)
	lw t1, 192(sp)
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 268(sp)
# if t71 goto [pc, 3]
main_label_172:
	lw t0, 268(sp)
	bnez t0, main_label_175
# mov t72, 0
main_label_173:
	li t2, 0
	sw t2, 264(sp)
# goto [pc, 2]
main_label_174:
	j main_label_176
# mov t72, 1
main_label_175:
	li t2, 1
	sw t2, 264(sp)
# if t72 goto [pc, 3]
main_label_176:
	lw t0, 264(sp)
	bnez t0, main_label_179
# mov t73, 0
main_label_177:
	li t2, 0
	sw t2, 272(sp)
# goto [pc, 2]
main_label_178:
	j main_label_180
# mov t73, 1
main_label_179:
	li t2, 1
	sw t2, 272(sp)
# if t73 goto [pc, 2]
main_label_180:
	lw t0, 272(sp)
	bnez t0, main_label_182
# goto [pc, 2]
main_label_181:
	j main_label_183
# call t74, putch(75)
main_label_182:
	li a0, 75
	call putch
# call t75, putch(10)
main_label_183:
	li a0, 10
	call putch
# return 0
main_label_184:
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
	addi sp, sp, 1200
	ret
