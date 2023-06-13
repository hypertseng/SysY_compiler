	.text
	.globl main
	.align 2
doubleWhile:
	addi sp, sp, -144
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
# def i_doubleWhile_1, 0
doubleWhile_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov i_doubleWhile_1, 5
doubleWhile_label_1:
	li t2, 5
	sw t2, 52(sp)
# def j_doubleWhile_1, 0
doubleWhile_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov j_doubleWhile_1, 7
doubleWhile_label_3:
	li t2, 7
	sw t2, 56(sp)
# lss t0, i_doubleWhile_1, 100
doubleWhile_label_4:
	lw t0, 52(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 60(sp)
# if t0 goto [pc, 2]
doubleWhile_label_5:
	lw t0, 60(sp)
	bnez t0, doubleWhile_label_7
# goto [pc, 12]
doubleWhile_label_6:
	j doubleWhile_label_18
# add t1, i_doubleWhile_1, 30
doubleWhile_label_7:
	lw t0, 52(sp)
	li t1, 30
	add t2, t0, t1
	sw t2, 64(sp)
# mov i_doubleWhile_1, t1
doubleWhile_label_8:
	lw t2, 64(sp)
	sw t2, 52(sp)
# lss t2, j_doubleWhile_1, 100
doubleWhile_label_9:
	lw t0, 56(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 68(sp)
# if t2 goto [pc, 2]
doubleWhile_label_10:
	lw t0, 68(sp)
	bnez t0, doubleWhile_label_12
# goto [pc, 4]
doubleWhile_label_11:
	j doubleWhile_label_15
# add t3, j_doubleWhile_1, 6
doubleWhile_label_12:
	lw t0, 56(sp)
	li t1, 6
	add t2, t0, t1
	sw t2, 72(sp)
# mov j_doubleWhile_1, t3
doubleWhile_label_13:
	lw t2, 72(sp)
	sw t2, 56(sp)
# goto [pc, -5]
doubleWhile_label_14:
	j doubleWhile_label_9
# sub t4, j_doubleWhile_1, 100
doubleWhile_label_15:
	lw t0, 56(sp)
	li t1, 100
	sub t2, t0, t1
	sw t2, 76(sp)
# mov j_doubleWhile_1, t4
doubleWhile_label_16:
	lw t2, 76(sp)
	sw t2, 56(sp)
# goto [pc, -13]
doubleWhile_label_17:
	j doubleWhile_label_4
# return j_doubleWhile_1
doubleWhile_label_18:
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
	addi sp, sp, 144
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
# call t5, doubleWhile()
main_label_1:
	call doubleWhile
	sw a0, 52(sp)
# return t5
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
