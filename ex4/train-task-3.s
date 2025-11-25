_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    4
    PUSH    3
    PUSH    2
    PUSH    1
    PUSH    (N)
    CALL    SUM
    ADD     SP, 10
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
SUM:
    PUSH    BP
    MOV     BP, SP
    PUSH    SI
    PUSH    CX
    PUSH    BX
    MOV     CX, 4(BP)
    MOV     SI, 6
L1: MOV     BX, (BP)(SI)
    ADD     AX, BX
    ADD     SI, 2
    LOOP    L1
    POP     BX
    POP     CX
    POP     SI
    POP     BP
    RET
.SECT .DATA
N:      .WORD   4
fmt:    .ASCIZ  "%d\n"
.SECT .BSS