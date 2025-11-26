_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    arr
    PUSH    (len)
    CALL    MULTIPLES_3
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
MULTIPLES_3:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    DX
    PUSH    SI
    PUSH    DI
    MOV     CX, 4(BP)
    MOV     SI, 6(BP)
    MOV     BX, 3
    MOV     DI, 0
L1: MOV     AX, (SI)
    CWD
    DIV     BX
    CMP     DX, 0
    JNE     L2
    INC     DI
    ADD     SI, 2
    CMP     CX, 0
    JLE     L3
    LOOP    L1
L2: ADD     SI, 2
    CMP     CX, 0
    JLE     L3
    LOOP    L1
L3: MOV     AX, DI
    POP     DI
    POP     SI
    POP     DX
    POP     CX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   9, 10, 11, 12, 15
len:    .WORD   5
fmt:    .ASCIZ  "%d\n"
.SECT .BSS