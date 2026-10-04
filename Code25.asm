global _main
extern _printf
section .data
val dd 48 ; 
msg db "Loaded from RAM: %d", 10, 0
section .text
_main:
mov eax, [val] ;
push eax
push msg
call _printf
add esp, 8
xor eax, eax
ret