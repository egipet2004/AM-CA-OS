.SECT .TEXT
    MOV    CX, (n)
L1: ADD    AX, (x)
    ADD    BX, AX
    LOOP   L1
    MOV    (res), BX
.SECT .DATA
x:  .WORD   5
n:  .WORD   5
.SECT .BSS
res:    .SPACE  2
