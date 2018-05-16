%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,eax
    GET_CHAR ecx
    GET_UDEC 4,ebx
    
    cmp ecx,'+'
    je .addproc
    cmp ecx,'-'
    je .subproc
    cmp ecx,'*'
    je .mulproc
    cmp ecx,'/'
    je .divproc
    jmp .done
    
    .addproc:
    call ADDC
    jmp .done
    .subproc:
    call SUBT
    jmp .done
    .mulproc:
    call MULT
    jmp .done
    .divproc:
    call DIVS
    
    .done:
    PRINT_DEC 4,eax
    xor eax, eax
    ret
    
;--------------------------------------------------- 
ADDC:
; Recives: EAX, ECX
; Returns: EAX = EAX + EBX  
;---------------------------------------------------
    add eax,ebx
    ret
    
;--------------------------------------------------- 
SUBT:
; Recives: EAX, ECX
; Returns: EAX = EAX - EBX
;--------------------------------------------------- 
    sub eax,ebx
    ret
    
;--------------------------------------------------- 
MULT:
; Recives: EAX, ECX
; Returns: EAX = EAX * EBX
;--------------------------------------------------- 
    push ecx
    mov ecx,eax
    xor eax,eax
    .multloop:
    call ADDC
    loop .multloop
    pop ecx
    ret
    
;--------------------------------------------------- 
DIVS:
; Recives: EAX, EBX
; Returns: EAX = EAX / EBX
;---------------------------------------------------     
    push ecx
    xor ecx,ecx
    and ebx,ebx
    jz .iszero
    
    .divsloop:
    inc ecx
    call SUBT
    jns .divsloop   
    dec ecx
    xchg eax,ecx
    
    .donediv:
    pop ecx
    ret
    
    .iszero:
    mov eax,-1
    jmp .donediv