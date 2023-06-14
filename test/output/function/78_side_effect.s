	.data
	a_global_0: .word -1
	b_global_0: .word 1
	.text
	.globl main
	.align 2
inc_a:
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
# def b_inc_a_1, a_global_0
inc_a_label_0:
	lw t2, a_global_0
	sw t2, 52(sp)
# add t0, b_inc_a_1, 1
inc_a_label_1:
	lw t0, 52(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 56(sp)
# mov b_inc_a_1, t0
inc_a_label_2:
	lw t2, 56(sp)
	sw t2, 52(sp)
# mov a_global_0, b_inc_a_1
inc_a_label_3:
	lw t2, 52(sp)
	la t3, a_global_0
	sw t2, 0(t3)
# return a_global_0
inc_a_label_4:
	lw a0, a_global_0
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
main:
	addi sp, sp, -400
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
# def k_main_2, 5
main_label_1:
	li t2, 5
	sw t2, 52(sp)
# geq t1, k_main_2, 0
main_label_2:
	lw t0, 52(sp)
	li t1, 0
	slt t2, t0, t1
	xori t2, t2, 1
	sw t2, 56(sp)
# if t1 goto [pc, 2]
main_label_3:
	lw t0, 56(sp)
	bnez t0, main_label_5
# goto [pc, 55]
main_label_4:
	j main_label_59
# call t2, inc_a()
main_label_5:
	call inc_a
	sw a0, 60(sp)
# if t2 goto [pc, 3]
main_label_6:
	lw t0, 60(sp)
	bnez t0, main_label_9
# mov t6, 0
main_label_7:
	li t2, 0
	sw t2, 64(sp)
# goto [pc, 14]
main_label_8:
	j main_label_22
# call t3, inc_a()
main_label_9:
	call inc_a
	sw a0, 68(sp)
# if t3 goto [pc, 3]
main_label_10:
	lw t0, 68(sp)
	bnez t0, main_label_13
# mov t5, 0
main_label_11:
	li t2, 0
	sw t2, 72(sp)
# goto [pc, 6]
main_label_12:
	j main_label_18
# call t4, inc_a()
main_label_13:
	call inc_a
	sw a0, 76(sp)
# if t4 goto [pc, 3]
main_label_14:
	lw t0, 76(sp)
	bnez t0, main_label_17
# mov t5, 0
main_label_15:
	li t2, 0
	sw t2, 72(sp)
# goto [pc, 2]
main_label_16:
	j main_label_18
# mov t5, 1
main_label_17:
	li t2, 1
	sw t2, 72(sp)
# if t5 goto [pc, 3]
main_label_18:
	lw t0, 72(sp)
	bnez t0, main_label_21
# mov t6, 0
main_label_19:
	li t2, 0
	sw t2, 64(sp)
# goto [pc, 2]
main_label_20:
	j main_label_22
# mov t6, 1
main_label_21:
	li t2, 1
	sw t2, 64(sp)
# if t6 goto [pc, 2]
main_label_22:
	lw t0, 64(sp)
	bnez t0, main_label_24
# goto [pc, 5]
main_label_23:
	j main_label_28
# call t7, putint(a_global_0)
main_label_24:
	lw a0, a_global_0
	call putint
# call t8, putch(32)
main_label_25:
	li a0, 32
	call putch
# call t9, putint(b_global_0)
main_label_26:
	lw a0, b_global_0
	call putint
# call t10, putch(10)
main_label_27:
	li a0, 10
	call putch
# call t11, inc_a()
main_label_28:
	call inc_a
	sw a0, 80(sp)
# lss t12, t11, 14
main_label_29:
	lw t0, 80(sp)
	li t1, 14
	slt t2, t0, t1
	sw t2, 84(sp)
# if t12 goto [pc, 16]
main_label_30:
	lw t0, 84(sp)
	bnez t0, main_label_46
# call t13, inc_a()
main_label_31:
	call inc_a
	sw a0, 88(sp)
# if t13 goto [pc, 3]
main_label_32:
	lw t0, 88(sp)
	bnez t0, main_label_35
# mov t18, 0
main_label_33:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 9]
main_label_34:
	j main_label_43
# call t14, inc_a()
main_label_35:
	call inc_a
	sw a0, 96(sp)
# call t15, inc_a()
main_label_36:
	call inc_a
	sw a0, 100(sp)
# sub t16, t14, t15
main_label_37:
	lw t0, 96(sp)
	lw t1, 100(sp)
	sub t2, t0, t1
	sw t2, 104(sp)
# add t17, t16, 1
main_label_38:
	lw t0, 104(sp)
	li t1, 1
	add t2, t0, t1
	sw t2, 108(sp)
# if t17 goto [pc, 3]
main_label_39:
	lw t0, 108(sp)
	bnez t0, main_label_42
# mov t18, 0
main_label_40:
	li t2, 0
	sw t2, 92(sp)
# goto [pc, 2]
main_label_41:
	j main_label_43
# mov t18, 1
main_label_42:
	li t2, 1
	sw t2, 92(sp)
# if t18 goto [pc, 3]
main_label_43:
	lw t0, 92(sp)
	bnez t0, main_label_46
# mov t19, 0
main_label_44:
	li t2, 0
	sw t2, 112(sp)
# goto [pc, 2]
main_label_45:
	j main_label_47
# mov t19, 1
main_label_46:
	li t2, 1
	sw t2, 112(sp)
# if t19 goto [pc, 2]
main_label_47:
	lw t0, 112(sp)
	bnez t0, main_label_49
# goto [pc, 5]
main_label_48:
	j main_label_53
# call t20, putint(a_global_0)
main_label_49:
	lw a0, a_global_0
	call putint
# call t21, putch(10)
main_label_50:
	li a0, 10
	call putch
# mul t22, b_global_0, 2
main_label_51:
	lw t0, b_global_0
	li t1, 2
	mul t2, t0, t1
	sw t2, 116(sp)
# mov b_global_0, t22
main_label_52:
	lw t2, 116(sp)
	la t3, b_global_0
	sw t2, 0(t3)
# if t19 goto [pc, 2]
main_label_53:
	lw t0, 112(sp)
	bnez t0, main_label_55
# call t23, inc_a()
main_label_54:
	call inc_a
	sw a0, 120(sp)
main_label_55:
	nop
# sub t24, k_main_2, 1
main_label_56:
	lw t0, 52(sp)
	li t1, 1
	sub t2, t0, t1
	sw t2, 124(sp)
# mov k_main_2, t24
main_label_57:
	lw t2, 124(sp)
	sw t2, 52(sp)
# goto [pc, -56]
main_label_58:
	j main_label_2
# call t25, putint(a_global_0)
main_label_59:
	lw a0, a_global_0
	call putint
# call t26, putch(32)
main_label_60:
	li a0, 32
	call putch
# call t27, putint(b_global_0)
main_label_61:
	lw a0, b_global_0
	call putint
# call t28, putch(10)
main_label_62:
	li a0, 10
	call putch
# return a_global_0
main_label_63:
	lw a0, a_global_0
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
	addi sp, sp, 400
	ret
