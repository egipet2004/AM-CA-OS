_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    arr
    PUSH    (n)
    CALL    PRINT_EVENS
    ADD     SP, 4
    PUSH    0
    PUSH    _EXIT
    SYS
PRINT_EVENS:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    SI
    MOV     CX, 4(BP)
    MOV     SI, 6(BP)
L1: MOV     AX, (SI)
    MOV     BX, AX
    SHR     BX, 1
    JNC     L2
    ADD     SI, 2
    LOOP    L1
L2: PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    ADD     SI, 2
    LOOP    L1
    POP     SI
    POP     CX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   5, 10, 15, 20, 18
n:      .WORD   5
fmt:    .ASCIZ  "%d\n"
.SECT .BSS