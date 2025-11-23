.SECT   .TEXT
    MOV    AX, (x)
    DIV    (y)
    ADD    AX, DX
    MOV    (res), AX
.SECT   .DATA
x:  .WORD   55
y:  .WORD   10
.SECT   .BSS
res:    .SPACE  2
