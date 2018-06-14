%include "io.inc"
section .data
    array dd 10,20,30
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax,eax
    push array
    push 3
    call addR
    PRINT_UDEC 4,eax
    xor eax, eax
    ret 
    
addR:
    enter 0,0
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    cmp ebx,1
    je .done
    add eax,[ecx+(ebx-1)*4]
    dec ebx
    push ecx
    push ebx
    call addR
    
    .done:
    leave
    ret 8