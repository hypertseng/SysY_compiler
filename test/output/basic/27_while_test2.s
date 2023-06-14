	.text
	.globl main
	.align 2
FourWhile:
	addi sp, sp, -284
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
# def a_FourWhile_1, 0
FourWhile_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_FourWhile_1, 5
FourWhile_label_1:
	li t2, 5
	sw t2, 52(sp)
# def b_FourWhile_1, 0
FourWhile_label_2:
	li t2, 0
	sw t2, 56(sp)
# def c_FourWhile_1, 0
FourWhile_label_3:
	li t2, 0
	sw t2, 60(sp)
# mov b_FourWhile_1, 6
FourWhile_label_4:
	li t2, 6
	sw t2, 56(sp)
# mov c_FourWhile_1, 7
FourWhile_label_5:
	li t2, 7
	sw t2, 60(sp)
# def d_FourWhile_1, 0
FourWhile_label_6:
	li t2, 0
	sw t2, 64(sp)
# mov d_FourWhile_1, 10
FourWhile_label_7:
	li t2, 10
	sw t2, 64(sp)
# lss t0, a_FourWhile_1, 20
FourWhile_label_8:
	lw t0, 52(sp)
	li t1, 20
	slt t2, t0, t1
	sw t2, 68(sp)
# if t0 goto [pc, 2]
FourWhile_label_9:
	lw t0, 68(sp)
	bnez t0, FourWhile_label_11
# goto [pc, 28]
FourWhile_label_10:
	j FourWhile_label_38
# add t1, a_FourWhile_1, 3
FourWhile_label_11:
	lw t0, 52(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 72(sp)
# mov a_FourWhile_1, t1
FourWhile_label_12:
	lw t2, 72(sp)
	sw t2, 52(sp)
# lss t2, b_FourWhile_1, 10
FourWhile_label_13:
	lw t0, 56(sp)
	li t1, 10
	slt t2, t0, t1
	sw t2, 76(sp)
# if t2 goto [pc, 2]
FourWhile_label_14:
	lw t0, 76(sp)
	bnez t0, FourWhile_label_16
# goto [pc, 20]
FourWhile_label_15:
	j FourWhile_label_35
# add t3, b_FourWhile_1, 1
FourWhile_label_16:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 80(sp)
# mov b_FourWhile_1, t3
FourWhile_label_17:
	lw t2, 80(sp)
	sw t2, 56(sp)
# eq t4, c_FourWhile_1, 7
FourWhile_label_18:
	lw t0, 60(sp)
	li t1, 7
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 84(sp)
# if t4 goto [pc, 2]
FourWhile_label_19:
	lw t0, 84(sp)
	bnez t0, FourWhile_label_21
# goto [pc, 12]
FourWhile_label_20:
	j FourWhile_label_32
# sub t5, c_FourWhile_1, 1
FourWhile_label_21:
	lw t0, 60(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 88(sp)
# mov c_FourWhile_1, t5
FourWhile_label_22:
	lw t2, 88(sp)
	sw t2, 60(sp)
# lss t6, d_FourWhile_1, 20
FourWhile_label_23:
	lw t0, 64(sp)
	li t1, 20
	slt t2, t0, t1
	sw t2, 92(sp)
# if t6 goto [pc, 2]
FourWhile_label_24:
	lw t0, 92(sp)
	bnez t0, FourWhile_label_26
# goto [pc, 4]
FourWhile_label_25:
	j FourWhile_label_29
# add t7, d_FourWhile_1, 3
FourWhile_label_26:
	lw t0, 64(sp)
	li t1, 3
	add t2, t0, t1
	sw t2, 96(sp)
# mov d_FourWhile_1, t7
FourWhile_label_27:
	lw t2, 96(sp)
	sw t2, 64(sp)
# goto [pc, -5]
FourWhile_label_28:
	j FourWhile_label_23
# sub t8, d_FourWhile_1, 1
FourWhile_label_29:
	lw t0, 64(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 100(sp)
# mov d_FourWhile_1, t8
FourWhile_label_30:
	lw t2, 100(sp)
	sw t2, 64(sp)
# goto [pc, -13]
FourWhile_label_31:
	j FourWhile_label_18
# add t9, c_FourWhile_1, 1
FourWhile_label_32:
	lw t0, 60(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 104(sp)
# mov c_FourWhile_1, t9
FourWhile_label_33:
	lw t2, 104(sp)
	sw t2, 60(sp)
# goto [pc, -21]
FourWhile_label_34:
	j FourWhile_label_13
# sub t10, b_FourWhile_1, 2
FourWhile_label_35:
	lw t0, 56(sp)
	li t1, 2
	sub t2, t0, t1
	sw t2, 108(sp)
# mov b_FourWhile_1, t10
FourWhile_label_36:
	lw t2, 108(sp)
	sw t2, 56(sp)
# goto [pc, -29]
FourWhile_label_37:
	j FourWhile_label_8
# add t11, b_FourWhile_1, d_FourWhile_1
FourWhile_label_38:
	lw t0, 56(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 112(sp)
# add t12, a_FourWhile_1, t11
FourWhile_label_39:
	lw t0, 52(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 116(sp)
# add t13, t12, c_FourWhile_1
FourWhile_label_40:
	lw t0, 116(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 120(sp)
# return t13
FourWhile_label_41:
	lw a0, 120(sp)
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
	addi sp, sp, 284
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
# call t14, FourWhile()
main_label_1:
	call FourWhile
	sw a0, 52(sp)
# return t14
main_label_2:
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
