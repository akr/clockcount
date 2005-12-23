	.globl _clockcount
_clockcount:
	mftbu r3
	mftb r4
	mftbu r0
	cmpw r3, r0
	bne- _clockcount
	blr
