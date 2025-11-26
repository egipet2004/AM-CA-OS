_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    (n)
    PUSH    arr
    CALL    MUL_5_ENDED
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
MUL_5_ENDED:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    DX
    PUSH    SI
    PUSH    DI
    MOV     CX, 6(BP)
    MOV     SI, 4(BP)
    MOV     DI, 1
    MOV     BX, 10
L1: MOV     AX, (SI)
    CWD
    DIV     BX
    CMP     DX, 5
    JNE     L2
    MOV     AX, DI
    MUL     (SI)
    MOV     DI, AX
    ADD     SI, 2
    LOOP    L1
L2: ADD     SI, 2
    LOOP    L1
    MOV     AX, DI
    POP     DI
    POP     SI
    POP     DX
    POP     CX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   5, 21, 15, 20
n:      .WORD   4
fmt:    .ASCIZ  "%d\n"
.SECT .BSS