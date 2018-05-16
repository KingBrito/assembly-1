%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,ebx
    cmp ebx,0x1
    jb .nan
    je .one
    push ebx
    call Log2
    PRINT_DEC 4,esi
    .done:
    xor eax, eax
    ret
    .nan:
    PRINT_STRING "NaN"
    xor eax, eax
    ret
    .one:
    xor esi,esi
    PRINT_DEC 4,esi
    xor eax, eax
    ret
    
Log2:
    mov ecx,2
    enter 0,0
    mov ebx, [ebp+8]
    cmp ebx,ecx
    jnbe .next
    mov edx,0
    jmp .end
    .next:
    mov eax,DWORD[ebp+8]
    ;cdq
    xor edx,edx
    div ecx
    push eax
    inc esi
    call Log2
    .end: 
    leave
    ret 4
    .one:
    xor esi,esi
    leave 
    ret 4
    
LogX:
    mov ecx,10
    enter 0,0
    mov ebx, [ebp+8]
    cmp ebx,ecx
    jnbe .next
    jmp .end
    .next:
    mov eax,DWORD[ebp+8]
    ;cdq
    xor edx,edx
    div ecx
    push eax
    inc esi
    call Log2
    .end: 
    leave
    ret 4 