section .text
global CMAIN
convertDias:
    xor ebx,ebx
    mov ecx,[esp+4]
    mov eax,3600
    mul ecx
    add ebx,ecx
    mov eax,60
    mov ecx,[esp+8]
    mul ecx
    add ebx,ecx
    add ebx,[esp+12]
    mov eax,ebx
    ret