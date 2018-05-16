%include "io.inc"
section .data

varB DB 10h

varW DW 100h

varW2 DW 0a1h

varD DD 10000h

ArrayBytes DB 80h , 66h , 0A5h

 section .text
 global CMAIN
 CMAIN:

	mov EBP, ESP 			 ; for correct debuggin
	mov EAX, 0
	mov AX, [varW]                    ; EAX = 0x100
	neg byte [varB]                   ; valB (em binario) = 11110000, PF = 1
	;add [varW ],[varW2]               ; varW = ? erro faltou informar a quantidade de bytes acessadas
        ; e os [] para acessar o conteudo (somou os endereços???), além de ser uma operação memoria <->		 
        ;memória 
	XCHG EAX, [varD]                  ; varD =0x100
	ADD EAX, 100h                     ; SF = 0 , OF = 0 , ZF = 0 , EAX = 0x10100
        	mov BX, 0
	SUB BL, 1                         ; SF = 1 , OF = 0 , ZF = 0 , BL= 0xff
	mov AL, [ ArrayBytes + 2]         ; AL=a5
	xor EAX, EAX
	ret