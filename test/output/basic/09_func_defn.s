	.bss
	a_global_0: .word 0
	.text
	.globl main
	.align 2
func:
	addi sp, sp, -84
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
# sub t0, p_func_1, 1
func_label_0:
	lw t0, 52(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 56(sp)
# mov p_func_1, t0
func_label_1:
	lw t2, 56(sp)
	sw t2, 52(sp)
# return p_func_1
func_label_2:
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
	addi sp, sp, 84
	ret
main:
	addi sp, sp, -76
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
# def b_main_2, 0
main_label_1:
	li t2, 0
	sw t2, 52(sp)
# mov a_global_0, 10
main_label_2:
	li t2, 10
	la t3, a_global_0
	sw t2, 0(t3)
# call t1, func(a_global_0)
main_label_3:
	lw a0, a_global_0
	call func
	sw a0, 56(sp)
# mov b_main_2, t1
main_label_4:
	lw t2, 56(sp)
	sw t2, 52(sp)
# return b_main_2
main_label_5:
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
	addi sp, sp, 76
	ret
