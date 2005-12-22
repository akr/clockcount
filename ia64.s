	.file	"ia64.s"
	.pred.safe_across_calls p1-p5,p16-p63
	.text
	.align 16
	.global clockcount#
	.proc clockcount#
clockcount:
	.prologue
	.body
        mov r8 = ar44
	;;
	.mib
	nop.m 0
	nop.i 0
	br.ret.sptk.many b0
	.endp clockcount#
