_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    arr
    PUSH    (len)
    CALL    MUL_5_ENDED
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    PUSH    0
    PUSH    _EXIT
    SYS
MUL_5_ENDED:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    DX
    PUSH    DI
    PUSH    SI
    MOV     BX, 10
    MOV     CX, 4(BP)
    MOV     SI, 6(BP)
    MOV     DI, 1
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
    POP     SI
    POP     DI
    POP     DX
    POP     CX
    POP     DX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   5, 21, 15, 20
len:    .WORD   4
fmt:    .ASCIZ  "%d\n"
.SECT .BSS