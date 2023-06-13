	.bss
	a_global_0: .word 0
	b_global_0: .word 0
	.text
	.globl main
	.align 2
main:
	addi sp, sp, -104
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
# mov a_global_0, 4
main_label_1:
	li t2, 4
	la t3, a_global_0
	sw t2, 0(t3)
# mov b_global_0, 4
main_label_2:
	li t2, 4
	la t3, b_global_0
	sw t2, 0(t3)
# def c_main_1, 0
main_label_3:
	li t2, 0
	sw t2, 52(sp)
# eq t0, a_global_0, b_global_0
main_label_4:
	lw t0, a_global_0
	lw t1, b_global_0
	sub t2, t0, t1
	seqz t2, t2
	sw t2, 56(sp)
# if t0 goto [pc, 3]
main_label_5:
	lw t0, 56(sp)
	bnez t0, main_label_8
# mov t2, 0
main_label_6:
	li t2, 0
	sw t2, 60(sp)
# goto [pc, 6]
main_label_7:
	j main_label_13
# neq t1, a_global_0, 3
main_label_8:
	lw t0, a_global_0
	li t1, 3
	sub t2, t0, t1
	snez t2, t2
	sw t2, 64(sp)
# if t1 goto [pc, 3]
main_label_9:
	lw t0, 64(sp)
	bnez t0, main_label_12
# mov t2, 0
main_label_10:
	li t2, 0
	sw t2, 60(sp)
# goto [pc, 2]
main_label_11:
	j main_label_13
# mov t2, 1
main_label_12:
	li t2, 1
	sw t2, 60(sp)
# if t2 goto [pc, 2]
main_label_13:
	lw t0, 60(sp)
	bnez t0, main_label_15
# goto [pc, 2]
main_label_14:
	j main_label_16
# mov c_main_1, 1
main_label_15:
	li t2, 1
	sw t2, 52(sp)
# if t2 goto [pc, 2]
main_label_16:
	lw t0, 60(sp)
	bnez t0, main_label_18
# mov c_main_1, 0
main_label_17:
	li t2, 0
	sw t2, 52(sp)
main_label_18:
	nop
# return c_main_1
main_label_19:
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
	addi sp, sp, 104
	ret
