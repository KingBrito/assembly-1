%include "io.inc"

section .data
    array DW 10,20,30,40
    size EQU ($-array)/2
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
   
    mov ecx,size
    dec ecx
    mov esi,ecx
    mov ebp,esi
    dec ebp
    .swap:
    mov ebx,[array+(esi*2)]
    xchg [array+(ebp*2)],ebx
    mov [array+(esi*2)],ebx
    dec esi
    dec ebp
    loop .swap
    
    mov ecx,size
    mov esi,0
    .print:
    PRINT_DEC 2,[array+(esi*2)]
    inc esi
    loop .print
        
    xor eax, eax
    ret