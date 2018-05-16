%include "io.inc"
section .data
CaseTable DD 0              ; LIMITE INFERIOR
          DD 2              ; LIMITE SUPERIOR
          DD Process1       ; ENDEREÇO DO PROCESSO
TamEntd   EQU ($-CaseTable)
          DD 3              ; LIMITE INFERIOR
          DD 5              ; LIMITE SUPERIOR
          DD Process2       ; ENDEREÇO DO PROCESSO
          DD 6              ; LIMITE INFERIOR
          DD 8              ; LIMITE SUPERIOR
          DD Process3       ; ENDEREÇO DO PROCESSO
          DD 9              ; LIMITE INFERIOR
          DD 11             ; LIMITE SUPERIOR
          DD Process4       ; ENDEREÇO DO PROCESSO
          DD 12             ; LIMITE INFERIOR
          DD 15             ; LIMITE SUPERIOR
          DD Process5
NumEntd   EQU ($-CaseTable)/TamEntd
TByte     EQU 4

msg1 DB "Process1",0
msg2 DB "Process2",0
msg3 DB "Process3",0
msg4 DB "Process4",0
msg5 DB "Process5",0
msgDef DB "Fora dos Limites",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx,NumEntd       ; QUANTIDADE DE ENTRADAS = QUANTIDADE DE LOOPS
    mov ebx,CaseTable       ; EBX RECEBE O ENDEREÇO DE CASETABLE
    mov eax,16              ; EAX NUMERO
    
    .loop:
    cmp eax,[ebx]           ; COMPARA EAX COM O LIMITE INFERIOR
    jnae .next              ; EAX !>= [EBX]?
    cmp eax,[ebx+(1*TByte)] ; COMPARA EAX COM O LIMITE SUPERIOR
    jnbe .next              ; EAX !<= [EBX+(1*TByte)]?
    call [ebx+(2*TByte)]    ; CHAMA O PROCESSO SALVO NA MEMORIA
    jmp .end
    .next:
    add ebx,TamEntd         ; EBX++
    dec ecx                 ; ECX--
    jnz .loop    
    call Def
    .end:
    xor eax, eax
    ret
    
Process1:
    PRINT_STRING msg1
    ret
Process2:
    PRINT_STRING msg2
    ret
Process3:
    PRINT_STRING msg3
    ret
Process4:
    PRINT_STRING msg4
    ret
Process5:
    PRINT_STRING msg5
    ret
Def:
    PRINT_STRING msgDef
    ret
         