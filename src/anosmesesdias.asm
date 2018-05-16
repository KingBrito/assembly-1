%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,ecx
    GET_UDEC 4,eax
    
    sub eax,ecx
    PRINT_STRING "ANOS: "
    PRINT_UDEC 4,eax
    NEWLINE
    mov ecx,0xC     ; 12 meses
    call MULT
    PRINT_STRING "MESES: "
    PRINT_UDEC 4,eax
    NEWLINE
    mov ecx,0x1E    ; 30 dias
    call MULT
    PRINT_STRING "DIAS: "
    PRINT_UDEC 4,eax
    xor eax, eax
    ret
    
MULT:
    mov ebx,eax
    xor eax,eax
    .multloop:
    add eax,ebx
    loop .multloop

ret 