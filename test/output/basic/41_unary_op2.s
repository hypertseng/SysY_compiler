	.text
	.globl main
	.align 2
main:
	addi sp, sp, -180
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
# def a_main_1, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# def b_main_1, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# mov a_main_1, 070
main_label_3:
	li t2, 070
	sw t2, 52(sp)
# mov b_main_1, 0x4
main_label_4:
	li t2, 0x4
	sw t2, 56(sp)
# sub t0, a_main_1, -4
main_label_5:
	lw t0, 52(sp)
	li t1, -4
	sub t2, t0, t1
	sw t2, 60(sp)
# add t1, t0, b_main_1
main_label_6:
	lw t0, 60(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 64(sp)
# mov a_main_1, t1
main_label_7:
	lw t2, 64(sp)
	sw t2, 52(sp)
# not t2, a_main_1
main_label_8:
	lw t0, 52(sp)
	seqz t2, t0
	sw t2, 68(sp)
# not t3, t2
main_label_9:
	lw t0, 68(sp)
	seqz t2, t0
	sw t2, 72(sp)
# not t4, t3
main_label_10:
	lw t0, 72(sp)
	seqz t2, t0
	sw t2, 76(sp)
# mov t5, 0
main_label_11:
	li t2, 0
	sw t2, 80(sp)
# sub t5, t5, t4
main_label_12:
	lw t0, 80(sp)
	lw t1, 76(sp)
	sub t2, t0, t1
	sw t2, 80(sp)
# if t5 goto [pc, 2]
main_label_13:
	lw t0, 80(sp)
	bnez t0, main_label_15
# goto [pc, 2]
main_label_14:
	j main_label_16
# mov a_main_1, -1
main_label_15:
	li t2, -1
	sw t2, 52(sp)
# if t5 goto [pc, 3]
main_label_16:
	lw t0, 80(sp)
	bnez t0, main_label_19
# add t6, 0, b_main_1
main_label_17:
	li t0, 0
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 84(sp)
# mov a_main_1, t6
main_label_18:
	lw t2, 84(sp)
	sw t2, 52(sp)
main_label_19:
	nop
# call t7, putint(a_main_1)
main_label_20:
	sw a0, 88(sp)
	lw a0, 52(sp)
	call putint
	lw a0, 52(sp)
# return 0
main_label_21:
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
	addi sp, sp, 180
	ret
