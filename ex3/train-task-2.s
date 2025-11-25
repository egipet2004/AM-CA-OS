_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    MOV    AX, (n)
    MOV    BX, (k)
    SUB    BX, AX
    INC    BX
    MOV    CX, BX
    MOV    DX, AX
L1: PUSH   DX
    PUSH   fmt
    PUSH   _PRINTF
    SYS
    ADD    SP, 6
    INC    DX
    LOOP   L1
    PUSH   0
    PUSH   _EXIT
    SYS
.SECT .DATA
n:      .WORD   3
k:      .WORD   6
fmt:    .ASCIZ  "%d\n"
.SECT .BSS