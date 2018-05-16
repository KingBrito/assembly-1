%include "io.inc"

section .bss
    value RESD 128
section .data
    var   DD 0x0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,eax
    mov ebx,0
    TESTE:
    mov DWORD[value+ebx],0xffffffff
    add ebx,0x04
    dec eax
    cmp eax,0
    jg TESTE
    
    
    xor eax, eax
    ret