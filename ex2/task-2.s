.SECT .TEXT
    MOV    CX, end - arr
    SHR    CX, 1
L1: MOV    AX, (SI)
    MOV    DX, AX
    SHR    DX, 1
    JNC    L2
    ADD    BX, AX
L2: ADD    SI, 2
    DEC    CX
    JNZ    L1
    MOV    (res), BX
.SECT .DATA
arr:    .WORD   1, 2, 3, 4, 5
end:    .BYTE   0
.SECT .BSS
res:    .SPACE  2
