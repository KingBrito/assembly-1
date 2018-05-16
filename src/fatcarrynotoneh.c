%include "io.inc"
section .data
    aux DD 0x0
section .bss
    value RESB  8
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ; for correct debugging
    GET_UDEC 4,eax          ; pegar o numero    
    
    mov ecx,eax             ; atribui o valor total a ecx
    mov edx,eax             ; contador fatorial  
    
    .fat:
        mov ecx,eax             ; redefinindo o numero para adcionar
    dec edx                 ; contador -- (quantas vezes vai mutiplicar)
    cmp edx,1               ; fatorial de 1?
    jle .done               ; terminou
    mov ebx,edx             ; edx=eax
    .mult:
    cmp ebx,1               ; x*1 = x
    je .donemult            ; terminamos de mutiplicar
    .add:
    mov [value],eax
    add eax,ecx
    jc .carry
    .doneadd:
    
    dec ebx                 ; i--
    cmp ebx,1               ; mutiplicação terminou?
    jg .mult                ; faça de novo
    .donemult:
    cmp edx,1               ; terminou o fatorial?
    jg .fat                 ; not yet my friend
    
    .done:                  ; teminei sim
    PRINT_HEX 4,[value+15]
    PRINT_HEX 4,[value+7]
    PRINT_HEX 4,[value]
    ;NEWLINE

    xor eax, eax
    ret
    
    .carry:
    
   ; mov eax,[value]
   ; add eax,ecx
    mov [value],eax 
    mov [aux],ecx
    mov ecx,1
    add [value+7],ecx
    mov ecx,[aux]
    jmp .doneadd