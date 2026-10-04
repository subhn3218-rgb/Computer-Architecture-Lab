global _main
extern _printf
section .data
msg db "ALU Addition: %d + %d = %d", 10, 0
section .text
_main:
mov eax, 30 ; 
mov ebx, 12 ; 
add eax, ebx ; 
push eax ; 
push ebx ; 
push 30 ;
push msg
call _printf
add esp, 16
xor eax, eax
ret