_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    MOV    AX, (n)
    MOV    BX, (k)
    SUB    BX, AX
    INC    BX
    MOV    CX, BX
    MOV    BX, AX
    PUSH  BX
    PUSH  fmt
    PUSH  _PRINTF
    MOV   BP, SP
L1: MOV    4(BP), BX
    SYS
    INC    BX
    LOOP   L1
    ADD    SP, 6
    PUSH   0
    PUSH   _EXIT
    SYS
.SECT .DATA
n:      .WORD   3
k:      .WORD   6
fmt:    .ASCIZ  "%d\n"
.SECT .BSS