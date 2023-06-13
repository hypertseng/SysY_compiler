	.bss
	a_global_0: .word 0
	b_global_0: .word 0
	c_global_0: .word 0
	d_global_0: .word 0
	e_global_0: .word 0
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -192
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
# mov a_global_0, 0
main_label_1:
	li t2, 0
	la t3, a_global_0
	sw t2, 0(t3)
# mov b_global_0, 1
main_label_2:
	li t2, 1
	la t3, b_global_0
	sw t2, 0(t3)
# mov c_global_0, 1
main_label_3:
	li t2, 1
	la t3, c_global_0
	sw t2, 0(t3)
# mov d_global_0, 1
main_label_4:
	li t2, 1
	la t3, d_global_0
	sw t2, 0(t3)
# mov e_global_0, 1
main_label_5:
	li t2, 1
	la t3, e_global_0
	sw t2, 0(t3)
# def flag_main_1, 0
main_label_6:
	li t2, 0
	sw t2, 52(sp)
# mul t0, b_global_0, c_global_0
main_label_7:
	lw t0, b_global_0
	lw t1, c_global_0
	mul t2, t0, t1
	sw t2, 56(sp)
# sub t1, a_global_0, t0
main_label_8:
	lw t0, a_global_0
	lw t1, 56(sp)
	sub t2, t0, t1
	sw t2, 60(sp)
# div t2, a_global_0, c_global_0
main_label_9:
	lw t0, a_global_0
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 64(sp)
# sub t3, d_global_0, t2
main_label_10:
	lw t0, d_global_0
	lw t1, 64(sp)
	sub t2, t0, t1
	sw t2, 68(sp)
# neq t4, t1, t3
main_label_11:
	lw t0, 60(sp)
	lw t1, 68(sp)
	sub t2, t0, t1
	snez t2, t2
	sw t2, 72(sp)
# if t4 goto [pc, 17]
main_label_12:
	lw t0, 72(sp)
	bnez t0, main_label_29
# mul t5, a_global_0, b_global_0
main_label_13:
	lw t0, a_global_0
	lw t1, b_global_0
	mul t2, t0, t1
	sw t2, 76(sp)
# div t6, t5, c_global_0
main_label_14:
	lw t0, 76(sp)
	lw t1, c_global_0
	div t2, t0, t1
	sw t2, 80(sp)
# add t7, e_global_0, d_global_0
main_label_15:
	lw t0, e_global_0
	lw t1, d_global_0
	add t2, t0, t1
	sw t2, 84(sp)
# eq t8, t6, t7
main_label_16:
	lw t0, 80(sp)
	lw t1, 84(sp)
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 88(sp)
# if t8 goto [pc, 8]
main_label_17:
	lw t0, 88(sp)
	bnez t0, main_label_25
# add t9, a_global_0, b_global_0
main_label_18:
	lw t0, a_global_0
	lw t1, b_global_0
	add t2, t0, t1
	sw t2, 92(sp)
# add t10, t9, c_global_0
main_label_19:
	lw t0, 92(sp)
	lw t1, c_global_0
	add t2, t0, t1
	sw t2, 96(sp)
# add t11, d_global_0, e_global_0
main_label_20:
	lw t0, d_global_0
	lw t1, e_global_0
	add t2, t0, t1
	sw t2, 100(sp)
# eq t12, t10, t11
main_label_21:
	lw t0, 96(sp)
	lw t1, 100(sp)
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 104(sp)
# if t12 goto [pc, 3]
main_label_22:
	lw t0, 104(sp)
	bnez t0, main_label_25
# mov t13, 0
main_label_23:
	li t2, 0
	sw t2, 108(sp)
# goto [pc, 2]
main_label_24:
	j main_label_26
# mov t13, 1
main_label_25:
	li t2, 1
	sw t2, 108(sp)
# if t13 goto [pc, 3]
main_label_26:
	lw t0, 108(sp)
	bnez t0, main_label_29
# mov t14, 0
main_label_27:
	li t2, 0
	sw t2, 112(sp)
# goto [pc, 2]
main_label_28:
	j main_label_30
# mov t14, 1
main_label_29:
	li t2, 1
	sw t2, 112(sp)
# if t14 goto [pc, 2]
main_label_30:
	lw t0, 112(sp)
	bnez t0, main_label_32
# goto [pc, 2]
main_label_31:
	j main_label_33
# mov flag_main_1, 1
main_label_32:
	li t2, 1
	sw t2, 52(sp)
# return flag_main_1
main_label_33:
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
	addi sp, sp, 192
	ret
