%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    push 5
    call Fat
    PRINT_UDEC 4,eax
    xor eax, eax
    ret 
    
Fat:
    enter 0,0
    mov ebx, [ebp+8]
    cmp ebx, 1
    ja .next
    mov eax, 1
    jmp .done
    .next:
    dec ebx
    push ebx
    call Fat
    mul DWORD[ebp+8]    
    .done:
    leave
    ret 4