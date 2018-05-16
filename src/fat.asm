%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp            ; for correct debugging
    GET_UDEC 4,eax          ; pegar o numero    
    cmp eax,0               ; é zero ssaporra?
    jz .iszero              ; terminamos
    jl .notsupported        ; número negativo
    cmp eax,13              ; verifica
    jge .notsupported       ; número muito grande
    
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
    add eax,ecx             ; numero + i = resultado
    dec ebx                 ; i--
    cmp ebx,1               ; mutiplicação terminou?
    jg .mult                ; faça de novo
    .donemult:
    cmp edx,1               ; terminou o fatorial?
    jg .fat                 ; not yet my friend
    
    .done:                  ; teminei sim
    PRINT_UDEC 4,eax        ; imprime o restultado
    xor eax, eax
    ret
    
    .iszero:                ; é zero
    PRINT_STRING "1"        ; imprimir 1
    xor eax,eax             
    ret
    
    .notsupported:          ; não suportado
    PRINT_STRING "Erro número não suportado"    ; imprimir msg erro
    xor eax,eax     
    ret