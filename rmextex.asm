%include "io.inc"
section .data
    text db "namoral.txt.crpt",0
section .bss
    new resd 100
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor esi,esi
    xor eax,eax 
    
    percorrer:
    mov cl,[text+esi]
    cmp cl,0
    je rmext
    inc esi
    jmp percorrer
    
    
    rmext:
    mov BYTE[text+(esi-5)],0
    
    
    done:
    PRINT_STRING [text]
    xor eax, eax
    ret