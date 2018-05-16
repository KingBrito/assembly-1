%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    push 10
    push 93
    call Proc
    xor eax, eax
    ret
Proc:
    enter 4,0              
    xor eax,eax            
    add eax,[ebp+12]       
    add eax, [ebp+8]      
    mov [ebp-4],eax
    PRINT_UDEC 4,[ebp-4]
    leave
    ret 8