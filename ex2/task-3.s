.SECT .TEXT
    MOV    CX, end-arr
    SHR    CX, 1
L1: MOV    DX, (SI)
    CMP    DX, (k)
    JL     L2
    JG     L3
    JE     L4
L2: ADD    AX, (SI)
    JMP    L4
L3: ADD    BX, (SI)
    JMP    L4
L4: ADD    SI, 2
    DEC    CX
    JNZ    L1
    


.SECT .DATA
arr:    .WORD   1, 2, 3, 4, 5, 6
end:    .BYTE   0
k:      .WORD   3
.SECT .BSS