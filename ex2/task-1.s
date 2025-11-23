.SECT .TEXT
    MOV    CX, end - arr
    SHR    CX, 1
L1: ADD    AX, (SI)
    ADD    SI, 2
    LOOP   L1    
.SECT .DATA
arr:    .WORD   1, 2, 3, 4, 5
end:    .BYTE   0
.SECT .BSS
res:    .SPACE  2
