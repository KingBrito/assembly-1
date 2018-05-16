%include "io.inc"
section .data
msgeq DD "EQUILATERO",0
msgis DD "ISOCELES",0
msges DD "ESCALENO",0
msgnt DD "N TRIANGULO",0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC    4,eax
    GET_UDEC    4,ebx
    GET_UDEC    4,edx

    cmp eax,0
    je .ntg
    cmp ebx,0
    je .ntg
    cmp ecx,0
    je .xntg
    
    mov ecx,eax
    add ecx,ebx
    cmp edx,ecx
    ja .ntg
    
    mov ecx,eax
    add ecx,edx
    cmp ebx,ecx
    ja .ntg
    
    mov ecx,ebx
    add ecx,edx
    cmp eax,ecx
    ja .ntg
    
    cmp eax,ebx
    jne .neq                ; A==B?
    cmp ebx,edx             
    je .equ                 ; B==C?
    
    jmp .iso                ; A==B e B!=C
    
    .neq:                   ; A!=B
    cmp eax,edx
    je .iso                 ; A!=B e A==D
    cmp ebx,edx
    je .iso                 ; A!=B e B==C
    jmp .esc                ; A!B e B!=C e A!=C
    
    .done:
    PRINT_STRING [ecx]
    xor eax, eax
    ret
    
    .equ:
    mov ecx,msgeq
    jmp .done
    .iso:
    mov ecx,msgis
    jmp .done
    .esc:
    mov ecx,msges
    jmp .done
    .ntg:
    mov ecx,msgnt
    jmp .done