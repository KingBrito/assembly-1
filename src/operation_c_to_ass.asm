%include "io.inc"

section .bss
    Rval RESD 1 
    
section .data
    Xval DD 15
    Yval DD 3
    Zval DD 5
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ebx, [Yval]
    neg ebx
    add ebx, [Zval]
    neg ebx
    add ebx, [Xval]
    mov [Rval], ebx
    PRINT_DEC 1,ebx
    xor eax, eax
    ret