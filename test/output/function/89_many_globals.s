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
	lw t2, -1(sp)
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 84(sp)
	lw t2, -1(sp)
	lw t0, 84(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 88(sp)
	lw t2, -1(sp)
	lw t0, 88(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 92(sp)
	lw t2, -1(sp)
	lw t0, 92(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 96(sp)
	lw t2, -1(sp)
	lw t0, 96(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 100(sp)
	lw t2, -1(sp)
	lw t0, 100(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 104(sp)
	lw t2, -1(sp)
	lw t0, 104(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 108(sp)
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
	lw t2, -1(sp)
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 116(sp)
	lw t2, -1(sp)
	lw t0, 116(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 120(sp)
	lw t2, -1(sp)
	lw t0, 120(sp)
	lw t1, 64(sp)
	sub t2, t0, t1
	sw t2, 124(sp)
	lw t2, -1(sp)
	lw t0, 124(sp)
	lw t1, 68(sp)
	sub t2, t0, t1
	sw t2, 128(sp)
	lw t2, -1(sp)
	lw t0, 128(sp)
	lw t1, 72(sp)
	sub t2, t0, t1
	sw t2, 132(sp)
	lw t2, -1(sp)
	lw t0, 132(sp)
	lw t1, 76(sp)
	sub t2, t0, t1
	sw t2, 136(sp)
	lw t2, -1(sp)
	lw t0, 136(sp)
	lw t1, 80(sp)
	sub t2, t0, t1
	sw t2, 140(sp)
	lw t2, -1(sp)
	lw t0, 140(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 144(sp)
	lw t2, -1(sp)
	lw t0, 144(sp)
	lw t1, 88(sp)
	add t2, t0, t1
	sw t2, 148(sp)
	lw t2, -1(sp)
	lw t0, 148(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 152(sp)
	lw t2, -1(sp)
	lw t0, 152(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 156(sp)
	lw t2, -1(sp)
	lw t0, 156(sp)
	lw t1, 100(sp)
	add t2, t0, t1
	sw t2, 160(sp)
	lw t2, -1(sp)
	lw t0, 160(sp)
	lw t1, 104(sp)
	add t2, t0, t1
	sw t2, 164(sp)
	lw t2, -1(sp)
	lw t0, 164(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 168(sp)
	lw t2, -1(sp)
	lw t0, 168(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 172(sp)
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
	lw t2, -1(sp)
	lw t0, 52(sp)
	lw t1, 56(sp)
	add t2, t0, t1
	sw t2, 180(sp)
	lw t2, -1(sp)
	lw t0, 180(sp)
	lw t1, 60(sp)
	add t2, t0, t1
	sw t2, 184(sp)
	lw t2, -1(sp)
	lw t0, 184(sp)
	lw t1, 64(sp)
	add t2, t0, t1
	sw t2, 188(sp)
	lw t2, -1(sp)
	lw t0, 188(sp)
	lw t1, 68(sp)
	add t2, t0, t1
	sw t2, 192(sp)
	lw t2, -1(sp)
	lw t0, 192(sp)
	lw t1, 72(sp)
	add t2, t0, t1
	sw t2, 196(sp)
	lw t2, -1(sp)
	lw t0, 196(sp)
	lw t1, 76(sp)
	add t2, t0, t1
	sw t2, 200(sp)
	lw t2, -1(sp)
	lw t0, 200(sp)
	lw t1, 80(sp)
	add t2, t0, t1
	sw t2, 204(sp)
	lw t2, -1(sp)
	lw t0, 204(sp)
	lw t1, 84(sp)
	add t2, t0, t1
	sw t2, 208(sp)
	lw t2, -1(sp)
	lw t0, 208(sp)
	lw t1, 88(sp)
	add t2, t0, t1
	sw t2, 212(sp)
	lw t2, -1(sp)
	lw t0, 212(sp)
	lw t1, 92(sp)
	add t2, t0, t1
	sw t2, 216(sp)
	lw t2, -1(sp)
	lw t0, 216(sp)
	lw t1, 96(sp)
	add t2, t0, t1
	sw t2, 220(sp)
	lw t2, -1(sp)
	lw t0, 220(sp)
	lw t1, 100(sp)
	add t2, t0, t1
	sw t2, 224(sp)
	lw t2, -1(sp)
	lw t0, 224(sp)
	lw t1, 104(sp)
	add t2, t0, t1
	sw t2, 228(sp)
	lw t2, -1(sp)
	lw t0, 228(sp)
	lw t1, 108(sp)
	add t2, t0, t1
	sw t2, 232(sp)
	lw t2, -1(sp)
	lw t0, 232(sp)
	lw t1, 112(sp)
	add t2, t0, t1
	sw t2, 236(sp)
	lw t2, -1(sp)
	lw t0, 236(sp)
	lw t1, 116(sp)
	add t2, t0, t1
	sw t2, 240(sp)
	lw t2, -1(sp)
	lw t0, 240(sp)
	lw t1, 120(sp)
	add t2, t0, t1
	sw t2, 244(sp)
	lw t2, -1(sp)
	lw t0, 244(sp)
	lw t1, 124(sp)
	sub t2, t0, t1
	sw t2, 248(sp)
	lw t2, -1(sp)
	lw t0, 248(sp)
	lw t1, 128(sp)
	sub t2, t0, t1
	sw t2, 252(sp)
	lw t2, -1(sp)
	lw t0, 252(sp)
	lw t1, 132(sp)
	sub t2, t0, t1
	sw t2, 256(sp)
	lw t2, -1(sp)
	lw t0, 256(sp)
	lw t1, 136(sp)
	sub t2, t0, t1
	sw t2, 260(sp)
	lw t2, -1(sp)
	lw t0, 260(sp)
	lw t1, 140(sp)
	sub t2, t0, t1
	sw t2, 264(sp)
	lw t2, -1(sp)
	lw t0, 264(sp)
	lw t1, 144(sp)
	add t2, t0, t1
	sw t2, 268(sp)
	lw t2, -1(sp)
	lw t0, 268(sp)
	lw t1, 148(sp)
	add t2, t0, t1
	sw t2, 272(sp)
	lw t2, -1(sp)
	lw t0, 272(sp)
	lw t1, 152(sp)
	add t2, t0, t1
	sw t2, 276(sp)
	lw t2, -1(sp)
	lw t0, 276(sp)
	lw t1, 156(sp)
	add t2, t0, t1
	sw t2, 280(sp)
	lw t2, -1(sp)
	lw t0, 280(sp)
	lw t1, 160(sp)
	add t2, t0, t1
	sw t2, 284(sp)
	lw t2, -1(sp)
	lw t0, 284(sp)
	lw t1, 164(sp)
	add t2, t0, t1
	sw t2, 288(sp)
	lw t2, -1(sp)
	lw t0, 288(sp)
	lw t1, 168(sp)
	add t2, t0, t1
	sw t2, 292(sp)
	lw t2, -1(sp)
	lw t0, 292(sp)
	lw t1, 172(sp)
	add t2, t0, t1
	sw t2, 296(sp)
	lw t2, -1(sp)
	lw t0, 296(sp)
	lw t1, 176(sp)
	add t2, t0, t1
	sw t2, 300(sp)
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
