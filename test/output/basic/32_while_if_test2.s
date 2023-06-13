	.text
	.globl main
	.align 2
ifWhile:
	addi sp, sp, -176
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
# def a_ifWhile_1, 0
ifWhile_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_ifWhile_1, 0
ifWhile_label_1:
	li t2, 0
	sw t2, 52(sp)
# def b_ifWhile_1, 0
ifWhile_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov b_ifWhile_1, 3
ifWhile_label_3:
	li t2, 3
	sw t2, 56(sp)
# eq t0, a_ifWhile_1, 5
ifWhile_label_4:
	lw t0, 52(sp)
	li t1, 5
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 60(sp)
# if t0 goto [pc, 2]
ifWhile_label_5:
	lw t0, 60(sp)
	bnez t0, ifWhile_label_7
# goto [pc, 9]
ifWhile_label_6:
	j ifWhile_label_15
# eq t1, b_ifWhile_1, 2
ifWhile_label_7:
	lw t0, 56(sp)
	li t1, 2
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 2]
ifWhile_label_8:
	lw t0, 64(sp)
	bnez t0, ifWhile_label_10
# goto [pc, 4]
ifWhile_label_9:
	j ifWhile_label_13
# add t2, b_ifWhile_1, 2
ifWhile_label_10:
	lw t0, 56(sp)
	li t1, 2
	add t2, t0, t1
	sw t2, 68(sp)
# mov b_ifWhile_1, t2
ifWhile_label_11:
	lw t2, 68(sp)
	sw t2, 56(sp)
# goto [pc, -5]
ifWhile_label_12:
	j ifWhile_label_7
# add t3, b_ifWhile_1, 25
ifWhile_label_13:
	lw t0, 56(sp)
	li t1, 25
	add t2, t0, t1
	sw t2, 72(sp)
# mov b_ifWhile_1, t3
ifWhile_label_14:
	lw t2, 72(sp)
	sw t2, 56(sp)
# if t0 goto [pc, 9]
ifWhile_label_15:
	lw t0, 60(sp)
	bnez t0, ifWhile_label_24
# lss t4, a_ifWhile_1, 5
ifWhile_label_16:
	lw t0, 52(sp)
	li t1, 5
	slt t2, t0, t1
	sw t2, 76(sp)
# if t4 goto [pc, 2]
ifWhile_label_17:
	lw t0, 76(sp)
	bnez t0, ifWhile_label_19
# goto [pc, 6]
ifWhile_label_18:
	j ifWhile_label_24
# mul t5, b_ifWhile_1, 2
ifWhile_label_19:
	lw t0, 56(sp)
	li t1, 2
	mul t2, t0, t1
	sw t2, 80(sp)
# mov b_ifWhile_1, t5
ifWhile_label_20:
	lw t2, 80(sp)
	sw t2, 56(sp)
# add t6, a_ifWhile_1, 1
ifWhile_label_21:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 84(sp)
# mov a_ifWhile_1, t6
ifWhile_label_22:
	lw t2, 84(sp)
	sw t2, 52(sp)
# goto [pc, -7]
ifWhile_label_23:
	j ifWhile_label_16
ifWhile_label_24:
	nop
# return b_ifWhile_1
ifWhile_label_25:
	lw a0, 56(sp)
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
	addi sp, sp, 176
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
# call t7, ifWhile()
main_label_1:
	call ifWhile
	sw a0, 52(sp)
# return t7
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
