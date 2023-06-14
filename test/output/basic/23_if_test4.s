	.text
	.globl main
	.align 2
if_ifElse_:
	addi sp, sp, -120
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
# def a_if_ifElse__1, 0
if_ifElse__label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_if_ifElse__1, 5
if_ifElse__label_1:
	li t2, 5
	sw t2, 52(sp)
# def b_if_ifElse__1, 0
if_ifElse__label_2:
	li t2, 0
	sw t2, 56(sp)
# mov b_if_ifElse__1, 10
if_ifElse__label_3:
	li t2, 10
	sw t2, 56(sp)
# eq t0, a_if_ifElse__1, 5
if_ifElse__label_4:
	lw t0, 52(sp)
	li t1, 5
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 60(sp)
# if t0 goto [pc, 2]
if_ifElse__label_5:
	lw t0, 60(sp)
	bnez t0, if_ifElse__label_7
# goto [pc, 9]
if_ifElse__label_6:
	j if_ifElse__label_15
# eq t1, b_if_ifElse__1, 10
if_ifElse__label_7:
	lw t0, 56(sp)
	li t1, 10
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 2]
if_ifElse__label_8:
	lw t0, 64(sp)
	bnez t0, if_ifElse__label_10
# goto [pc, 2]
if_ifElse__label_9:
	j if_ifElse__label_11
# mov a_if_ifElse__1, 25
if_ifElse__label_10:
	li t2, 25
	sw t2, 52(sp)
# if t1 goto [pc, 3]
if_ifElse__label_11:
	lw t0, 64(sp)
	bnez t0, if_ifElse__label_14
# add t2, a_if_ifElse__1, 15
if_ifElse__label_12:
	lw t0, 52(sp)
	li t1, 15
	add t2, t0, t1
	sw t2, 68(sp)
# mov a_if_ifElse__1, t2
if_ifElse__label_13:
	lw t2, 68(sp)
	sw t2, 52(sp)
if_ifElse__label_14:
	nop
# return a_if_ifElse__1
if_ifElse__label_15:
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
	addi sp, sp, 120
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
# call t3, if_ifElse_()
main_label_1:
	call if_ifElse_
	sw a0, 52(sp)
# return t3
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
