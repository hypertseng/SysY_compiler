	.data
	ascii_0_global_0: .word 48
	.text
	.globl main
	.align 2
my_getint:
	addi sp, sp, -224
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
# def sum_my_getint_1, 0
my_getint_label_0:
	li t2, 0
	sw t2, 52(sp)
# def c_my_getint_1, 0
my_getint_label_1:
	li t2, 0
	sw t2, 56(sp)
# if 1 goto [pc, 2]
my_getint_label_2:
	li t0, 1
	bnez t0, my_getint_label_4
# goto [pc, 18]
my_getint_label_3:
	j my_getint_label_21
# call t0, getch()
my_getint_label_4:
	call getch
	sw a0, 60(sp)
# sub t1, t0, ascii_0_global_0
my_getint_label_5:
	lw t0, 60(sp)
	lw t1, ascii_0_global_0
	sub t2, t0, t1
	sw t2, 64(sp)
# mov c_my_getint_1, t1
my_getint_label_6:
	lw t2, 64(sp)
	sw t2, 56(sp)
# lss t2, c_my_getint_1, 0
my_getint_label_7:
	lw t0, 56(sp)
	li t1, 0
	slt t2, t0, t1
	sw t2, 68(sp)
# if t2 goto [pc, 5]
my_getint_label_8:
	lw t0, 68(sp)
	bnez t0, my_getint_label_13
# gtr t3, c_my_getint_1, 9
my_getint_label_9:
	lw t0, 56(sp)
	li t1, 9
	slt t2, t1, t0
	sw t2, 72(sp)
# if t3 goto [pc, 3]
my_getint_label_10:
	lw t0, 72(sp)
	bnez t0, my_getint_label_13
# mov t4, 0
my_getint_label_11:
	li t2, 0
	sw t2, 76(sp)
# goto [pc, 2]
my_getint_label_12:
	j my_getint_label_14
# mov t4, 1
my_getint_label_13:
	li t2, 1
	sw t2, 76(sp)
# if t4 goto [pc, 2]
my_getint_label_14:
	lw t0, 76(sp)
	bnez t0, my_getint_label_16
# goto [pc, 2]
my_getint_label_15:
	j my_getint_label_17
# goto [pc, -12]
my_getint_label_16:
	j my_getint_label_4
# if t4 goto [pc, 2]
my_getint_label_17:
	lw t0, 76(sp)
	bnez t0, my_getint_label_19
# goto [pc, 3]
my_getint_label_18:
	j my_getint_label_21
my_getint_label_19:
	nop
# goto [pc, -18]
my_getint_label_20:
	j my_getint_label_2
# mov sum_my_getint_1, c_my_getint_1
my_getint_label_21:
	lw t2, 56(sp)
	sw t2, 52(sp)
# if 1 goto [pc, 2]
my_getint_label_22:
	li t0, 1
	bnez t0, my_getint_label_24
# goto [pc, 22]
my_getint_label_23:
	j my_getint_label_45
# call t5, getch()
my_getint_label_24:
	call getch
	sw a0, 80(sp)
# sub t6, t5, ascii_0_global_0
my_getint_label_25:
	lw t0, 80(sp)
	lw t1, ascii_0_global_0
	sub t2, t0, t1
	sw t2, 84(sp)
# mov c_my_getint_1, t6
my_getint_label_26:
	lw t2, 84(sp)
	sw t2, 56(sp)
# geq t7, c_my_getint_1, 0
my_getint_label_27:
	lw t0, 56(sp)
	li t1, 0
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 88(sp)
# if t7 goto [pc, 3]
my_getint_label_28:
	lw t0, 88(sp)
	bnez t0, my_getint_label_31
# mov t9, 0
my_getint_label_29:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 6]
my_getint_label_30:
	j my_getint_label_36
# leq t8, c_my_getint_1, 9
my_getint_label_31:
	lw t0, 56(sp)
	li t1, 9
	slt t2, t1, t0
	xori t2, t2, 1
	sw t2, 96(sp)
# if t8 goto [pc, 3]
my_getint_label_32:
	lw t0, 96(sp)
	bnez t0, my_getint_label_35
# mov t9, 0
my_getint_label_33:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 2]
my_getint_label_34:
	j my_getint_label_36
# mov t9, 1
my_getint_label_35:
	li t2, 1
	sw t2, 92(sp)
# if t9 goto [pc, 2]
my_getint_label_36:
	lw t0, 92(sp)
	bnez t0, my_getint_label_38
# goto [pc, 4]
my_getint_label_37:
	j my_getint_label_41
# mul t10, sum_my_getint_1, 10
my_getint_label_38:
	lw t0, 52(sp)
	li t1, 10
	mul t2, t0, t1
	sw t2, 100(sp)
