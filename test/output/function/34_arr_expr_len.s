	.data
	N_global_0: .word -1
	arr_global_0: .word 1, 2, 33, 4, 5, 6
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -152
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
# def sum_main_1, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# lss t4, i_main_1, 6
main_label_3:
	lw t0, 52(sp)
	li t1, 6
	slt t2, t0, t1
	sw t2, 60(sp)
# if t4 goto [pc, 2]
main_label_4:
	lw t0, 60(sp)
	bnez t0, main_label_6
# goto [pc, 11]
main_label_5:
	j main_label_16
# def t5, 0
main_label_6:
	li t2, 0
	sw t2, 64(sp)
# def t6, 1
main_label_7:
	li t2, 1
	sw t2, 68(sp)
# mul t7, i_main_1, t6
main_label_8:
	lw t0, 52(sp)
	lw t1, 68(sp)
	mul t2, t0, t1
	sw t2, 72(sp)
# add t5, t5, t7
main_label_9:
	lw t0, 64(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 64(sp)
# load t8, arr_global_0, t5
main_label_10:
	la t2, arr_global_0
	lw t1, 64(sp)
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 76(sp)
# add t9, sum_main_1, t8
main_label_11:
	lw t0, 56(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 80(sp)
# mov sum_main_1, t9
main_label_12:
	lw t2, 80(sp)
	sw t2, 56(sp)
# add t10, i_main_1, 1
main_label_13:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 84(sp)
# mov i_main_1, t10
main_label_14:
	lw t2, 84(sp)
	sw t2, 52(sp)
# goto [pc, -12]
main_label_15:
	j main_label_3
# return sum_main_1
main_label_16:
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
	addi sp, sp, 152
	ret
