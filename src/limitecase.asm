%include "io.inc"
section .data
CaseTable DD 0      ;lower limit
DD 2                ;upper limit
DD Process1         ;calling process
Esize EQU ($-CaseTable) ;size of entrie
DD 3
DD 5
DD Process2
DD 6
DD 8
DD Process3
DD 9
DD 11
DD Process4
DD 12
DD 15
DD Process5

Entries EQU ($-CaseTable)/Esize ;size of array
Bytes EQU 4

msg1 DB "Process1",0
msg2 DB "Process2",0
msg3 DB "Process3",0
msg4 DB "Process4",0
msg5 DB "Process5",0


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax,3
    mov ebx,CaseTable
    mov ecx,Entries
    
    .inlimit:
    cmp eax,[ebx]
    JNAE .next
    cmp eax,[ebx+(1*Bytes)]
    JNBE .next
    call [ebx+(2*Bytes)]
    jmp .done
    .next:
    add ebx,Esize 
    dec ecx
    jnz .inlimit
    
    .done:
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
           