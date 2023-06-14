	.text
	.globl main
	.align 2
whileIf:
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
# def a_whileIf_1, 0
whileIf_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_whileIf_1, 0
whileIf_label_1:
	li t2, 0
	sw t2, 52(sp)
# def b_whileIf_1, 0
whileIf_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov b_whileIf_1, 0
whileIf_label_3:
	li t2, 0
	sw t2, 56(sp)
# lss t0, a_whileIf_1, 100
whileIf_label_4:
	lw t0, 52(sp)
	li t1, 100
	slt t2, t0, t1
	sw t2, 60(sp)
# if t0 goto [pc, 2]
whileIf_label_5:
	lw t0, 60(sp)
	bnez t0, whileIf_label_7
# goto [pc, 18]
whileIf_label_6:
	j whileIf_label_24
# eq t1, a_whileIf_1, 5
whileIf_label_7:
	lw t0, 52(sp)
	li t1, 5
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 2]
whileIf_label_8:
	lw t0, 64(sp)
	bnez t0, whileIf_label_10
# goto [pc, 2]
whileIf_label_9:
	j whileIf_label_11
# mov b_whileIf_1, 25
whileIf_label_10:
	li t2, 25
	sw t2, 56(sp)
# if t1 goto [pc, 9]
whileIf_label_11:
	lw t0, 64(sp)
	bnez t0, whileIf_label_20
# eq t2, a_whileIf_1, 10
whileIf_label_12:
	lw t0, 52(sp)
	li t1, 10
	xor t2, t0, t1
	seqz t2, t2
	sw t2, 68(sp)
# if t2 goto [pc, 2]
whileIf_label_13:
	lw t0, 68(sp)
	bnez t0, whileIf_label_15
# goto [pc, 2]
whileIf_label_14:
	j whileIf_label_16
# mov b_whileIf_1, 42
whileIf_label_15:
	li t2, 42
	sw t2, 56(sp)
# if t2 goto [pc, 3]
whileIf_label_16:
	lw t0, 68(sp)
	bnez t0, whileIf_label_19
# mul t3, a_whileIf_1, 2
whileIf_label_17:
	lw t0, 52(sp)
	li t1, 2
	mul t2, t0, t1
	sw t2, 72(sp)
# mov b_whileIf_1, t3
whileIf_label_18:
	lw t2, 72(sp)
	sw t2, 56(sp)
whileIf_label_19:
	nop
whileIf_label_20:
	nop
# add t4, a_whileIf_1, 1
whileIf_label_21:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 76(sp)
# mov a_whileIf_1, t4
whileIf_label_22:
	lw t2, 76(sp)
	sw t2, 52(sp)
# goto [pc, -19]
whileIf_label_23:
	j whileIf_label_4
# return b_whileIf_1
whileIf_label_24:
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
	addi sp, sp, 156
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
# call t5, whileIf()
main_label_1:
	call whileIf
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
