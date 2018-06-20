%include "io.inc"
section .data
CaseTable DD 0              
          DD 4              
          DD "Reprovado" 
TamEntd   EQU ($-CaseTable)
          DD 4             
          DD 6              
          DD "Final",0       
          DD 7              
          DD 10              
          DD "Reprovado"
NumEntd   EQU ($-CaseTable)/TamEntd
TByte     EQU 4


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,NumEntd       
    mov ebx,CaseTable     
    GET_UDEC 4,eax            
    
    .loop:
    cmp eax,[ebx]           
    jnae .next              
    cmp eax,[ebx+(1*TByte)] 
    jnbe .next              
    PRINT_STRING [ebx+(2*TByte)]
    jmp .end
    .next:
    add ebx,TamEntd      
    dec ecx       
    jnz .loop    
    PRINT_STRING [ebx+(2*TByte)]
    .end:
    xor eax, eax
    ret
    
         