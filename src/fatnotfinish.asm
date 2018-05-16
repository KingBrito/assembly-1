%include "io.inc"
section .bss
    value RESB 64
    carry RESB 8
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    GET_UDEC 4,eax
    mov [carry], BYTE 0x1
    
    mov ecx,eax
    mov edx,eax
    
    .fat:
    mov ecx,eax            
    dec edx                          
    mov ebx,edx             
    
        .mult:
        cmp ebx,1             
        je .donemult         

            .add:
            mov [value],eax
            add eax,ecx
            mov [value],eax
            adc [value+7],BYTE 0x0
            .doneadd:
            
            dec ebx            
            cmp ebx,1           
            jg .mult              
        .donemult:
    
    cmp edx,1              
    jg .fat                 
    
    
    .done:
    PRINT_HEX 4,[value+7]
    PRINT_HEX 4,[value]
    xor eax, eax
    ret