        .set noat
        .set noreorder
        .set nomacro
        .text
        .align 2
        .align 4
        .globl clockcount
        .ent clockcount
$clockcount..ng:
clockcount:
        .eflag 48
        .frame $30,0,$26,0
        .prologue 0
        .set    macro
        rpcc $0
        .set    nomacro
        zapnot $0,15,$0
        ret $31,($26),1
        .end clockcount
        .ident  "GCC: (GNU) 3.3.5 (Debian 1:3.3.5-13)"
