%include "io.inc"

section .data
    number1 DQ 0xFFFFFFFE
    number2 DQ 0x00000003

section .bss
    value RESB 64

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
  
    .add:
    mov eax,[number1]
    mov ebx,[number2]
    mov eax,[value]
    add eax,ebx
    jc .carry
    .doneadd:

    .carry:
    mov eax,[value]
    add eax,ebx
    mov [value],eax
    mov [value+7],ebx
    ja .doneadd
    
    .done:
    xor eax, eax
    ret