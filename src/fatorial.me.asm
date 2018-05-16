%include "io.inc"
    size    EQU 0x40            ; size of the array
    incr    EQU 0x04            ; increment of the loop controls
section .bss
    result  RESD 256            ; master variable
    mutiply RESD 256            ; auxiliar variable
section .text
global CMAIN
CMAIN:    mov ebp, esp                ; for correct debugging
    GET_UDEC 4,[result]         ; get the value of fact in the input
    mov eax,[result]            ; copy the value to eax
    mov ecx,eax                 ; copy the value of eax to ecx
    mov edx,eax                 ; and the edx
    call FATORIAL              ; FATORIAL function
    .done:                     call PRINT                  ; PRINT function
    xor eax, eax                ; eax=0 (return 0)
    ret                         ; end
FATORIAL:    
.fat:    mov ecx,[mutiply]           ; set the value to sum every loop  
    dec edx                     ; edx control's the loop  
    cmp edx,1                   ; compares value of edx with 1, if less or equal than 1, fat is finish
    jle .fatdone                ; if is finish, go to the end          
    mov ebx,edx                 ; ebx = edx (x*y=? ebx has value of y now)
    push edx                    ; save value of edx in the stack
    call SETMULT                ; SETMULT function
    .mult:    cmp ebx,1                   ; compares value of edx with 1, if equal than 1, mult is finish
    je .donemult                ; if is finish, go to the end        
    call ADDC                   ; ADDC function
    dec ebx                     ; control --              
    jmp .mult                   ; go to the start of mutiply loop
    .donemult:    pop edx                     ; restore edx value
    jmp .fat                    ; go to the start of factorial loop
    .fatdone:    ret                         ;return
SETMULT:    xor edx,edx                 ; edx = 0 to use in the loop
    .setmult:    mov eax,[result+edx]        ; get the value of result in the pos (eax = result[i])
    mov [mutiply+edx],eax       ; set the value of mutiply=result (mutiply[i] = result[i])
    add edx,0x04                ; edx +=4 to conttrol loop
    cmp edx,size                ; compares edx with size, if less than size, make the loop again
    jl .setmult                 ; jump to the start of loop
    ret                         ; return
ADDC:    xor edx,edx                 ; edx = 0, to control loop
    .add:    mov eax,[result+edx]        ; get eax = result[i] to sum
    mov ecx,[mutiply+edx]       ; get ecx
    add eax,ecx                 ; add the value
    jc .addcarry                ; if carry resolve it
    .continuecarry:    mov [result+edx],eax        ; set the new value of result (result[i] = eax)
    add edx,incr                ; control ++
    cmp edx,size                ; compares edx with size, if less than continue loop
    jl .add                     ; if less go to the start of loop
    ret                         ; return
    .addcarry:    adc DWORD[result+edx+incr],0x0 ; add the carry on the result[i+1]
    jmp .continuecarry             ; continue at the stop's
PRINT:    mov edx,size                ; edx = size
    .add:    PRINT_HEX 4,[result+edx]    ; print(result[i])
    sub edx,incr                ; i --
    cmp edx,0x00                ; (i==0)?
    jge .add                    ; if greater of equal than go to the start of loop
    ret                         ; return