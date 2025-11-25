_EXIT = 1
_PRINTF = 127
.SECT .TEXT
    PUSH    (n)
    PUSH    res_arr
    PUSH    arr2
    PUSH    arr1
    CALL    SUM_ARRAYS
    ADD     SP, 8
    PUSH    (n)
    PUSH    res_arr
    CALL    PRINT
    ADD     SP, 4
    PUSH    0
    PUSH    _EXIT
    SYS
SUM_ARRAYS:
    PUSH    BP
    MOV     BP, SP
    PUSH    DI
    PUSH    SI
    PUSH    BX
    MOV     CX, 10(BP)
    MOV     BX, 8(BP)
    MOV     SI, 6(BP)
    MOV     DI, 4(BP)
L1: MOV     AX, (DI)
    ADD     AX, (SI)
    MOV     (BX), AX
    ADD     DI, 2
    ADD     SI, 2
    ADD     BX, 2
    LOOP    L1
    POP     BX
    POP     SI
    POP     DI
    POP     BP
    RET
PRINT:
    PUSH    BP
    MOV     BP, SP
    PUSH    DI
    PUSH    CX
    MOV     CX, 6(BP)
    MOV     DI, 4(BP)
L2: PUSH    (DI)
    PUSH    fmt
    PUSH    _PRINTF
    SYS
    ADD     SP, 6
    ADD     DI, 2
    LOOP    L2
    POP     CX
    POP     DI
    POP     BP
    RET
.SECT .DATA
arr1:   .WORD   1, 2, 3, 4
arr2:   .WORD   9, 8, 7, 6
n:      .WORD   4
fmt:    .ASCIZ  "%d\n"
.SECT .BSS
res_arr:    .SPACE  8
