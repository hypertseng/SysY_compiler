	.bss
	a0_global_0: .word 0
	a1_global_0: .word 0
	a2_global_0: .word 0
	a3_global_0: .word 0
	a4_global_0: .word 0
	a5_global_0: .word 0
	a6_global_0: .word 0
	a7_global_0: .word 0
	a8_global_0: .word 0
	a9_global_0: .word 0
	a10_global_0: .word 0
	a11_global_0: .word 0
	a12_global_0: .word 0
	a13_global_0: .word 0
	a14_global_0: .word 0
	a15_global_0: .word 0
	a16_global_0: .word 0
	a17_global_0: .word 0
	a18_global_0: .word 0
	a19_global_0: .word 0
	a20_global_0: .word 0
	a21_global_0: .word 0
	a22_global_0: .word 0
	a23_global_0: .word 0
	a24_global_0: .word 0
	a25_global_0: .word 0
	a26_global_0: .word 0
	a27_global_0: .word 0
	a28_global_0: .word 0
	a29_global_0: .word 0
	a30_global_0: .word 0
	a31_global_0: .word 0
	a32_global_0: .word 0
	a33_global_0: .word 0
	a34_global_0: .word 0
	a35_global_0: .word 0
	a36_global_0: .word 0
	a37_global_0: .word 0
	a38_global_0: .word 0
	a39_global_0: .word 0
	.text
	.globl main
	.align 2
testParam8:
	addi sp, sp, -396
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
	sw a1, 56(sp)
	sw a2, 60(sp)
	sw a3, 64(sp)
	sw a4, 68(sp)
	sw a5, 72(sp)
	sw a6, 76(sp)
	sw a7, 80(sp)
