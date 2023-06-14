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
	lw t2, 52(a0)
