_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    (n)
    PUSH    (k)
    CALL    PRINT_N
    ADD     SP, 4
    PUSH    0
    PUSH    _EXIT
    SYS
PRINT_N:
    PUSH    BP
    MOV     BP, SP
    MOV     AX, 6(BP)
    MOV     BX, 4(BP)
    SUB     BX, AX
    INC     BX
    MOV     CX, BX
    MOV     BX, AX
    PUSH    BX
    PUSH    fmt
    PUSH    _PRINTF
    MOV     BP, SP
    ADD     BP, 4
L1: MOV     (BP), BX
    SYS
    INC     BX
    LOOP    L1
    ADD     SP, 6
    POP     BP
    RET
.SECT .DATA
n:      .WORD   3
k:      .WORD   7
fmt:    .ASCIZ  "%d\n"
.SECT .BSS