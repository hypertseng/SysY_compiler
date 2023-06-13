	.text
	.globl main
	.align 2
ififElse:
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
# def a_ififElse_1, 0
ififElse_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_ififElse_1, 5
ififElse_label_1:
	li t2, 5
	sw t2, 52(sp)
# def b_ififElse_1, 0
ififElse_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov b_ififElse_1, 10
ififElse_label_3:
	li t2, 10
	sw t2, 56(sp)
# eq t0, a_ififElse_1, 5
ififElse_label_4:
	lw t0, 52(sp)
	li t1, 5
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 60(sp)
# if t0 goto [pc, 2]
ififElse_label_5:
	lw t0, 60(sp)
	bnez t0, ififElse_label_7
# goto [pc, 9]
ififElse_label_6:
	j ififElse_label_15
# eq t1, b_ififElse_1, 10
ififElse_label_7:
	lw t0, 56(sp)
	li t1, 10
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 2]
ififElse_label_8:
	lw t0, 64(sp)
	bnez t0, ififElse_label_10
# goto [pc, 2]
ififElse_label_9:
	j ififElse_label_11
# mov a_ififElse_1, 25
ififElse_label_10:
	li t2, 25
	sw t2, 52(sp)
# if t1 goto [pc, 3]
ififElse_label_11:
	lw t0, 64(sp)
	bnez t0, ififElse_label_14
# add t2, a_ififElse_1, 15
ififElse_label_12:
	lw t0, 52(sp)
	li t1, 15
	add t2, t0, t1
	sw t2, 68(sp)
# mov a_ififElse_1, t2
ififElse_label_13:
	lw t2, 68(sp)
	sw t2, 52(sp)
ififElse_label_14:
	nop
# return a_ififElse_1
ififElse_label_15:
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
# call t3, ififElse()
main_label_1:
	call ififElse
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
