	.bss
	b_global_0: .word 0
	.data
	a_global_0: .word 1
	c_global_0: .word 1
	d_global_0: .word 2
	e_global_0: .word 4
	.text
	.globl main
	.align 2
main:
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
# call t0, global()
main_label_0:
# def flag_main_1, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# mul t0, a_global_0, b_global_0
main_label_2:
	lw t0, a_global_0
	lw t1, b_global_0
	mul t2, t0, t1
	sw t2, 56(sp)
# div t1, t0, c_global_0
main_label_3:
	lw t0, 56(sp)
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 60(sp)
# add t2, e_global_0, d_global_0
main_label_4:
	lw t0, e_global_0
	lw t1, d_global_0
	add t2, t0, t1
	sw t2, 64(sp)
# eq t3, t1, t2
main_label_5:
	lw t0, 60(sp)
	lw t1, 64(sp)
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 68(sp)
# if t3 goto [pc, 3]
main_label_6:
	lw t0, 68(sp)
	bnez t0, main_label_9
# mov t9, 0
main_label_7:
	li t2, 0
	sw t2, 72(sp)
# goto [pc, 10]
main_label_8:
	j main_label_18
# add t4, a_global_0, b_global_0
main_label_9:
	lw t0, a_global_0
	lw t1, b_global_0
	add t2, t0, t1
	sw t2, 76(sp)
# mul t5, a_global_0, t4
main_label_10:
	lw t0, a_global_0
	lw t1, 76(sp)
	mul t2, t0, t1
	sw t2, 80(sp)
# add t6, t5, c_global_0
main_label_11:
	lw t0, 80(sp)
	lw t1, c_global_0
	add t2, t0, t1
	sw t2, 84(sp)
# add t7, d_global_0, e_global_0
main_label_12:
	lw t0, d_global_0
	lw t1, e_global_0
	add t2, t0, t1
	sw t2, 88(sp)
# leq t8, t6, t7
main_label_13:
	lw t0, 84(sp)
	lw t1, 88(sp)
	slt t2, t1, t0
	seqz t2, t2
	sw t2, 92(sp)
# if t8 goto [pc, 3]
main_label_14:
	lw t0, 92(sp)
	bnez t0, main_label_17
# mov t9, 0
main_label_15:
	li t2, 0
	sw t2, 72(sp)
# goto [pc, 2]
main_label_16:
	j main_label_18
# mov t9, 1
main_label_17:
	li t2, 1
	sw t2, 72(sp)
# if t9 goto [pc, 9]
main_label_18:
	lw t0, 72(sp)
	bnez t0, main_label_27
# mul t10, b_global_0, c_global_0
main_label_19:
	lw t0, b_global_0
	lw t1, c_global_0
	mul t2, t0, t1
	sw t2, 96(sp)
# sub t11, a_global_0, t10
main_label_20:
	lw t0, a_global_0
	lw t1, 96(sp)
	sub t2, t0, t1
	sw t2, 100(sp)
# div t12, a_global_0, c_global_0
main_label_21:
	lw t0, a_global_0
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 104(sp)
# sub t13, d_global_0, t12
main_label_22:
	lw t0, d_global_0
	lw t1, 104(sp)
	sub t2, t0, t1
	sw t2, 108(sp)
# eq t14, t11, t13
main_label_23:
	lw t0, 100(sp)
	lw t1, 108(sp)
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 112(sp)
# if t14 goto [pc, 3]
main_label_24:
	lw t0, 112(sp)
	bnez t0, main_label_27
# mov t15, 0
main_label_25:
	li t2, 0
	sw t2, 116(sp)
# goto [pc, 2]
main_label_26:
	j main_label_28
# mov t15, 1
main_label_27:
	li t2, 1
	sw t2, 116(sp)
# if t15 goto [pc, 2]
main_label_28:
	lw t0, 116(sp)
	bnez t0, main_label_30
# goto [pc, 2]
main_label_29:
	j main_label_31
# mov flag_main_1, 1
main_label_30:
	li t2, 1
	sw t2, 52(sp)
# return flag_main_1
main_label_31:
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
	addi sp, sp, 204
	ret
