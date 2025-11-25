_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    (X)
    CALL    F 
    ADD     SP, 2
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    PUSH    0
    PUSH    _EXIT
    SYS
F:  
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    MOV     AX, 4(BP)
    MOV     BX, AX
    MUL     BX
    MOV     BX, AX
    MUL     BX
    SHL     AX, 1
    SHL     AX, 1
    SHL     AX, 1
    MOV     DX, AX
    MOV     AX, BX
    SHR     AX, 1
    ADD     DX, AX
    MOV     AX, 4(BP)
    SHL     AX, 1
    SHL     AX, 1
    SUB     DX, AX
    SUB     DX, 1
    MOV     AX, DX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
X:      .WORD   2
fmt:    .ASCIZ  "%d\n"
.SECT .BSS
