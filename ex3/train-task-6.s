_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    (n)
    PUSH    (k)
    CALL    POWER
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
POWER:
    PUSH    BP
    MOV     BP, SP
    MOV     CX, 6(BP)
    DEC     CX
    MOV     AX, 4(BP)
    MOV     BX, AX
L1: MUL     BX
    LOOP    L1
    POP     BP
    RET

.SECT .DATA
n:      .WORD   4
k:      .WORD   3
fmt:    .ASCIZ  "%d\n"
.SECT .BSS
