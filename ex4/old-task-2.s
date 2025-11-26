_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    MOV     SI, arr
    MOV     CX, (len)
L1: MOV     AX, (SI)
    PUSH    AX
    PUSH    (n)
    CALL    DIVIDES_2_TO_N
    ADD     SP, 4
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    ADD     SI, 2
    LOOP    L1
    PUSH    0
    PUSH    _EXIT
    SYS
DIVIDES_2_TO_N:
    PUSH    BP
    MOV     BP, SP
    PUSH    CX
    MOV     AX, 6(BP)
    MOV     CX, 4(BP)
L2: SHR     AX, 1
    JC      L4
    LOOP    L2
L3: MOV     AX, 1
    JMP     L5
L4: MOV     AX, 0
L5: POP     CX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   20, 64, 32, 11, 14
n:      .WORD   3
len:    .WORD   5
fmt:    .ASCIZ  "%d\n"
.SECT .BSS