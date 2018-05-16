%include "io.inc"

size EQU 5
section .bss
    array RESD size
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,size
    mov esi,0
    .read:
    GET_DEC 4,[array+(esi*4)]
    inc esi
    loop .read
   
    mov ecx,size
    dec ecx
    mov esi,ecx
    mov edi,esi
    dec edi
    .swap:
    mov ebx,[array+(esi*4)]
    xchg [array+(edi*4)],ebx
    mov [array+(esi*4)],ebx
    dec esi
    dec edi
    loop .swap
    
    mov ecx,size
    mov esi,0
    .print:
    PRINT_DEC 4,[array+(esi*4)]
    inc esi
    loop .print
        
    xor eax, eax
    ret