;;Assemble and link with
;nasm -felf32 log.asm
;gcc -o logtest log.o

global main 
extern scanf 
extern printf     

SECTION .data
    message1: db "Enter the first number(X): ", 0
    message2: db "Enter the second number(Y): ", 0
    formatin: db "%f", 0
    formatout: db "Result -  Logx(Y) = %f",10, 0 
    number1: dd 0 ; 
    number2: dd 0 ;
    constantone : dd 1.0     ;; Beware 'dd 1.0' is different from 'dd 1'

section .text

main:

   push message1
   call printf
   add esp, 4 

   push number1 ; address of number1 (second parameter)
   push formatin ; arguments are pushed right to left (first parameter)
   call scanf
   add esp, 8 

   push message2
   call printf
   add esp, 4

   push number2 ; address of number2
   push formatin ; arguments are pushed right to left
   call scanf
   add esp, 8 

	finit
	fld dword [constantone]       ;; st0 = 1.0
	fld dword [number1]           ;; st0 = number1 , st1 = 1.0
	FYL2X                               ;; st0 = log2(number1)
	
	fld dword [constantone]       ;; st0 = 1.0  , st1 = log2(number1)
	fld dword [number2]           ;; st0 = number2 , st1 = 1.0 , st2 = log2(number1)
	FYL2X                               ;; st0 = log2(number2) , st1 = log2(number1)
	
	fdiv st1  ;; st0 contains log2 of number2 , st1 contains log2 of number1  . so we can calculate st0/st1.

	fstp qword [esp-8]     ; store it in a 64 bit location
	sub esp,8		; adjust stack.  because 'push qword' is invalid in 32 bit architecture
	push formatout
   	call printf
	add esp,8+4              ; 8 bytes for the float parameter and 4 for the formatout address.
ret
