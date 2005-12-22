	.file	"x86_64.s"
	.text
	.p2align 4,,15
.globl clockcount
	.type	clockcount, @function
clockcount:
        rdtsc
	salq	$32, %rdx
	orq	%rdx, %rax
	ret
