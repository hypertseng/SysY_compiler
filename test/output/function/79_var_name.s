	.text
	.globl main
	.align 2
main:
	addi sp, sp, -588
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
# def a_main_1, 2
main_label_1:
	li t2, 2
	sw t2, 52(sp)
# def b_main_1, 20
main_label_2:
	li t2, 20
	sw t2, 56(sp)
# alloc c_main_1, 20
main_label_3:
# store 1, c_main_1, 0
main_label_4:
	li t2, 1
	sw t2, 60(sp)
# store 2, c_main_1, 1
main_label_5:
	li t2, 2
	sw t2, 64(sp)
# store 0, c_main_1, 2
main_label_6:
	li t2, 0
	sw t2, 68(sp)
# store 0, c_main_1, 3
main_label_7:
	li t2, 0
	sw t2, 72(sp)
# store 0, c_main_1, 4
main_label_8:
	li t2, 0
	sw t2, 76(sp)
# store 0, c_main_1, 5
main_label_9:
	li t2, 0
	sw t2, 80(sp)
# store 0, c_main_1, 6
main_label_10:
	li t2, 0
	sw t2, 84(sp)
# store 0, c_main_1, 7
main_label_11:
	li t2, 0
	sw t2, 88(sp)
# store 0, c_main_1, 8
main_label_12:
	li t2, 0
	sw t2, 92(sp)
# store 0, c_main_1, 9
main_label_13:
	li t2, 0
	sw t2, 96(sp)
# store 0, c_main_1, 10
main_label_14:
	li t2, 0
	sw t2, 100(sp)
# store 0, c_main_1, 11
main_label_15:
	li t2, 0
	sw t2, 104(sp)
# store 0, c_main_1, 12
main_label_16:
	li t2, 0
	sw t2, 108(sp)
# store 0, c_main_1, 13
main_label_17:
	li t2, 0
	sw t2, 112(sp)
# store 0, c_main_1, 14
main_label_18:
	li t2, 0
	sw t2, 116(sp)
# store 0, c_main_1, 15
main_label_19:
	li t2, 0
	sw t2, 120(sp)
# store 0, c_main_1, 16
main_label_20:
	li t2, 0
	sw t2, 124(sp)
# store 0, c_main_1, 17
main_label_21:
	li t2, 0
	sw t2, 128(sp)
# store 0, c_main_1, 18
main_label_22:
	li t2, 0
	sw t2, 132(sp)
# store 0, c_main_1, 19
main_label_23:
	li t2, 0
	sw t2, 136(sp)
# def d_main_1, 0
main_label_24:
	li t2, 0
	sw t2, 140(sp)
# lss t0, a_main_1, b_main_1
main_label_25:
	lw t0, 52(sp)
	lw t1, 56(sp)
	slt t2, t0, t1
	sw t2, 144(sp)
# if t0 goto [pc, 2]
main_label_26:
	lw t0, 144(sp)
	bnez t0, main_label_28
# goto [pc, 42]
main_label_27:
	j main_label_69
# def t1, 0
main_label_28:
	li t2, 0
	sw t2, 148(sp)
# def t2, 1
main_label_29:
	li t2, 1
	sw t2, 152(sp)
# mul t3, a_main_1, t2
main_label_30:
	lw t0, 52(sp)
	lw t1, 152(sp)
	mul t2, t0, t1
	sw t2, 156(sp)
# add t1, t1, t3
main_label_31:
	lw t0, 148(sp)
	lw t1, 156(sp)
	add t2, t0, t1
	sw t2, 148(sp)
# def t4, 0
main_label_32:
	li t2, 0
	sw t2, 160(sp)
# def t5, 1
main_label_33:
	li t2, 1
	sw t2, 164(sp)
# mul t6, a_main_1, t5
main_label_34:
	lw t0, 52(sp)
	lw t1, 164(sp)
	mul t2, t0, t1
	sw t2, 168(sp)
# add t4, t4, t6
main_label_35:
	lw t0, 160(sp)
	lw t1, 168(sp)
	add t2, t0, t1
	sw t2, 160(sp)
