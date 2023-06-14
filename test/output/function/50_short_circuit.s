	.bss
	g_global_0: .word 0
	.text
	.globl main
	.align 2
func:
	addi sp, sp, -96
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
# add t0, g_global_0, n_func_1
func_label_0:
	lw t0, g_global_0
	lw t1, 52(sp)
	add t2, t0, t1
	sw t2, 56(sp)
# mov g_global_0, t0
func_label_1:
	lw t2, 56(sp)
	la t3, g_global_0
	sw t2, 0(t3)
# call t1, putint(g_global_0)
func_label_2:
	lw a0, g_global_0
	call putint
# return g_global_0
func_label_3:
	lw a0, g_global_0
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
	addi sp, sp, 96
	ret
main:
	addi sp, sp, -460
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
# def i_main_2, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# call t2, getint()
main_label_2:
	call getint
	sw a0, 56(sp)
# mov i_main_2, t2
main_label_3:
	lw t2, 56(sp)
	sw t2, 52(sp)
# gtr t3, i_main_2, 10
main_label_4:
	lw t0, 52(sp)
	li t1, 10
	slt t2, t1, t0
	sw t2, 60(sp)
# if t3 goto [pc, 3]
main_label_5:
	lw t0, 60(sp)
	bnez t0, main_label_8
# mov t5, 0
main_label_6:
	li t2, 0
	sw t2, 64(sp)
# goto [pc, 6]
main_label_7:
	j main_label_13
# call t4, func(i_main_2)
main_label_8:
	lw a0, 52(sp)
	call func
	sw a0, 68(sp)
# if t4 goto [pc, 3]
main_label_9:
	lw t0, 68(sp)
	bnez t0, main_label_12
# mov t5, 0
main_label_10:
	li t2, 0
	sw t2, 64(sp)
# goto [pc, 2]
main_label_11:
	j main_label_13
# mov t5, 1
main_label_12:
	li t2, 1
	sw t2, 64(sp)
# if t5 goto [pc, 2]
main_label_13:
	lw t0, 64(sp)
	bnez t0, main_label_15
# goto [pc, 2]
main_label_14:
	j main_label_16
# mov i_main_2, 1
main_label_15:
	li t2, 1
	sw t2, 52(sp)
# if t5 goto [pc, 2]
main_label_16:
	lw t0, 64(sp)
	bnez t0, main_label_18
# mov i_main_2, 0
main_label_17:
	li t2, 0
	sw t2, 52(sp)
main_label_18:
	nop
# call t6, getint()
main_label_19:
	call getint
	sw a0, 72(sp)
# mov i_main_2, t6
main_label_20:
	lw t2, 72(sp)
	sw t2, 52(sp)
# gtr t7, i_main_2, 11
main_label_21:
	lw t0, 52(sp)
	li t1, 11
	slt t2, t1, t0
	sw t2, 76(sp)
# if t7 goto [pc, 3]
main_label_22:
	lw t0, 76(sp)
	bnez t0, main_label_25
# mov t9, 0
main_label_23:
	li t2, 0
	sw t2, 80(sp)
# goto [pc, 6]
main_label_24:
	j main_label_30
# call t8, func(i_main_2)
main_label_25:
	lw a0, 52(sp)
	call func
	sw a0, 84(sp)
# if t8 goto [pc, 3]
main_label_26:
	lw t0, 84(sp)
	bnez t0, main_label_29
# mov t9, 0
main_label_27:
	li t2, 0
	sw t2, 80(sp)
# goto [pc, 2]
main_label_28:
	j main_label_30
# mov t9, 1
main_label_29:
	li t2, 1
	sw t2, 80(sp)
# if t9 goto [pc, 2]
main_label_30:
	lw t0, 80(sp)
	bnez t0, main_label_32
# goto [pc, 2]
main_label_31:
	j main_label_33
# mov i_main_2, 1
main_label_32:
	li t2, 1
	sw t2, 52(sp)
# if t9 goto [pc, 2]
main_label_33:
	lw t0, 80(sp)
	bnez t0, main_label_35
# mov i_main_2, 0
main_label_34:
	li t2, 0
	sw t2, 52(sp)
main_label_35:
	nop
# call t10, getint()
main_label_36:
	call getint
	sw a0, 88(sp)
# mov i_main_2, t10
main_label_37:
	lw t2, 88(sp)
	sw t2, 52(sp)
