	.text
	.globl main
	.align 2
main:
	addi sp, sp, -92
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
# def b0_main_1, 0
main_label_2:
	li t2, 0
	sw t2, 56(sp)
# def _c_main_1, 0
main_label_3:
	li t2, 0
	sw t2, 60(sp)
# mov a_main_1, 1
main_label_4:
	li t2, 1
	sw t2, 52(sp)
# mov b0_main_1, 2
main_label_5:
	li t2, 2
	sw t2, 56(sp)
# mov _c_main_1, 3
main_label_6:
	li t2, 3
	sw t2, 60(sp)
# add t0, b0_main_1, _c_main_1
main_label_7:
	lw t0, 56(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 64(sp)
# return t0
main_label_8:
	lw a0, 64(sp)
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
	addi sp, sp, 92
	ret
