%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4,eax          ;numero da fibonacci que queremos
    mov ebx,0               ;caso base 1
    mov ecx,1               ;caso base 2
    
    fib:
    sub eax,2               ;tiramos 2 do numero que a gente quer
    cmp eax,0               ;se ele for menos que zero terminamos
    jl finish
    add ebx,ecx             ;somamos o primeiro com o segundo
    add ecx,ebx             ; e o segundo com o primeiro
    jmp fib                 ;loop
    
    ;Somando sempre o primero com o segundo temos a essencia da fibonacci
    ;o prox numero é sempre a soma dos dois utimos
    ;temos 2 registradores porque um guarda os resultados dos numeros pares e outro dos 
    ;impares

    finish:
    and eax,1               ;se eax for par vamos para o par
    jg finishPar    
    PRINT_UDEC 4,ebx        ;se ele for impar mostramos exb (o primero numero)
    jmp done
    
    finishPar:
    PRINT_UDEC 4,ecx        ;caso ele seja par mostramos ecx (o segundo numero)
    jmp done
    
    done:
    xor eax, eax
    ret