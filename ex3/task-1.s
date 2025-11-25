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
    PUSH    msg
    PUSH    _PRINTF
    SYS
    ADD     SP, 4
    POP     BP
    RET
.SECT .DATA
msg:    .ASCIZ  "Hello world\n"
.SECT .BSS