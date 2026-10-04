global _main
extern _printf
section .data
msg db "Register EAX = %d", 10, 0
section .text
_main:
mov eax, 25 ;  
push eax
push msg
call _printf
add esp, 8
xor eax, eax
ret