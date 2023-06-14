	.text
	.globl main
	.align 2
main:
	addi sp, sp, -260
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
# alloc a_main_1, 8
main_label_1:
# store 0, a_main_1, 0
main_label_2:
	addi t2, sp, 52
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 1
main_label_3:
	addi t2, sp, 52
	li t1, 1
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 2
main_label_4:
	addi t2, sp, 52
	li t1, 2
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 3
main_label_5:
	addi t2, sp, 52
	li t1, 3
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 4
main_label_6:
	addi t2, sp, 52
	li t1, 4
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 5
main_label_7:
	addi t2, sp, 52
	li t1, 5
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 6
main_label_8:
	addi t2, sp, 52
	li t1, 6
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# store 0, a_main_1, 7
main_label_9:
	addi t2, sp, 52
	li t1, 7
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 0
	sw t1, 0(t2)
# alloc b_main_1, 8
main_label_10:
# store 1, b_main_1, 0
main_label_11:
	addi t2, sp, 84
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 1
	sw t1, 0(t2)
# store 2, b_main_1, 1
main_label_12:
	addi t2, sp, 84
	li t1, 1
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 2
	sw t1, 0(t2)
# store 3, b_main_1, 2
main_label_13:
	addi t2, sp, 84
	li t1, 2
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 3
	sw t1, 0(t2)
# store 4, b_main_1, 3
main_label_14:
	addi t2, sp, 84
	li t1, 3
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 4
	sw t1, 0(t2)
# store 5, b_main_1, 4
main_label_15:
	addi t2, sp, 84
	li t1, 4
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 5
	sw t1, 0(t2)
# store 6, b_main_1, 5
main_label_16:
	addi t2, sp, 84
	li t1, 5
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 6
	sw t1, 0(t2)
# store 7, b_main_1, 6
main_label_17:
	addi t2, sp, 84
	li t1, 6
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 7
	sw t1, 0(t2)
# store 8, b_main_1, 7
main_label_18:
	addi t2, sp, 84
	li t1, 7
	slli t1, t1, 2
	add t2, t2, t1
	li t1, 8
	sw t1, 0(t2)
# load t0, b_main_1, 7
main_label_19:
	addi t2, sp, 84
	li t1, 7
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 116(sp)
# load t1, b_main_1, 0
main_label_20:
	addi t2, sp, 84
	li t1, 0
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 120(sp)
# add t2, t0, t1
main_label_21:
	lw t0, 116(sp)
	lw t1, 120(sp)
	add t2, t0, t1
	sw t2, 124(sp)
# load t3, b_main_1, 1
main_label_22:
	addi t2, sp, 84
	li t1, 1
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 128(sp)
# add t4, t2, t3
main_label_23:
	lw t0, 124(sp)
	lw t1, 128(sp)
	add t2, t0, t1
	sw t2, 132(sp)
# load t5, b_main_1, 4
main_label_24:
	addi t2, sp, 84
	li t1, 4
	slli t1, t1, 2
	add t2, t2, t1
	lw t2, 0(t2)
	sw t2, 136(sp)
# add t6, t4, t5
main_label_25:
	lw t0, 132(sp)
	lw t1, 136(sp)
	add t2, t0, t1
	sw t2, 140(sp)
# return t6
main_label_26:
	lw a0, 140(sp)
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
	addi sp, sp, 260
	ret
