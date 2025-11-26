_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    arr
    PUSH    (len)
    CALL    COUNT_5_ENDED
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
COUNT_5_ENDED:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    DX
    PUSH    DI
    PUSH    SI
    MOV     CX, 4(BP)
    MOV     SI, 6(BP)
    MOV     BX, 10
    MOV     DI, 0
L2: MOV     AX, (SI)
    CWD
    DIV     BX
    CMP     DX, 5
    JNE     L3
    INC     DI
    ADD     SI, 2
    LOOP    L2
L3: ADD     SI, 2
    LOOP    L2
    MOV     AX, DI
    POP     SI
    POP     DI
    POP     DX
    POP     CX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   5, 21, 15, 20, 35, 5, 10
len:    .WORD   7
fmt:    .ASCIZ  "%d\n"
.SECT .BSS