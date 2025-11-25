_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    MOV     CX, end-arr
    SHR     CX, 1
    PUSH    CX
    PUSH    arr
    CALL    SUM
    ADD     SP, 4
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
    MOV     SI, 4(BP)
    MOV     CX, 6(BP)
L1: MOV     BX, (SI)
    CMP     BX, 0
    JGE     L2
    ADD     AX, BX
L2: ADD     SI, 2
    DEC     CX
    JNZ     L1
    POP     BP
    RET 
.SECT .DATA
arr:    .WORD   -1, 2, -3, 4, -5, 6
end:    .BYTE   0
fmt:    .ASCIZ  "%d\n"
.SECT .BSS