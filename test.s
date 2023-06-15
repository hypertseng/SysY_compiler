	.text
	.globl main
	.align 2
exgcd:
	addi sp, sp, -664
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
# call t0, putint(a_exgcd_1)
exgcd_label_0:
	sw a0, 68(sp)
