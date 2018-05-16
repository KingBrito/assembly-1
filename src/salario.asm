%include "io.inc"
section .data
CaseTable DD 0              
          DD 300              
          DD 50;%       
TamEntd   EQU ($-CaseTable)
          DD 301              
          DD 500              
          DD 40;%       
          DD 501              
          DD 700              
          DD 30;%      
          DD 701              
          DD 800           
          DD 20;%     
          DD 801             
          DD 1000             
          DD 10;%
          DD 1001
          DD 1001
          DD 5;%
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
    PRINT_DEC 4,[ebx+(2*TByte)]
    jmp .end
    .next:
    add ebx,TamEntd      
    dec ecx       
    jnz .loop    
    PRINT_DEC 4,[ebx+(2*TByte)]
    .end:
    xor eax, eax
    ret
    
         