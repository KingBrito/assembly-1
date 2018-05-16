%include "io.inc"

section .data
    fatorial DD 0x0, 0x0, 0x0, 0x0, 0x0
    aux      DD 0x0, 0x0, 0x0, 0x0, 0x0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, [fatorial]
    mov ecx, [fatorial]  
    dec ecx
    
    mov eax, [fatorial]    
    cmp eax, 0x1
    jle Base
        
L1:
    push ecx    
    mov eax, [aux]
    and eax, 0x0
    mov [aux], eax
    mov eax, [aux+4]
    and eax, 0x0
    mov [aux+4], eax
    mov eax, [aux+8]
    and eax, 0x0
    mov [aux+8], eax
    mov eax, [aux+12]
    and eax, 0x0
    mov [aux+12], eax
    mov eax, [aux+16]
    and eax, 0x0
    mov [aux+16], eax 
    
    jmp Interno
    Externo:
    
    mov eax, [aux]
    mov [fatorial], eax
    mov eax, [aux+4]
    mov [fatorial+4], eax
    mov eax, [aux+8]
    mov [fatorial+8], eax
    mov eax, [aux+12]
    mov [fatorial+12], eax
    mov eax, [aux+16]
    mov [fatorial+16], eax
    pop ecx
    loop L1
    
    
    PRINT_UDEC 4, [fatorial+16]
    NEWLINE
    PRINT_UDEC 4, [fatorial+12]
    NEWLINE
    PRINT_UDEC 4, [fatorial+8]
    NEWLINE
    PRINT_UDEC 4, [fatorial+4]
    NEWLINE
    PRINT_UDEC 4, [fatorial]
    xor eax, eax
    ret
    
Base:
    PRINT_UDEC 4, 0x1 
    xor eax, eax
    ret
    
Interno:
    mov eax, [fatorial]
    mov edx, [aux]
    add edx, eax
    mov [aux], edx
    jc Carry1
    jmp byte4
    Parte1:
    jmp byte8
    Parte2:
    jmp byte12
    Parte3:
    jmp byte16
    Partef:
    loop Interno
    jmp Externo
    
    
byte4:
    mov eax, [fatorial+4]
    mov edx, [aux+4]
    add edx, eax
    mov [aux+4], edx
    jc Carry2
    jmp Parte1

byte8:
    mov eax, [fatorial+8]
    mov edx, [aux+8]
    add edx, eax
    mov [aux+8], edx
    jc Carry3
    jmp Parte2

byte12:
    mov eax, [fatorial+12]
    mov edx, [aux+12]
    add edx, eax
    mov [aux+12], edx
    jc Carry4
    jmp Parte3

byte16:
    mov eax, [fatorial+16]
    mov edx, [aux+16]
    add edx, eax
    mov [aux+16], edx
    ;jc Carry5
    jmp Partef
    
Carry1:
    mov ebx, [aux+4]
    inc ebx
    mov [aux+4], ebx
    jmp byte4

Carry2:
    mov ebx, [aux+8]
    inc ebx
    mov [aux+8], ebx
    jmp byte8
    
Carry3:
    mov ebx, [aux+12]
    inc ebx
    mov [aux+12], ebx
    jmp byte12

Carry4:
    mov ebx, [aux+16]
    inc ebx
    mov [aux+16], ebx
    jmp byte16