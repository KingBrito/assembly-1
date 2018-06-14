%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,eax
    mov ebx,0
    mov ecx,1
    mov edx,0 ; aux
    inc eax
    fib: 
        dec eax
        jz terminou
        mov edx, ecx
        add edx, ebx
        mov ebx, ecx
        mov ecx, edx
        jmp fib
    terminou:
    PRINT_UDEC 4,ebx
    ret