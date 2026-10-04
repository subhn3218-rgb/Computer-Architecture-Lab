global _main
extern _printf
section .data
msg db "Original: %d | SHL 1 (x2): %d | SHL 2 (x4): %d", 10, 0
section .text
_main:
mov eax, 7 ; 
mov ebx, eax
shl ebx, 1 ; 
mov ecx, eax
shl ecx, 2 ; 
push ecx
push ebx
push eax
push msg
call _printf
add esp, 16
xor eax, eax
ret