%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,3
    mov ecx,2
    .divi:
    sub eax,ecx
    jns .divi
    add eax,ecx
    PRINT_DEC 4,eax
    xor eax, eax
    ret