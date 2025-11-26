_EXIT = 1
_PRINTF = 128
.SECT .TEXT
    PUSH    res_arr
    PUSH    arr
    PUSH    (n) 
    CALL    MAP
    ADD     SP, 6
    PUSH    (n)
    PUSH    res_arr
    CALL    PRINT_ARR
    ADD     SP, 4
    PUSH    0
    PUSH    _EXIT
    SYS
MAP:
    PUSH    BP
    MOV     BP, SP
    PUSH    CX
    PUSH    SI
    PUSH    DI
    MOV     CX, 4(BP)
    MOV     SI, 6(BP)
    MOV     DI, 8(BP)
L1: MOV     AX, (SI)
    PUSH    AX
    CALL    SUM_DIG
    ADD     SP, 2
    MOV     (DI), AX
    ADD     SI, 2
    ADD     DI, 2
    LOOP    L1
    POP     DI
    POP     SI
    POP     CX
    MOV     SP, BP
    POP     BP
    RET
SUM_DIG:
    PUSH    BP
    MOV     BP, SP
    PUSH    BX
    PUSH    CX
    PUSH    DX
    MOV     AX, 4(BP)
    MOV     BX, 10
    MOV     CX, 0
L2: CWD
    DIV     BX
    ADD     CX, DX
    CMP     AX, 0
    JNE     L2
    MOV     AX, CX
    POP     DX
    POP     CX
    POP     BX
    MOV     SP, BP
    POP     BP
    RET
PRINT_ARR:
    PUSH    BP
    MOV     BP, SP
    PUSH    CX
    PUSH    SI
    MOV     SI, 4(BP)
    MOV     CX, 6(BP)
L3: MOV     AX, (SI)
    PUSH    AX
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    ADD     SI, 2
    LOOP    L3
    POP     SI
    POP     CX
    MOV     SP, BP
    POP     BP
    RET
.SECT .DATA
arr:    .WORD   90, 120, 411, 172
n:      .WORD   4
fmt:    .ASCIZ  "%d\n"
.SECT .BSS
res_arr:    .SPACE  8
