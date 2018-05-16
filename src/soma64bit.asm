%include "io.inc"
section .data
   frist  DQ 0x00000000ffffffff
   second DQ 0x0000000000000001
section .bss
    result RESB 64
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov eax, [frist]
    mov ebx, [second]
    
    mov edx, [frist-8]
    mov ecx, [second+8]
    
    add eax, ebx
    adc edx, ecx
    
    PRINT_HEX 4,edx
    NEWLINE
    PRINT_HEX 4,eax
    xor eax, eax
    ret