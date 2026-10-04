 global _main
extern _printf
section .data
msg db "ALU Subtraction: %d- %d = %d", 10, 0
section .text
_main:
mov eax, 50 ; 
mov ebx, 18 ; 
sub eax, ebx ; 
push eax
push ebx
push 50
push msg
call _printf
add esp, 16
xor eax, eax
ret