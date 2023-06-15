	.text
	.globl main
	.align 2
exgcd:
	addi sp, sp, -664
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
	sw a2, 60(sp)
	sw a3, 64(sp)
# call t0, putint(a_exgcd_1)
exgcd_label_0:
	sw a0, 68(sp)
	lw a0, 52(sp)
	call putint
	lw a0, 52(sp)
# call t1, putint(b_exgcd_1)
exgcd_label_1:
	sw a0, 72(sp)
	lw a0, 56(sp)
	call putint
	lw a0, 56(sp)
# call t2, putch(10)
exgcd_label_2:
	li a0, 10
	call putch
# eq t3, b_exgcd_1, 0
exgcd_label_3:
	lw t0, 56(sp)
	li t1, 0
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 76(sp)
# if t3 goto [pc, 2]
exgcd_label_4:
	lw t0, 76(sp)
	bnez t0, exgcd_label_6
# goto [pc, 4]
exgcd_label_5:
	j exgcd_label_9
# store 1, x_exgcd_1, 0
exgcd_label_6:
	lw t2, 60(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# store 0, y_exgcd_1, 0
exgcd_label_7:
	lw t2, 64(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# return a_exgcd_1
exgcd_label_8:
	lw a0, 52(sp)
# if t3 goto [pc, 13]
exgcd_label_9:
	lw t0, 76(sp)
	bnez t0, exgcd_label_22
# call t4, exgcd(0, 0, x_exgcd_1, y_exgcd_1)
exgcd_label_10:
	li a0, 0
	li a1, 0
	sw a2, 80(sp)
	addi a2, sp, 60
	sw a3, 84(sp)
	addi a3, sp, 64
	call exgcd
	sw a0, 88(sp)
	lw a2, 60(sp)
	lw a3, 64(sp)
# def r_if_3, t4
exgcd_label_11:
	lw t2, 88(sp)
	sw t2, 92(sp)
# load t5, x_exgcd_1, 0
exgcd_label_12:
	lw t2, 60(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 96(sp)
# def t_if_3, t5
exgcd_label_13:
	lw t2, 96(sp)
	sw t2, 100(sp)
# load t6, y_exgcd_1, 0
exgcd_label_14:
	lw t2, 64(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 104(sp)
# store t6, x_exgcd_1, 0
exgcd_label_15:
	lw t2, 60(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 104(sp)
	sw t1, 0(t2)
# div t7, a_exgcd_1, b_exgcd_1
exgcd_label_16:
	lw t0, 52(sp)
	lw t1, 56(sp)
	div t2, t0, t1
	sw t2, 108(sp)
# load t8, y_exgcd_1, 0
exgcd_label_17:
	lw t2, 64(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 112(sp)
# mul t9, t7, t8
exgcd_label_18:
	lw t0, 108(sp)
	lw t1, 112(sp)
	mul t2, t0, t1
	sw t2, 116(sp)
# sub t10, t_if_3, t9
exgcd_label_19:
	lw t0, 100(sp)
	lw t1, 116(sp)
	sub t2, t0, t1
	sw t2, 120(sp)
# store t10, y_exgcd_1, 0
exgcd_label_20:
	lw t2, 64(sp)
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t1, 120(sp)
	sw t1, 0(t2)
# return r_if_3
exgcd_label_21:
	lw a0, 92(sp)
exgcd_label_22:
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
	addi sp, sp, 664
	ret
main:
	addi sp, sp, -156
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
# def a_main_4, 7
main_label_1:
	li t2, 7
	sw t2, 52(sp)
# def b_main_4, 15
main_label_2:
	li t2, 15
	sw t2, 56(sp)
# alloc x_main_4, 1
main_label_3:
# store 1, x_main_4, 0
main_label_4:
	addi t2, sp, 60
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# alloc y_main_4, 1
main_label_5:
# store 1, y_main_4, 0
main_label_6:
	addi t2, sp, 64
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# call t11, exgcd(a_main_4, b_main_4, x_main_4, y_main_4)
main_label_7:
	sw a0, 68(sp)
	lw a0, 52(sp)
	sw a1, 72(sp)
	lw a1, 56(sp)
	sw a2, 76(sp)
	addi a2, sp, 60
	sw a3, 80(sp)
	addi a3, sp, 64
	call exgcd
	sw a0, 84(sp)
	lw a0, 52(sp)
	lw a1, 56(sp)
	lw a2, 60(sp)
	lw a3, 64(sp)
# return 0
main_label_8:
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
	addi sp, sp, 156
	ret
