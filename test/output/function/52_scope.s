	.data
	a_global_0: .word 7
	.text
	.globl main
	.align 2
func:
	addi sp, sp, -96
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
# def b_func_1, a_global_0
func_label_0:
	lw t2, a_global_0
	sw t2, 52(sp)
# def a_func_1, 1
func_label_1:
	li t2, 1
	sw t2, 56(sp)
# eq t0, a_func_1, b_func_1
func_label_2:
	lw t0, 56(sp)
	lw t1, 52(sp)
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 60(sp)
# if t0 goto [pc, 2]
func_label_3:
	lw t0, 60(sp)
	bnez t0, func_label_5
# goto [pc, 4]
func_label_4:
	j func_label_8
# add t1, a_func_1, 1
func_label_5:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 64(sp)
# mov a_func_1, t1
func_label_6:
	lw t2, 64(sp)
	sw t2, 56(sp)
# return 1
func_label_7:
	li a0, 1
# if t0 goto [pc, 2]
func_label_8:
	lw t0, 60(sp)
	bnez t0, func_label_10
# return 0
func_label_9:
	li a0, 0
func_label_10:
	nop
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
	addi sp, sp, 96
	ret
main:
	addi sp, sp, -168
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
# def result_main_3, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# def i_main_3, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# lss t2, i_main_3, 100
main_label_3:
	lw t0, 56(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 60(sp)
# if t2 goto [pc, 2]
main_label_4:
	lw t0, 60(sp)
	bnez t0, main_label_6
# goto [pc, 10]
main_label_5:
	j main_label_15
# call t3, func()
main_label_6:
	call func
	sw a0, 64(sp)
# eq t4, t3, 1
main_label_7:
	lw t0, 64(sp)
	li t1, 1
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 68(sp)
# if t4 goto [pc, 2]
main_label_8:
	lw t0, 68(sp)
	bnez t0, main_label_10
# goto [pc, 3]
main_label_9:
	j main_label_12
# add t5, result_main_3, 1
main_label_10:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 72(sp)
# mov result_main_3, t5
main_label_11:
	lw t2, 72(sp)
	sw t2, 52(sp)
# add t6, i_main_3, 1
main_label_12:
	lw t0, 56(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 76(sp)
# mov i_main_3, t6
main_label_13:
	lw t2, 76(sp)
	sw t2, 56(sp)
# goto [pc, -11]
main_label_14:
	j main_label_3
# lss t7, result_main_3, 100
main_label_15:
	lw t0, 52(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 80(sp)
# if t7 goto [pc, 2]
main_label_16:
	lw t0, 80(sp)
	bnez t0, main_label_18
# goto [pc, 2]
main_label_17:
	j main_label_19
# call t8, putint(1)
main_label_18:
	li a0, 1
	call putint
# if t7 goto [pc, 2]
main_label_19:
	lw t0, 80(sp)
	bnez t0, main_label_21
# call t9, putint(0)
main_label_20:
	li a0, 0
	call putint
main_label_21:
	nop
# return 0
main_label_22:
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
	addi sp, sp, 168
	ret