# leq t11, i_main_2, 99
main_label_38:
	lw t0, 52(sp)
	li t1, 99
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 92(sp)
# if t11 goto [pc, 5]
main_label_39:
	lw t0, 92(sp)
	bnez t0, main_label_44
# call t12, func(i_main_2)
main_label_40:
	lw a0, 52(sp)
	call func
	sw a0, 96(sp)
# if t12 goto [pc, 3]
main_label_41:
	lw t0, 96(sp)
	bnez t0, main_label_44
# mov t13, 0
main_label_42:
	li t2, 0
	sw t2, 100(sp)
# goto [pc, 2]
main_label_43:
	j main_label_45
# mov t13, 1
main_label_44:
	li t2, 1
	sw t2, 100(sp)
# if t13 goto [pc, 2]
main_label_45:
	lw t0, 100(sp)
	bnez t0, main_label_47
# goto [pc, 2]
main_label_46:
	j main_label_48
# mov i_main_2, 1
main_label_47:
	li t2, 1
	sw t2, 52(sp)
# if t13 goto [pc, 2]
main_label_48:
	lw t0, 100(sp)
	bnez t0, main_label_50
# mov i_main_2, 0
main_label_49:
	li t2, 0
	sw t2, 52(sp)
main_label_50:
	nop
# call t14, getint()
main_label_51:
	call getint
	sw a0, 104(sp)
# mov i_main_2, t14
main_label_52:
	lw t2, 104(sp)
	sw t2, 52(sp)
# leq t15, i_main_2, 100
main_label_53:
	lw t0, 52(sp)
	li t1, 100
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 108(sp)
# if t15 goto [pc, 5]
main_label_54:
	lw t0, 108(sp)
	bnez t0, main_label_59
# call t16, func(i_main_2)
main_label_55:
	lw a0, 52(sp)
	call func
	sw a0, 112(sp)
# if t16 goto [pc, 3]
main_label_56:
	lw t0, 112(sp)
	bnez t0, main_label_59
# mov t17, 0
main_label_57:
	li t2, 0
	sw t2, 116(sp)
# goto [pc, 2]
main_label_58:
	j main_label_60
# mov t17, 1
main_label_59:
	li t2, 1
	sw t2, 116(sp)
# if t17 goto [pc, 2]
main_label_60:
	lw t0, 116(sp)
	bnez t0, main_label_62
# goto [pc, 2]
main_label_61:
	j main_label_63
# mov i_main_2, 1
main_label_62:
	li t2, 1
	sw t2, 52(sp)
# if t17 goto [pc, 2]
main_label_63:
	lw t0, 116(sp)
	bnez t0, main_label_65
# mov i_main_2, 0
main_label_64:
	li t2, 0
	sw t2, 52(sp)
main_label_65:
	nop
# call t18, func(99)
main_label_66:
	li a0, 99
	call func
	sw a0, 120(sp)
# not t19, t18
main_label_67:
	lw t0, 120(sp)
	seqz t2, t0
	sw t2, 124(sp)
# if t19 goto [pc, 3]
main_label_68:
	lw t0, 124(sp)
	bnez t0, main_label_71
# mov t21, 0
main_label_69:
	li t2, 0
	sw t2, 128(sp)
# goto [pc, 6]
main_label_70:
	j main_label_76
# call t20, func(100)
main_label_71:
	li a0, 100
	call func
	sw a0, 132(sp)
# if t20 goto [pc, 3]
main_label_72:
	lw t0, 132(sp)
	bnez t0, main_label_75
# mov t21, 0
main_label_73:
	li t2, 0
	sw t2, 128(sp)
# goto [pc, 2]
main_label_74:
	j main_label_76
# mov t21, 1
main_label_75:
	li t2, 1
	sw t2, 128(sp)
# if t21 goto [pc, 2]
main_label_76:
	lw t0, 128(sp)
	bnez t0, main_label_78
# goto [pc, 2]
main_label_77:
	j main_label_79
# mov i_main_2, 1
main_label_78:
	li t2, 1
	sw t2, 52(sp)
# if t21 goto [pc, 2]
main_label_79:
	lw t0, 128(sp)
	bnez t0, main_label_81
# mov i_main_2, 0
main_label_80:
	li t2, 0
	sw t2, 52(sp)
main_label_81:
	nop
# return 0
main_label_82:
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
	addi sp, sp, 460
	ret
