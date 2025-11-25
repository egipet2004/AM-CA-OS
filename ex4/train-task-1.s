_EXIT = 1
.SECT .TEXT
    PUSH    A
    PUSH    B
    CALL    SWAP
    ADD     SP, 4
    PUSH    0
    PUSH    _EXIT
    SYS
SWAP:   
    PUSH    BP
    MOV     BP, SP
    MOV     BX, 6(BP)
    MOV     CX, (BX)
    MOV     BX, 4(BP)
    MOV     DX, (BX)
    MOV     BX, 6(BP)
    MOV     (BX), DX
    MOV     BX, 4(BP)
    MOV     (BX), CX
    POP     BP
    RET
.SECT .DATA
A:      .WORD   5
B:      .WORD   6
.SECT .BSS