%include "io.inc"              ;NASM Macro Library

section .data
    array  dw 1,2,3,4,5,6,7,8,9,0
    length dw ($-array)/2
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp               ;for correct debugging
    mov esi,array              ;endereço do array
    mov ecx,length             ;entradas no array
    lea edi,[array+18]         ;edi = endereço da ultima entrada
    cmp esi,edi                ;Array pequeno?
    jnb .done                  ;Sim, terminamos

.next:
    mov eax,[esi]              ;eax = valor do começo
    mov ebx,[edi]              ;ebx = valor do dinal
    mov [edi],al               ;Armazena valor do comeco no final
    mov [esi],bl               ;Armazena valor do final no começo

    add esi,2                  ;esi = endereco do prox item no comeco
    sub edi,2                  ;edi = endereco do prox item no final
    cmp esi,edi                ;Chegamos no meio?
    jb .next                   ;Nao, continue
    
.print:
    PRINT_DEC 2,[array+0]      ;imprime a primeira pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+2]      ;imprime a segunda pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+4]      ;imprime a terceira pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+6]      ;imprime a quarta pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+8]      ;imprime a quinta pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+10]     ;imprime a sexta pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+12]     ;imprime a setima pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+14]     ;imprime a oitava pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+16]     ;imprime a nona pos do array
    PRINT_STRING " - "         ;imprime o separador
    PRINT_DEC 2,[array+18]     ;imprime a decima pos do array
    
.done:
    xor eax, eax
    ret