# add t11, t10, c_my_getint_1
my_getint_label_39:
	lw t0, 100(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 104(sp)
# mov sum_my_getint_1, t11
my_getint_label_40:
	lw t2, 104(sp)
	sw t2, 52(sp)
# if t9 goto [pc, 2]
my_getint_label_41:
	lw t0, 92(sp)
	bnez t0, my_getint_label_43
# goto [pc, 3]
my_getint_label_42:
	j my_getint_label_45
my_getint_label_43:
	nop
# goto [pc, -22]
my_getint_label_44:
	j my_getint_label_22
# return sum_my_getint_1
my_getint_label_45:
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
	addi sp, sp, 224
	ret
my_putint:
	addi sp, sp, -436
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
# alloc b_my_putint_8, 16
my_putint_label_0:
# def i_my_putint_8, 0
my_putint_label_1:
	li t2, 0
	sw t2, 120(sp)
# gtr t12, a_my_putint_8, 0
my_putint_label_2:
	lw t0, 52(sp)
	li t1, 0
	slt t2, t1, t0
	sw t2, 124(sp)
# if t12 goto [pc, 2]
my_putint_label_3:
	lw t0, 124(sp)
	bnez t0, my_putint_label_5
# goto [pc, 13]
my_putint_label_4:
	j my_putint_label_17
# def t13, 0
my_putint_label_5:
	li t2, 0
	sw t2, 128(sp)
# def t14, 1
my_putint_label_6:
	li t2, 1
	sw t2, 132(sp)
# mul t15, i_my_putint_8, t14
my_putint_label_7:
	lw t0, 120(sp)
	lw t1, 132(sp)
	mul t2, t0, t1
	sw t2, 136(sp)
# add t13, t13, t15
my_putint_label_8:
	lw t0, 128(sp)
	lw t1, 136(sp)
	add t2, t0, t1
	sw t2, 128(sp)
# mod t16, a_my_putint_8, 10
my_putint_label_9:
	lw t0, 52(sp)
	li t1, 10
	rem t2, t0, t1
	sw t2, 140(sp)
# add t17, t16, ascii_0_global_0
my_putint_label_10:
	lw t0, 140(sp)
	lw t1, ascii_0_global_0
	add t2, t0, t1
	sw t2, 144(sp)
# store t17, b_my_putint_8, t13
my_putint_label_11:
	addi t2, sp, 56
	lw t1, 128(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 144(sp)
	sw t1, 0(t2)
# div t18, a_my_putint_8, 10
my_putint_label_12:
	lw t0, 52(sp)
	li t1, 10
	div t2, t0, t1
	sw t2, 148(sp)
# mov a_my_putint_8, t18
my_putint_label_13:
	lw t2, 148(sp)
	sw t2, 52(sp)
# add t19, i_my_putint_8, 1
my_putint_label_14:
	lw t0, 120(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 152(sp)
# mov i_my_putint_8, t19
my_putint_label_15:
	lw t2, 152(sp)
	sw t2, 120(sp)
# goto [pc, -14]
my_putint_label_16:
	j my_putint_label_2
# gtr t20, i_my_putint_8, 0
my_putint_label_17:
	lw t0, 120(sp)
	li t1, 0
	slt t2, t1, t0
	sw t2, 156(sp)
# if t20 goto [pc, 2]
my_putint_label_18:
	lw t0, 156(sp)
	bnez t0, my_putint_label_20
# goto [pc, 10]
my_putint_label_19:
	j my_putint_label_29
# sub t21, i_my_putint_8, 1
my_putint_label_20:
	lw t0, 120(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 160(sp)
# mov i_my_putint_8, t21
my_putint_label_21:
	lw t2, 160(sp)
	sw t2, 120(sp)
# def t23, 0
my_putint_label_22:
	li t2, 0
	sw t2, 164(sp)
# def t24, 1
my_putint_label_23:
	li t2, 1
	sw t2, 168(sp)
# mul t25, i_my_putint_8, t24
my_putint_label_24:
	lw t0, 120(sp)
	lw t1, 168(sp)
	mul t2, t0, t1
	sw t2, 172(sp)
# add t23, t23, t25
my_putint_label_25:
	lw t0, 164(sp)
	lw t1, 172(sp)
	add t2, t0, t1
	sw t2, 164(sp)
# load t26, b_my_putint_8, t23
my_putint_label_26:
	addi t2, sp, 56
	lw t1, 164(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 176(sp)
# call t22, putch(t26)
my_putint_label_27:
	lw a0, 176(sp)
	call putch
# goto [pc, -11]
my_putint_label_28:
	j my_putint_label_17
# return null
my_putint_label_29:
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
	addi sp, sp, 436
	ret
main:
	addi sp, sp, -136
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
# call t27, my_getint()
main_label_1:
	call my_getint
	sw a0, 52(sp)
# def n_main_11, t27
main_label_2:
	lw t2, 52(sp)
	sw t2, 56(sp)
# gtr t28, n_main_11, 0
main_label_3:
	lw t0, 56(sp)
	li t1, 0
	slt t2, t1, t0
	sw t2, 60(sp)
# if t28 goto [pc, 2]
main_label_4:
	lw t0, 60(sp)
	bnez t0, main_label_6
# goto [pc, 8]
main_label_5:
	j main_label_13
# call t29, my_getint()
main_label_6:
	call my_getint
	sw a0, 64(sp)
# def m_while_12, t29
main_label_7:
	lw t2, 64(sp)
	sw t2, 68(sp)
# call t30, my_putint(m_while_12)
main_label_8:
	lw a0, 68(sp)
	call my_putint
# call t31, putch(10)
main_label_9:
	li a0, 10
	call putch
# sub t32, n_main_11, 1
main_label_10:
	lw t0, 56(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 72(sp)
# mov n_main_11, t32
main_label_11:
	lw t2, 72(sp)
	sw t2, 56(sp)
# goto [pc, -9]
main_label_12:
	j main_label_3
# return 0
main_label_13:
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
	addi sp, sp, 136
	ret
