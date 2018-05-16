%include "io.inc"
section .data
    aux DB 0x0
section .bss
    value RESB 64
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,0xffffffff
    mov ecx,0xefffffff   
    
    
    .add:
    mov [value],eax
    add eax,ecx
    jc .carry
    .doneadd:
    
    .done:
    PRINT_HEX 4,[value+7]
    PRINT_HEX 4,[value]
    xor eax,eax
    ret
      
    .carry:
    mov [value],eax 
    mov [aux],ecx
    mov ecx,1
    add [value+7],ecx
    mov ecx,[aux]
    jmp .doneadd