# add t0, a0_testParam8_1, a1_testParam8_1
testParam8_label_0:
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 84(sp)
# add t1, t0, a2_testParam8_1
testParam8_label_1:
	lw t0, 84(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 88(sp)
# add t2, t1, a3_testParam8_1
testParam8_label_2:
	lw t0, 88(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 92(sp)
# add t3, t2, a4_testParam8_1
testParam8_label_3:
	lw t0, 92(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 96(sp)
# add t4, t3, a5_testParam8_1
testParam8_label_4:
	lw t0, 96(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 100(sp)
# add t5, t4, a6_testParam8_1
testParam8_label_5:
	lw t0, 100(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 104(sp)
# add t6, t5, a7_testParam8_1
testParam8_label_6:
	lw t0, 104(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 108(sp)
# return t6
testParam8_label_7:
	lw a0, 108(sp)
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
	addi sp, sp, 396
	ret
testParam16:
	addi sp, sp, -1260
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
	sw a1, 56(sp)
	sw a2, 60(sp)
	sw a3, 64(sp)
	sw a4, 68(sp)
	sw a5, 72(sp)
	sw a6, 76(sp)
	sw a7, 80(sp)
	sw a8, 84(sp)
	sw a9, 88(sp)
	sw a10, 92(sp)
	sw a11, 96(sp)
	sw a12, 100(sp)
	sw a13, 104(sp)
	sw a14, 108(sp)
	sw a15, 112(sp)
# add t7, a0_testParam16_2, a1_testParam16_2
testParam16_label_0:
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 116(sp)
# add t8, t7, a2_testParam16_2
testParam16_label_1:
	lw t0, 116(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 120(sp)
# sub t9, t8, a3_testParam16_2
testParam16_label_2:
	lw t0, 120(sp)
	lw t1, 64(sp)
	sub t2, t0, t1
	sw t2, 124(sp)
# sub t10, t9, a4_testParam16_2
testParam16_label_3:
	lw t0, 124(sp)
	lw t1, 68(sp)
	sub t2, t0, t1
	sw t2, 128(sp)
# sub t11, t10, a5_testParam16_2
testParam16_label_4:
	lw t0, 128(sp)
	lw t1, 72(sp)
	sub t2, t0, t1
	sw t2, 132(sp)
# sub t12, t11, a6_testParam16_2
testParam16_label_5:
	lw t0, 132(sp)
	lw t1, 76(sp)
	sub t2, t0, t1
	sw t2, 136(sp)
# sub t13, t12, a7_testParam16_2
testParam16_label_6:
	lw t0, 136(sp)
	lw t1, 80(sp)
	sub t2, t0, t1
	sw t2, 140(sp)
# add t14, t13, a8_testParam16_2
testParam16_label_7:
	lw t0, 140(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 144(sp)
# add t15, t14, a9_testParam16_2
testParam16_label_8:
	lw t0, 144(sp)
	lw t1, 88(sp)
	add t2, t0, t1
	sw t2, 148(sp)
# add t16, t15, a10_testParam16_2
testParam16_label_9:
	lw t0, 148(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 152(sp)
# add t17, t16, a11_testParam16_2
testParam16_label_10:
	lw t0, 152(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 156(sp)
# add t18, t17, a12_testParam16_2
testParam16_label_11:
	lw t0, 156(sp)
	lw t1, 100(sp)
	add t2, t0, t1
	sw t2, 160(sp)
# add t19, t18, a13_testParam16_2
testParam16_label_12:
	lw t0, 160(sp)
	lw t1, 104(sp)
	add t2, t0, t1
	sw t2, 164(sp)
# add t20, t19, a14_testParam16_2
testParam16_label_13:
	lw t0, 164(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 168(sp)
# add t21, t20, a15_testParam16_2
testParam16_label_14:
	lw t0, 168(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 172(sp)
# return t21
testParam16_label_15:
	lw a0, 172(sp)
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
	addi sp, sp, 1260
	ret
testParam32:
	addi sp, sp, -4524
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
	sw a1, 56(sp)
	sw a2, 60(sp)
	sw a3, 64(sp)
	sw a4, 68(sp)
	sw a5, 72(sp)
	sw a6, 76(sp)
	sw a7, 80(sp)
	sw a8, 84(sp)
	sw a9, 88(sp)
	sw a10, 92(sp)
	sw a11, 96(sp)
	sw a12, 100(sp)
	sw a13, 104(sp)
	sw a14, 108(sp)
	sw a15, 112(sp)
	sw a16, 116(sp)
	sw a17, 120(sp)
	sw a18, 124(sp)
	sw a19, 128(sp)
	sw a20, 132(sp)
	sw a21, 136(sp)
	sw a22, 140(sp)
	sw a23, 144(sp)
	sw a24, 148(sp)
	sw a25, 152(sp)
	sw a26, 156(sp)
	sw a27, 160(sp)
	sw a28, 164(sp)
	sw a29, 168(sp)
	sw a30, 172(sp)
	sw a31, 176(sp)
# add t22, a0_testParam32_3, a1_testParam32_3
testParam32_label_0:
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 180(sp)
# add t23, t22, a2_testParam32_3
testParam32_label_1:
	lw t0, 180(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 184(sp)
# add t24, t23, a3_testParam32_3
testParam32_label_2:
	lw t0, 184(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 188(sp)
# add t25, t24, a4_testParam32_3
testParam32_label_3:
	lw t0, 188(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 192(sp)
# add t26, t25, a5_testParam32_3
testParam32_label_4:
	lw t0, 192(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 196(sp)
# add t27, t26, a6_testParam32_3
testParam32_label_5:
	lw t0, 196(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 200(sp)
# add t28, t27, a7_testParam32_3
testParam32_label_6:
	lw t0, 200(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 204(sp)
# add t29, t28, a8_testParam32_3
testParam32_label_7:
	lw t0, 204(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 208(sp)
# add t30, t29, a9_testParam32_3
testParam32_label_8:
	lw t0, 208(sp)
	lw t1, 88(sp)
	add t2, t0, t1
	sw t2, 212(sp)
# add t31, t30, a10_testParam32_3
testParam32_label_9:
	lw t0, 212(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 216(sp)
# add t32, t31, a11_testParam32_3
testParam32_label_10:
	lw t0, 216(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 220(sp)
# add t33, t32, a12_testParam32_3
testParam32_label_11:
	lw t0, 220(sp)
	lw t1, 100(sp)
	add t2, t0, t1
	sw t2, 224(sp)
# add t34, t33, a13_testParam32_3
testParam32_label_12:
	lw t0, 224(sp)
	lw t1, 104(sp)
	add t2, t0, t1
	sw t2, 228(sp)
# add t35, t34, a14_testParam32_3
testParam32_label_13:
	lw t0, 228(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 232(sp)
# add t36, t35, a15_testParam32_3
testParam32_label_14:
	lw t0, 232(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 236(sp)
# add t37, t36, a16_testParam32_3
testParam32_label_15:
	lw t0, 236(sp)
	lw t1, 116(sp)
	add t2, t0, t1
	sw t2, 240(sp)
# add t38, t37, a17_testParam32_3
testParam32_label_16:
	lw t0, 240(sp)
	lw t1, 120(sp)
	add t2, t0, t1
	sw t2, 244(sp)
# sub t39, t38, a18_testParam32_3
testParam32_label_17:
	lw t0, 244(sp)
	lw t1, 124(sp)
	sub t2, t0, t1
	sw t2, 248(sp)
# sub t40, t39, a19_testParam32_3
testParam32_label_18:
	lw t0, 248(sp)
	lw t1, 128(sp)
	sub t2, t0, t1
	sw t2, 252(sp)
# sub t41, t40, a20_testParam32_3
testParam32_label_19:
	lw t0, 252(sp)
	lw t1, 132(sp)
	sub t2, t0, t1
	sw t2, 256(sp)
# sub t42, t41, a21_testParam32_3
testParam32_label_20:
	lw t0, 256(sp)
	lw t1, 136(sp)
	sub t2, t0, t1
	sw t2, 260(sp)
# sub t43, t42, a22_testParam32_3
testParam32_label_21:
	lw t0, 260(sp)
	lw t1, 140(sp)
	sub t2, t0, t1
	sw t2, 264(sp)
# add t44, t43, a23_testParam32_3
testParam32_label_22:
	lw t0, 264(sp)
	lw t1, 144(sp)
	add t2, t0, t1
	sw t2, 268(sp)
# add t45, t44, a24_testParam32_3
testParam32_label_23:
	lw t0, 268(sp)
	lw t1, 148(sp)
	add t2, t0, t1
	sw t2, 272(sp)
# add t46, t45, a25_testParam32_3
testParam32_label_24:
	lw t0, 272(sp)
	lw t1, 152(sp)
	add t2, t0, t1
	sw t2, 276(sp)
# add t47, t46, a26_testParam32_3
testParam32_label_25:
	lw t0, 276(sp)
	lw t1, 156(sp)
	add t2, t0, t1
	sw t2, 280(sp)
# add t48, t47, a27_testParam32_3
testParam32_label_26:
	lw t0, 280(sp)
	lw t1, 160(sp)
	add t2, t0, t1
	sw t2, 284(sp)
# add t49, t48, a28_testParam32_3
testParam32_label_27:
	lw t0, 284(sp)
	lw t1, 164(sp)
	add t2, t0, t1
	sw t2, 288(sp)
# add t50, t49, a29_testParam32_3
testParam32_label_28:
	lw t0, 288(sp)
	lw t1, 168(sp)
	add t2, t0, t1
	sw t2, 292(sp)
# add t51, t50, a30_testParam32_3
testParam32_label_29:
	lw t0, 292(sp)
	lw t1, 172(sp)
	add t2, t0, t1
	sw t2, 296(sp)
# add t52, t51, a31_testParam32_3
testParam32_label_30:
	lw t0, 296(sp)
	lw t1, 176(sp)
	add t2, t0, t1
	sw t2, 300(sp)
# return t52
testParam32_label_31:
	lw a0, 300(sp)
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
	addi sp, sp, 4524
	ret
main:
	addi sp, sp, -88
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
# mov a0_global_0, 0
main_label_1:
	li t2, 0
	la t3, a0_global_0
	sw t2, 0(t3)
# mov a1_global_0, 1
main_label_2:
	li t2, 1
	la t3, a1_global_0
	sw t2, 0(t3)
# mov a2_global_0, 2
main_label_3:
	li t2, 2
	la t3, a2_global_0
	sw t2, 0(t3)
# mov a3_global_0, 3
main_label_4:
	li t2, 3
	la t3, a3_global_0
	sw t2, 0(t3)
# mov a4_global_0, 4
main_label_5:
	li t2, 4
	la t3, a4_global_0
	sw t2, 0(t3)
# mov a5_global_0, 5
main_label_6:
	li t2, 5
	la t3, a5_global_0
	sw t2, 0(t3)
# mov a6_global_0, 6
main_label_7:
	li t2, 6
	la t3, a6_global_0
	sw t2, 0(t3)
# mov a7_global_0, 7
main_label_8:
	li t2, 7
	la t3, a7_global_0
	sw t2, 0(t3)
# mov a8_global_0, 8
main_label_9:
	li t2, 8
	la t3, a8_global_0
	sw t2, 0(t3)
# mov a9_global_0, 9
main_label_10:
	li t2, 9
	la t3, a9_global_0
	sw t2, 0(t3)
# mov a10_global_0, 0
main_label_11:
	li t2, 0
	la t3, a10_global_0
	sw t2, 0(t3)
# mov a11_global_0, 1
main_label_12:
	li t2, 1
	la t3, a11_global_0
	sw t2, 0(t3)
# mov a12_global_0, 2
main_label_13:
	li t2, 2
	la t3, a12_global_0
	sw t2, 0(t3)
# mov a13_global_0, 3
main_label_14:
	li t2, 3
	la t3, a13_global_0
	sw t2, 0(t3)
# mov a14_global_0, 4
main_label_15:
	li t2, 4
	la t3, a14_global_0
	sw t2, 0(t3)
# mov a15_global_0, 5
main_label_16:
	li t2, 5
	la t3, a15_global_0
	sw t2, 0(t3)
# mov a16_global_0, 6
main_label_17:
	li t2, 6
	la t3, a16_global_0
	sw t2, 0(t3)
# mov a17_global_0, 7
main_label_18:
	li t2, 7
	la t3, a17_global_0
	sw t2, 0(t3)
# mov a18_global_0, 8
main_label_19:
	li t2, 8
	la t3, a18_global_0
	sw t2, 0(t3)
# mov a19_global_0, 9
main_label_20:
	li t2, 9
	la t3, a19_global_0
	sw t2, 0(t3)
# mov a20_global_0, 0
main_label_21:
	li t2, 0
	la t3, a20_global_0
	sw t2, 0(t3)
# mov a21_global_0, 1
main_label_22:
	li t2, 1
	la t3, a21_global_0
	sw t2, 0(t3)
# mov a22_global_0, 2
main_label_23:
	li t2, 2
	la t3, a22_global_0
	sw t2, 0(t3)
# mov a23_global_0, 3
main_label_24:
	li t2, 3
	la t3, a23_global_0
	sw t2, 0(t3)
# mov a24_global_0, 4
main_label_25:
	li t2, 4
	la t3, a24_global_0
	sw t2, 0(t3)
# mov a25_global_0, 5
main_label_26:
	li t2, 5
	la t3, a25_global_0
	sw t2, 0(t3)
# mov a26_global_0, 6
main_label_27:
	li t2, 6
	la t3, a26_global_0
	sw t2, 0(t3)
# mov a27_global_0, 7
main_label_28:
	li t2, 7
	la t3, a27_global_0
	sw t2, 0(t3)
# mov a28_global_0, 8
main_label_29:
	li t2, 8
	la t3, a28_global_0
	sw t2, 0(t3)
# mov a29_global_0, 9
main_label_30:
	li t2, 9
	la t3, a29_global_0
	sw t2, 0(t3)
# mov a30_global_0, 0
main_label_31:
	li t2, 0
	la t3, a30_global_0
	sw t2, 0(t3)
# mov a31_global_0, 1
main_label_32:
	li t2, 1
	la t3, a31_global_0
	sw t2, 0(t3)
# mov a32_global_0, 4
main_label_33:
	li t2, 4
	la t3, a32_global_0
	sw t2, 0(t3)
# mov a33_global_0, 5
main_label_34:
	li t2, 5
	la t3, a33_global_0
	sw t2, 0(t3)
# mov a34_global_0, 6
main_label_35:
	li t2, 6
	la t3, a34_global_0
	sw t2, 0(t3)
# mov a35_global_0, 7
main_label_36:
	li t2, 7
	la t3, a35_global_0
	sw t2, 0(t3)
# mov a36_global_0, 8
main_label_37:
	li t2, 8
	la t3, a36_global_0
	sw t2, 0(t3)
# mov a37_global_0, 9
main_label_38:
	li t2, 9
	la t3, a37_global_0
	sw t2, 0(t3)
# mov a38_global_0, 0
main_label_39:
	li t2, 0
	la t3, a38_global_0
	sw t2, 0(t3)
# mov a39_global_0, 1
main_label_40:
	li t2, 1
	la t3, a39_global_0
	sw t2, 0(t3)
# call t53, testParam8(a0_global_0, a1_global_0, a2_global_0, a3_global_0, a4_global_0, a5_global_0, a6_global_0, a7_global_0)
main_label_41:
	lw a0, a0_global_0
	lw a1, a1_global_0
	lw a2, a2_global_0
	lw a3, a3_global_0
	lw a4, a4_global_0
	lw a5, a5_global_0
	lw a6, a6_global_0
	lw a7, a7_global_0
	call testParam8
	sw a0, 52(sp)
# mov a0_global_0, t53
main_label_42:
	lw t2, 52(sp)
	la t3, a0_global_0
	sw t2, 0(t3)
# call t54, putint(a0_global_0)
main_label_43:
	lw a0, a0_global_0
	call putint
# call t55, testParam16(a32_global_0, a33_global_0, a34_global_0, a35_global_0, a36_global_0, a37_global_0, a38_global_0, a39_global_0, a8_global_0, a9_global_0, a10_global_0, a11_global_0, a12_global_0, a13_global_0, a14_global_0, a15_global_0)
main_label_44:
	lw a0, a32_global_0
	lw a1, a33_global_0
	lw a2, a34_global_0
	lw a3, a35_global_0
	lw a4, a36_global_0
	lw a5, a37_global_0
	lw a6, a38_global_0
	lw a7, a39_global_0
	lw a8, a8_global_0
	lw a9, a9_global_0
	lw a10, a10_global_0
	lw a11, a11_global_0
	lw a12, a12_global_0
	lw a13, a13_global_0
	lw a14, a14_global_0
	lw a15, a15_global_0
	call testParam16
	sw a0, 56(sp)
# mov a0_global_0, t55
main_label_45:
	lw t2, 56(sp)
	la t3, a0_global_0
	sw t2, 0(t3)
# call t56, putint(a0_global_0)
main_label_46:
	lw a0, a0_global_0
	call putint
# call t57, testParam32(a0_global_0, a1_global_0, a2_global_0, a3_global_0, a4_global_0, a5_global_0, a6_global_0, a7_global_0, a8_global_0, a9_global_0, a10_global_0, a11_global_0, a12_global_0, a13_global_0, a14_global_0, a15_global_0, a16_global_0, a17_global_0, a18_global_0, a19_global_0, a20_global_0, a21_global_0, a22_global_0, a23_global_0, a24_global_0, a25_global_0, a26_global_0, a27_global_0, a28_global_0, a29_global_0, a30_global_0, a31_global_0)
main_label_47:
	lw a0, a0_global_0
	lw a1, a1_global_0
	lw a2, a2_global_0
	lw a3, a3_global_0
	lw a4, a4_global_0
	lw a5, a5_global_0
	lw a6, a6_global_0
	lw a7, a7_global_0
	lw a8, a8_global_0
	lw a9, a9_global_0
	lw a10, a10_global_0
	lw a11, a11_global_0
	lw a12, a12_global_0
	lw a13, a13_global_0
	lw a14, a14_global_0
	lw a15, a15_global_0
	lw a16, a16_global_0
	lw a17, a17_global_0
	lw a18, a18_global_0
	lw a19, a19_global_0
	lw a20, a20_global_0
	lw a21, a21_global_0
	lw a22, a22_global_0
	lw a23, a23_global_0
	lw a24, a24_global_0
	lw a25, a25_global_0
	lw a26, a26_global_0
	lw a27, a27_global_0
	lw a28, a28_global_0
	lw a29, a29_global_0
	lw a30, a30_global_0
	lw a31, a31_global_0
	call testParam32
	sw a0, 60(sp)
# mov a0_global_0, t57
main_label_48:
	lw t2, 60(sp)
	la t3, a0_global_0
	sw t2, 0(t3)
# call t58, putint(a0_global_0)
main_label_49:
	lw a0, a0_global_0
	call putint
# return 0
main_label_50:
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
	addi sp, sp, 88
	ret
