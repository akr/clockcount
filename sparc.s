        .file   "sparc.s"
.section        ".text"
        .align  4
        .global clockcount
        .type   clockcount,#function
clockcount:
	mov %tick,%o1
	retl
	srlx %o1,32,%o0
