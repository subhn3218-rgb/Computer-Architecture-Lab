global _main
extern _printf
section .data
msg db "EAX = %d, Copied to EBX = %d", 10, 0
section .text
_main:
mov eax, 70 ;
mov ebx, eax ; 
push ebx
push eax
push msg
call _printf
add esp, 12
xor eax, eax
ret