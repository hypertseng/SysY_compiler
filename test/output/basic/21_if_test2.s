	.text
	.globl main
	.align 2
ifElseIf:
	addi sp, sp, -248
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
# def a_ifElseIf_1, 0
ifElseIf_label_0:
	li t2, 0
	sw t2, 52(sp)
# mov a_ifElseIf_1, 5
ifElseIf_label_1:
	li t2, 5
	sw t2, 52(sp)
# def b_ifElseIf_1, 0
ifElseIf_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov b_ifElseIf_1, 10
ifElseIf_label_3:
	li t2, 10
	sw t2, 56(sp)
# eq t0, a_ifElseIf_1, 6
ifElseIf_label_4:
	lw t0, 52(sp)
	li t1, 6
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 60(sp)
# if t0 goto [pc, 5]
ifElseIf_label_5:
	lw t0, 60(sp)
	bnez t0, ifElseIf_label_10
# eq t1, b_ifElseIf_1, 0xb
ifElseIf_label_6:
	lw t0, 56(sp)
	li t1, 0xb
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 3]
ifElseIf_label_7:
	lw t0, 64(sp)
	bnez t0, ifElseIf_label_10
# mov t2, 0
ifElseIf_label_8:
	li t2, 0
	sw t2, 68(sp)
# goto [pc, 2]
ifElseIf_label_9:
	j ifElseIf_label_11
# mov t2, 1
ifElseIf_label_10:
	li t2, 1
	sw t2, 68(sp)
# if t2 goto [pc, 2]
ifElseIf_label_11:
	lw t0, 68(sp)
	bnez t0, ifElseIf_label_13
# goto [pc, 2]
ifElseIf_label_12:
	j ifElseIf_label_14
# return a_ifElseIf_1
ifElseIf_label_13:
	lw a0, 52(sp)
# if t2 goto [pc, 33]
ifElseIf_label_14:
	lw t0, 68(sp)
	bnez t0, ifElseIf_label_47
# eq t3, b_ifElseIf_1, 10
ifElseIf_label_15:
	lw t0, 56(sp)
	li t1, 10
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 72(sp)
# if t3 goto [pc, 3]
ifElseIf_label_16:
	lw t0, 72(sp)
	bnez t0, ifElseIf_label_19
# mov t5, 0
ifElseIf_label_17:
	li t2, 0
	sw t2, 76(sp)
# goto [pc, 6]
ifElseIf_label_18:
	j ifElseIf_label_24
# eq t4, a_ifElseIf_1, 1
ifElseIf_label_19:
	lw t0, 52(sp)
	li t1, 1
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 80(sp)
# if t4 goto [pc, 3]
ifElseIf_label_20:
	lw t0, 80(sp)
	bnez t0, ifElseIf_label_23
# mov t5, 0
ifElseIf_label_21:
	li t2, 0
	sw t2, 76(sp)
# goto [pc, 2]
ifElseIf_label_22:
	j ifElseIf_label_24
# mov t5, 1
ifElseIf_label_23:
	li t2, 1
	sw t2, 76(sp)
# if t5 goto [pc, 2]
ifElseIf_label_24:
	lw t0, 76(sp)
	bnez t0, ifElseIf_label_26
# goto [pc, 2]
ifElseIf_label_25:
	j ifElseIf_label_27
# mov a_ifElseIf_1, 25
ifElseIf_label_26:
	li t2, 25
	sw t2, 52(sp)
# if t5 goto [pc, 19]
ifElseIf_label_27:
	lw t0, 76(sp)
	bnez t0, ifElseIf_label_46
# eq t6, b_ifElseIf_1, 10
ifElseIf_label_28:
	lw t0, 56(sp)
	li t1, 10
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 84(sp)
# if t6 goto [pc, 3]
ifElseIf_label_29:
	lw t0, 84(sp)
	bnez t0, ifElseIf_label_32
# mov t8, 0
ifElseIf_label_30:
	li t2, 0
	sw t2, 88(sp)
# goto [pc, 6]
ifElseIf_label_31:
	j ifElseIf_label_37
# eq t7, a_ifElseIf_1, -5
ifElseIf_label_32:
	lw t0, 52(sp)
	li t1, -5
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 92(sp)
# if t7 goto [pc, 3]
ifElseIf_label_33:
	lw t0, 92(sp)
	bnez t0, ifElseIf_label_36
# mov t8, 0
ifElseIf_label_34:
	li t2, 0
	sw t2, 88(sp)
# goto [pc, 2]
ifElseIf_label_35:
	j ifElseIf_label_37
# mov t8, 1
ifElseIf_label_36:
	li t2, 1
	sw t2, 88(sp)
# if t8 goto [pc, 2]
ifElseIf_label_37:
	lw t0, 88(sp)
	bnez t0, ifElseIf_label_39
# goto [pc, 3]
ifElseIf_label_38:
	j ifElseIf_label_41
# add t9, a_ifElseIf_1, 15
ifElseIf_label_39:
	lw t0, 52(sp)
	li t1, 15
	add t2, t0, t1
	sw t2, 96(sp)
# mov a_ifElseIf_1, t9
ifElseIf_label_40:
	lw t2, 96(sp)
	sw t2, 52(sp)
# if t8 goto [pc, 4]
ifElseIf_label_41:
	lw t0, 88(sp)
	bnez t0, ifElseIf_label_45
# mov t10, 0
ifElseIf_label_42:
	li t2, 0
	sw t2, 100(sp)
# sub t10, t10, a_ifElseIf_1
ifElseIf_label_43:
	lw t0, 100(sp)
	lw t1, 52(sp)
	sub t2, t0, t1
	sw t2, 100(sp)
# mov a_ifElseIf_1, t10
ifElseIf_label_44:
	lw t2, 100(sp)
	sw t2, 52(sp)
ifElseIf_label_45:
	nop
ifElseIf_label_46:
	nop
ifElseIf_label_47:
	nop
# return a_ifElseIf_1
ifElseIf_label_48:
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
	addi sp, sp, 248
	ret
main:
	addi sp, sp, -56
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
# call t12, ifElseIf()
main_label_1:
	call ifElseIf
	sw a0, 52(sp)
# call t11, putint(t12)
main_label_2:
	lw a0, 52(sp)
	call putint
# return 0
main_label_3:
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
	addi sp, sp, 56
	ret
