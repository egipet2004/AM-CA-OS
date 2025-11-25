_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    CALL    PRINT
    PUSH    0
    PUSH    _EXIT
    SYS
PRINT:
    PUSH    BP
    MOV     BP, SP
    PUSH    (n)
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    POP     BP
    RET
    
.SECT .DATA
n:  .WORD   52
fmt:    .ASCIZ  "%d\n"   
.SECT .BSS