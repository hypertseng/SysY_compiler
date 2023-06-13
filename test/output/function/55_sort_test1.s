	.bss
	n_global_0: .word 0
	.text
	.globl main
	.align 2
bubblesort:
	addi sp, sp, -700
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
# def i_bubblesort_1, 0
bubblesort_label_0:
	li t2, 0
	sw t2, 56(sp)
# def j_bubblesort_1, 0
bubblesort_label_1:
	li t2, 0
	sw t2, 60(sp)
# mov i_bubblesort_1, 0
bubblesort_label_2:
	li t2, 0
	sw t2, 56(sp)
# sub t0, n_global_0, 1
bubblesort_label_3:
	lw t0, n_global_0
	li t1, 1
	sub t2, t0, t1
	sw t2, 64(sp)
# lss t1, i_bubblesort_1, t0
bubblesort_label_4:
	lw t0, 56(sp)
	lw t1, 64(sp)
	slt t2, t0, t1
	sw t2, 68(sp)
# if t1 goto [pc, 2]
bubblesort_label_5:
	lw t0, 68(sp)
	bnez t0, bubblesort_label_7
# goto [pc, 51]
bubblesort_label_6:
	j bubblesort_label_57
# mov j_bubblesort_1, 0
bubblesort_label_7:
	li t2, 0
	sw t2, 60(sp)