# load t7, c_main_1, t4
main_label_36:
	lw t0, 160(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 0( t0)
	sw t2, 172(sp)
# sub t8, a_main_1, 1
main_label_37:
	lw t0, 52(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 176(sp)
# def t9, 0
main_label_38:
	li t2, 0
	sw t2, 180(sp)
# def t10, 1
main_label_39:
	li t2, 1
	sw t2, 184(sp)
# mul t11, t8, t10
main_label_40:
	lw t0, 176(sp)
	lw t1, 184(sp)
	mul t2, t0, t1
	sw t2, 188(sp)
# add t9, t9, t11
main_label_41:
	lw t0, 180(sp)
	lw t1, 188(sp)
	add t2, t0, t1
	sw t2, 180(sp)
# load t12, c_main_1, t9
main_label_42:
	lw t0, 180(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 0( t0)
	sw t2, 192(sp)
# add t13, t7, t12
main_label_43:
	lw t0, 172(sp)
	lw t1, 192(sp)
	add t2, t0, t1
	sw t2, 196(sp)
# sub t14, a_main_1, 2
main_label_44:
	lw t0, 52(sp)
	li t1, 2
	sub t2, t0, t1
	sw t2, 200(sp)
# def t15, 0
main_label_45:
	li t2, 0
	sw t2, 204(sp)
# def t16, 1
main_label_46:
	li t2, 1
	sw t2, 208(sp)
# mul t17, t14, t16
main_label_47:
	lw t0, 200(sp)
	lw t1, 208(sp)
	mul t2, t0, t1
	sw t2, 212(sp)
# add t15, t15, t17
main_label_48:
	lw t0, 204(sp)
	lw t1, 212(sp)
	add t2, t0, t1
	sw t2, 204(sp)
# load t18, c_main_1, t15
main_label_49:
	lw t0, 204(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 0( t0)
	sw t2, 216(sp)
# add t19, t13, t18
main_label_50:
	lw t0, 196(sp)
	lw t1, 216(sp)
	add t2, t0, t1
	sw t2, 220(sp)
# store t19, c_main_1, t1
main_label_51:
	lw t0, 148(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 220(sp)
	sw t2, 0(t0)
# def t20, 0
main_label_52:
	li t2, 0
	sw t2, 224(sp)
# def t21, 1
main_label_53:
	li t2, 1
	sw t2, 228(sp)
# mul t22, a_main_1, t21
main_label_54:
	lw t0, 52(sp)
	lw t1, 228(sp)
	mul t2, t0, t1
	sw t2, 232(sp)
# add t20, t20, t22
main_label_55:
	lw t0, 224(sp)
	lw t1, 232(sp)
	add t2, t0, t1
	sw t2, 224(sp)
# load t23, c_main_1, t20
main_label_56:
	lw t0, 224(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 0( t0)
	sw t2, 236(sp)
# add t24, d_main_1, t23
main_label_57:
	lw t0, 140(sp)
	lw t1, 236(sp)
	add t2, t0, t1
	sw t2, 240(sp)
# mov d_main_1, t24
main_label_58:
	lw t2, 240(sp)
	sw t2, 140(sp)
# def t26, 0
main_label_59:
	li t2, 0
	sw t2, 244(sp)
# def t27, 1
main_label_60:
	li t2, 1
	sw t2, 248(sp)
# mul t28, a_main_1, t27
main_label_61:
	lw t0, 52(sp)
	lw t1, 248(sp)
	mul t2, t0, t1
	sw t2, 252(sp)
# add t26, t26, t28
main_label_62:
	lw t0, 244(sp)
	lw t1, 252(sp)
	add t2, t0, t1
	sw t2, 244(sp)
# load t29, c_main_1, t26
main_label_63:
	lw t0, 244(sp)
	slli t0, t0, 2
	add t0, t0, 60
	lw t2, 0( t0)
	sw t2, 256(sp)
# call t25, putint(t29)
main_label_64:
	lw a0, 256(sp)
	call putint
# call t30, putch(10)
main_label_65:
	li a0, 10
	call putch
# add t31, a_main_1, 1
main_label_66:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 260(sp)
# mov a_main_1, t31
main_label_67:
	lw t2, 260(sp)
	sw t2, 52(sp)
# goto [pc, -43]
main_label_68:
	j main_label_25
# return d_main_1
main_label_69:
	lw a0, 140(sp)
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
	addi sp, sp, 588
	ret
