	.file	"x86.s"
	.text
	.p2align 4,,15
.globl clockcount
	.type	clockcount, @function
clockcount:
	pushl	%ebp
	movl	%esp, %ebp
	rdtsc
	popl	%ebp
	ret