# sub t2, n_global_0, i_bubblesort_1
bubblesort_label_8:
	lw t0, n_global_0
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 72(sp)
# sub t3, t2, 1
bubblesort_label_9:
	lw t0, 72(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 76(sp)
# lss t4, j_bubblesort_1, t3
bubblesort_label_10:
	lw t0, 60(sp)
	lw t1, 76(sp)
	slt t2, t0, t1
	sw t2, 80(sp)
# if t4 goto [pc, 2]
bubblesort_label_11:
	lw t0, 80(sp)
	bnez t0, bubblesort_label_13
# goto [pc, 42]
bubblesort_label_12:
	j bubblesort_label_54
# def t5, 0
bubblesort_label_13:
	li t2, 0
	sw t2, 84(sp)
# def t6, 1
bubblesort_label_14:
	li t2, 1
	sw t2, 88(sp)
# mul t7, j_bubblesort_1, t6
bubblesort_label_15:
	lw t0, 60(sp)
	lw t1, 88(sp)
	mul t2, t0, t1
	sw t2, 92(sp)
# add t5, t5, t7
bubblesort_label_16:
	lw t0, 84(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 84(sp)
# load t8, arr_bubblesort_1, t5
bubblesort_label_17:
	lw t0, 84(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 0( t0)
	sw t2, 96(sp)
# add t9, j_bubblesort_1, 1
bubblesort_label_18:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 100(sp)
# def t10, 0
bubblesort_label_19:
	li t2, 0
	sw t2, 104(sp)
# def t11, 1
bubblesort_label_20:
	li t2, 1
	sw t2, 108(sp)
# mul t12, t9, t11
bubblesort_label_21:
	lw t0, 100(sp)
	lw t1, 108(sp)
	mul t2, t0, t1
	sw t2, 112(sp)
# add t10, t10, t12
bubblesort_label_22:
	lw t0, 104(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 104(sp)
# load t13, arr_bubblesort_1, t10
bubblesort_label_23:
	lw t0, 104(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 0( t0)
	sw t2, 116(sp)
# gtr t14, t8, t13
bubblesort_label_24:
	lw t0, 96(sp)
	lw t1, 116(sp)
	slt t2, t0, t1
	seqz t2, t2
	sw t2, 120(sp)
# if t14 goto [pc, 2]
bubblesort_label_25:
	lw t0, 120(sp)
	bnez t0, bubblesort_label_27
# goto [pc, 25]
bubblesort_label_26:
	j bubblesort_label_51
# def tmp_if_4, 0
bubblesort_label_27:
	li t2, 0
	sw t2, 124(sp)
# add t15, j_bubblesort_1, 1
bubblesort_label_28:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 128(sp)
# def t16, 0
bubblesort_label_29:
	li t2, 0
	sw t2, 132(sp)
# def t17, 1
bubblesort_label_30:
	li t2, 1
	sw t2, 136(sp)
# mul t18, t15, t17
bubblesort_label_31:
	lw t0, 128(sp)
	lw t1, 136(sp)
	mul t2, t0, t1
	sw t2, 140(sp)
# add t16, t16, t18
bubblesort_label_32:
	lw t0, 132(sp)
	lw t1, 140(sp)
	add t2, t0, t1
	sw t2, 132(sp)
# load t19, arr_bubblesort_1, t16
bubblesort_label_33:
	lw t0, 132(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 0( t0)
	sw t2, 144(sp)
# mov tmp_if_4, t19
bubblesort_label_34:
	lw t2, 144(sp)
	sw t2, 124(sp)
# add t20, j_bubblesort_1, 1
bubblesort_label_35:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 148(sp)
# def t21, 0
bubblesort_label_36:
	li t2, 0
	sw t2, 152(sp)
# def t22, 1
bubblesort_label_37:
	li t2, 1
	sw t2, 156(sp)
# mul t23, t20, t22
bubblesort_label_38:
	lw t0, 148(sp)
	lw t1, 156(sp)
	mul t2, t0, t1
	sw t2, 160(sp)
# add t21, t21, t23
bubblesort_label_39:
	lw t0, 152(sp)
	lw t1, 160(sp)
	add t2, t0, t1
	sw t2, 152(sp)
# def t24, 0
bubblesort_label_40:
	li t2, 0
	sw t2, 164(sp)
# def t25, 1
bubblesort_label_41:
	li t2, 1
	sw t2, 168(sp)
# mul t26, j_bubblesort_1, t25
bubblesort_label_42:
	lw t0, 60(sp)
	lw t1, 168(sp)
	mul t2, t0, t1
	sw t2, 172(sp)
# add t24, t24, t26
bubblesort_label_43:
	lw t0, 164(sp)
	lw t1, 172(sp)
	add t2, t0, t1
	sw t2, 164(sp)
# load t27, arr_bubblesort_1, t24
bubblesort_label_44:
	lw t0, 164(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 0( t0)
	sw t2, 176(sp)
# store t27, arr_bubblesort_1, t21
bubblesort_label_45:
	lw t0, 152(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 176(sp)
	sw t2, 0(t0)
# def t28, 0
bubblesort_label_46:
	li t2, 0
	sw t2, 180(sp)
# def t29, 1
bubblesort_label_47:
	li t2, 1
	sw t2, 184(sp)
# mul t30, j_bubblesort_1, t29
bubblesort_label_48:
	lw t0, 60(sp)
	lw t1, 184(sp)
	mul t2, t0, t1
	sw t2, 188(sp)
# add t28, t28, t30
bubblesort_label_49:
	lw t0, 180(sp)
	lw t1, 188(sp)
	add t2, t0, t1
	sw t2, 180(sp)
# store tmp_if_4, arr_bubblesort_1, t28
bubblesort_label_50:
	lw t0, 180(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 124(sp)
	sw t2, 0(t0)
# add t31, j_bubblesort_1, 1
bubblesort_label_51:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 192(sp)
# mov j_bubblesort_1, t31
bubblesort_label_52:
	lw t2, 192(sp)
	sw t2, 60(sp)
# goto [pc, -45]
bubblesort_label_53:
	j bubblesort_label_8
# add t32, i_bubblesort_1, 1
bubblesort_label_54:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 196(sp)
# mov i_bubblesort_1, t32
bubblesort_label_55:
	lw t2, 196(sp)
	sw t2, 56(sp)
# goto [pc, -53]
bubblesort_label_56:
	j bubblesort_label_3
# return 0
bubblesort_label_57:
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
	addi sp, sp, 700
	ret
main:
	addi sp, sp, -244
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
# mov n_global_0, 10
main_label_1:
	li t2, 10
	la t3, n_global_0
	sw t2, 0(t3)
# alloc a_main_5, 10
main_label_2:
# store 4, a_main_5, 0
main_label_3:
	li t2, 4
	sw t2, 52(sp)
# store 3, a_main_5, 1
main_label_4:
	li t2, 3
	sw t2, 56(sp)
# store 9, a_main_5, 2
main_label_5:
	li t2, 9
	sw t2, 60(sp)
# store 2, a_main_5, 3
main_label_6:
	li t2, 2
	sw t2, 64(sp)
# store 0, a_main_5, 4
main_label_7:
	li t2, 0
	sw t2, 68(sp)
# store 1, a_main_5, 5
main_label_8:
	li t2, 1
	sw t2, 72(sp)
# store 6, a_main_5, 6
main_label_9:
	li t2, 6
	sw t2, 76(sp)
# store 5, a_main_5, 7
main_label_10:
	li t2, 5
	sw t2, 80(sp)
# store 7, a_main_5, 8
main_label_11:
	li t2, 7
	sw t2, 84(sp)
# store 8, a_main_5, 9
main_label_12:
	li t2, 8
	sw t2, 88(sp)
# def i_main_5, 0
main_label_13:
	li t2, 0
	sw t2, 92(sp)
# call t33, bubblesort(a_main_5)
main_label_14:
	lw a0, 52(sp)
	call bubblesort
	sw a0, 96(sp)
# mov i_main_5, t33
main_label_15:
	lw t2, 96(sp)
	sw t2, 92(sp)
# lss t34, i_main_5, n_global_0
main_label_16:
	lw t0, 92(sp)
	lw t1, n_global_0
	slt t2, t0, t1
	sw t2, 100(sp)
# if t34 goto [pc, 2]
main_label_17:
	lw t0, 100(sp)
	bnez t0, main_label_19
# goto [pc, 14]
main_label_18:
	j main_label_32
# def tmp_while_6, 0
main_label_19:
	li t2, 0
	sw t2, 104(sp)
# def t35, 0
main_label_20:
	li t2, 0
	sw t2, 108(sp)
# def t36, 1
main_label_21:
	li t2, 1
	sw t2, 112(sp)
# mul t37, i_main_5, t36
main_label_22:
	lw t0, 92(sp)
	lw t1, 112(sp)
	mul t2, t0, t1
	sw t2, 116(sp)
# add t35, t35, t37
main_label_23:
	lw t0, 108(sp)
	lw t1, 116(sp)
	add t2, t0, t1
	sw t2, 108(sp)
# load t38, a_main_5, t35
main_label_24:
	lw t0, 108(sp)
	slli t0, t0, 2
	add t0, t0, 52
	lw t2, 0( t0)
	sw t2, 120(sp)
# mov tmp_while_6, t38
main_label_25:
	lw t2, 120(sp)
	sw t2, 104(sp)
# call t39, putint(tmp_while_6)
main_label_26:
	lw a0, 104(sp)
	call putint
# mov tmp_while_6, 10
main_label_27:
	li t2, 10
	sw t2, 104(sp)
# call t40, putch(tmp_while_6)
main_label_28:
	lw a0, 104(sp)
	call putch
# add t41, i_main_5, 1
main_label_29:
	lw t0, 92(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 124(sp)
# mov i_main_5, t41
main_label_30:
	lw t2, 124(sp)
	sw t2, 92(sp)
# goto [pc, -15]
main_label_31:
	j main_label_16
# return 0
main_label_32:
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
	addi sp, sp, 244
	ret
