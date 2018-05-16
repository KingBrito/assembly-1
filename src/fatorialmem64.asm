%include "io.inc"
section .bss
    factiorial RESB 128
section .text
global CMAIN
CMAIN:
factorial   dw 1200h

        xor edx, edx
        xor eax, eax
        mov ax, 6d      ;we'll be calculating 6!
        mov word [factorial+16], 1d     ;current result is 1

    wloop:
        mov cx, 08h     ;set loop iterator to 8
        xor edx, edx    ;clear edx
    mloop:                  ;iterate over cx (shift)
        mov bx, cx      ;copy loop iterator to bx (indirect adressing will be used)
        add bx, bx      ;bx*=2
        push ax         ;store ax (number to multiply by)
        mul WORD[factorial+bx]  ;multiply ax and result
        mov WORD[factorial+bx], ax  ;store new result in [factorial+2*cx]
        pop ax          ;restore previous ax
        push dx         ;transfer from mul is stored in stack
        loop mloop      ;loop over cx until it's 0
        mov cx, 7h      ;set loop iterator to 7
    tloop:                  ;iterate over cx, adding transfers to result
        pop dx          ;pop it from stack
        mov bx, cx      ;bx = cx
        add bx, bx      ;bx = bx+bx
        adc [factorial+bx],dx ;add transfer to [factorial+2*cx]
        loop tloop      ;loop over cx until it's 0

        pop bx          ;one redundant transfer is removed from stack
        dec ax          ;decrease ax (number to multiply by)
        cmp ax, 0       ;if ax is non-zero...
        jne wloop       ;...continue multiplying

        movzx eax, word[factorial+16] ;load last 32 bits of result...
        call println    ;...and print them

        jmp exit        ;exit program
        exit:
        add eax,0x0
println:                    ;Prints from eax
        push eax
        push edx
        mov ecx, 10
    loopr:  
        xor edx, edx
        div ecx         ; eax <- eax/10, edx <- eax % 10
        push eax        ; stack <- eax (store, because DOS will need it)
        add dl, '0'     ; edx to ASCII
        mov ah,2        ; DOS char print
        int 21h         ; interrupt to DOS
        pop eax         ; stack -> eax (restoring)
        cmp eax, 0
        jnz loopr

        mov dl, 13d     ;Carriage Return
        mov ah, 2h
        int 21h
        mov dl, 10d     ;Line Feed
        mov ah, 2h
        int 21h

        pop edx
        pop eax
        ret        