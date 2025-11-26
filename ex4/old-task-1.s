_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    res
    PUSH    (x)
    PUSH    (y)
    CALL    MIN
    PUSH    0
    PUSH    _EXIT
    SYS
MIN:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    MOV     AX, 6(BP)
    MOV     BX, 4(BP)
    CMP     AX, BX
    JLE     L1
    MOV     AX, BX
    MOV     BX, 8(BP)
    MOV     (BX), AX
L1: MOV     BX, 8(BP)
    MOV     (BX), AX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET     6
.SECT .DATA
x:      .WORD   5
y:      .WORD   4
.SECT .BSS
res:     .SPACE  2
