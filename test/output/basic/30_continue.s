	.text
	.globl main
	.align 2
main:
	addi sp, sp, -148
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
# def i_main_1, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# mov i_main_1, 0
main_label_2:
	li t2, 0
	sw t2, 52(sp)
# def sum_main_1, 0
main_label_3:
	li t2, 0
	sw t2, 56(sp)
# mov sum_main_1, 0
main_label_4:
	li t2, 0
	sw t2, 56(sp)
# lss t0, i_main_1, 100
main_label_5:
	lw t0, 52(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 60(sp)
# if t0 goto [pc, 2]
main_label_6:
	lw t0, 60(sp)
	bnez t0, main_label_8
# goto [pc, 12]
main_label_7:
	j main_label_19
# eq t1, i_main_1, 50
main_label_8:
	lw t0, 52(sp)
	li t1, 50
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 2]
main_label_9:
	lw t0, 64(sp)
	bnez t0, main_label_11
# goto [pc, 4]
main_label_10:
	j main_label_14
# add t2, i_main_1, 1
main_label_11:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 68(sp)
# mov i_main_1, t2
main_label_12:
	lw t2, 68(sp)
	sw t2, 52(sp)
# goto [pc, -5]
main_label_13:
	j main_label_8
# add t3, sum_main_1, i_main_1
main_label_14:
	lw t0, 56(sp)
	lw t1, 52(sp)
	add t2, t0, t1
	sw t2, 72(sp)
# mov sum_main_1, t3
main_label_15:
	lw t2, 72(sp)
	sw t2, 56(sp)
# add t4, i_main_1, 1
main_label_16:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 76(sp)
# mov i_main_1, t4
main_label_17:
	lw t2, 76(sp)
	sw t2, 52(sp)
# goto [pc, -13]
main_label_18:
	j main_label_5
# return sum_main_1
main_label_19:
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
	addi sp, sp, 148
	ret
