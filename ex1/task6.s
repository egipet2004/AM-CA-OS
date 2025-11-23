.SECT .TEXT
    MOV    BX, -5
    ADD    BX, (x)
    MOV    AX, (x)
    MUL    (x)
    MOV    CX, AX
    MUL    (a)
    ADD    BX, AX
    MOV    AX, CX
    MUL    CX
    MUL    (b)
    ADD    BX, AX
    MOV    AX, CX
    MUL    CX
    MUL    CX
    MUL    (c)
    ADD    BX, AX
    MOV    (res), BX

.SECT .DATA
x:  .WORD   3
a:  .WORD   -5
b:  .WORD   -3
c:  .WORD   2
.SECT .BSS
res:    .SPACE  2
