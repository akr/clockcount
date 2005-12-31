        .LEVEL 2.0
        .SPACE $PRIVATE$
        .SUBSPA $DATA$,QUAD=1,ALIGN=8,ACCESS=31
        .SUBSPA $BSS$,QUAD=1,ALIGN=8,ACCESS=31,ZERO,SORT=82
        .SPACE $TEXT$
        .SUBSPA $LIT$,QUAD=0,ALIGN=8,ACCESS=44
        .SUBSPA $CODE$,QUAD=0,ALIGN=8,ACCESS=44,CODE_ONLY
        .IMPORT $global$,DATA
        .IMPORT $$dyncall,MILLICODE
        .SPACE $TEXT$
        .SUBSPA $CODE$

        .align 4
        .EXPORT clockcount,ENTRY,PRIV_LEV=3,RTNVAL=GR
clockcount
        .PROC
        .CALLINFO FRAME=0,NO_CALLS
        .ENTRY
        mfctl %cr16, %r28
        copy %r28, %r29
        extrd,u %r28,31,32,%r28
        bve,n (%r2)
        .EXIT
        .PROCEND
