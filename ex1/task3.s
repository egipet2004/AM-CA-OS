.SECT .TEXT
    MOV    AX, (x)
    MUL    (y)
    MOV    (res), AX
.SECT .DATA
x:  .WORD   2
y:  .WORD   3
.SECT .BSS
res:    .SPACE  2
