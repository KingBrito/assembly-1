%include "io.inc"

section .data
    array dw 1,2,3,4
    size dw ($-array)/2
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp                ; for correct debugging
    mov esi,[array]             ;
    mov ecx,size                ;
    lea edi,[esi+ecx*4-4]       ;edi = address of last entry


    
    L1:mov eax,esi            ;eax = value at start
    mov ebx,edi              ;ebx = value at end
    mov edi,eax              ;Store value from start at end
    mov esi,ebx              ;Store value from end at start

    add esi,4                  ;esi = address of next item at start
    sub edi,4                  ;edi = address of next item at end
    cmp esi,edi                ;Have we reached the middle?
    je L1                      ;no, keep going
    
    
    xor eax, eax
    ret