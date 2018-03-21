%include "io.inc"

section .data
    myBytes DB 0x80, 0x66, 0xA5
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ; for correct debugging
    movzx ax, BYTE [myBytes]
    movzx bx, BYTE [myBytes+1]
    add ax,bx
    movzx bx, BYTE [myBytes+2]
    add ax,bx
    PRINT_HEX 2,ax
    xor eax, eax
    ret