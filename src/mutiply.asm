%include "io.inc"

section .bss
    awnser RESB 4
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,eax
    GET_UDEC 4,ebx
    mov ecx,eax
    
    .mult:
    cmp ebx,1
    je .donemult
    add eax,ecx
    dec ebx
    cmp ebx,1
    jg .mult   
    .donemult:
    
    PRINT_UDEC 4,eax
    xor eax, eax
    ret