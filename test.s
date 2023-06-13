	.text
	.globl main
	.align 2
get_one:
	addi sp, sp, -56
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
# return 1
get_one_label_0:
	li a0, 1
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
	addi sp, sp, 56
	ret
deepWhileBr:
	addi sp, sp, -416
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
# def c_deepWhileBr_2, 0
deepWhileBr_label_0:
	li t2, 0
	sw t2, 60(sp)
# add t0, a_deepWhileBr_2, b_deepWhileBr_2
deepWhileBr_label_1:
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 64(sp)
# mov c_deepWhileBr_2, t0
deepWhileBr_label_2:
	lw t2, 64(sp)
	sw t2, 60(sp)
# lss t1, c_deepWhileBr_2, 75
deepWhileBr_label_3:
	lw t0, 60(sp)
	li t1, 75
	slt t2, t0, t1
	sw t2, 68(sp)
# if t1 goto [pc, 2]
deepWhileBr_label_4:
	lw t0, 68(sp)
	bnez t0, deepWhileBr_label_6
# goto [pc, 21]
deepWhileBr_label_5:
	j deepWhileBr_label_26
# def d_while_3, 0
deepWhileBr_label_6:
	li t2, 0
	sw t2, 72(sp)
# mov d_while_3, 42
deepWhileBr_label_7:
	li t2, 42
	sw t2, 72(sp)
# lss t2, c_deepWhileBr_2, 100
deepWhileBr_label_8:
	lw t0, 60(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 76(sp)
# if t2 goto [pc, 2]
deepWhileBr_label_9:
	lw t0, 76(sp)
	bnez t0, deepWhileBr_label_11
# goto [pc, 15]
deepWhileBr_label_10:
	j deepWhileBr_label_25
# add t3, c_deepWhileBr_2, d_while_3
deepWhileBr_label_11:
	lw t0, 60(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 80(sp)
# mov c_deepWhileBr_2, t3
deepWhileBr_label_12:
	lw t2, 80(sp)
	sw t2, 60(sp)
# gtr t4, c_deepWhileBr_2, 99
deepWhileBr_label_13:
	lw t0, 60(sp)
	li t1, 99
	slt t2, t1, t0
	sw t2, 84(sp)
# if t4 goto [pc, 2]
deepWhileBr_label_14:
	lw t0, 84(sp)
	bnez t0, deepWhileBr_label_16
# goto [pc, 10]
deepWhileBr_label_15:
	j deepWhileBr_label_25
# def e_if_5, 0
deepWhileBr_label_16:
	li t2, 0
	sw t2, 88(sp)
# mul t5, d_while_3, 2
deepWhileBr_label_17:
	lw t0, 72(sp)
	li t1, 2
	mul t2, t0, t1
	sw t2, 92(sp)
# mov e_if_5, t5
deepWhileBr_label_18:
	lw t2, 92(sp)
	sw t2, 88(sp)
# call t6, get_one(0)
deepWhileBr_label_19:
	li a0, 0
	call get_one
	sw a0, 96(sp)
# eq t7, t6, 1
deepWhileBr_label_20:
	lw t0, 96(sp)
	li t1, 1
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 100(sp)
# if t7 goto [pc, 2]
deepWhileBr_label_21:
	lw t0, 100(sp)
