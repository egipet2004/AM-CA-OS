_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    MOV     CX, end-arr
    SHR     CX, 1
    MOV     SI, arr
L1: PUSH    SI
    CALL    PRINT
    ADD     SP, 2
    ADD     SI, 2
    LOOP    L1
    PUSH    0
    PUSH    _EXIT
    SYS
PRINT:
    PUSH    BP
    MOV     BP, SP
    PUSH    (SI)
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   1, 2, 3, 4, 5, 6
end:    .BYTE   0
fmt:    .ASCIZ  "%d\n"
.SECT .BSS