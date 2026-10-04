global _main
extern _printf
section .data
msg db "Original: %d | SHR 1 (/2): %d | SHR 2 (/4): %d", 10, 0
section .text
_main:
mov eax, 64 ; 
mov ebx, eax
shr ebx, 1 ; 
mov ecx, eax
shr ecx, 2 ; 
push ecx
push ebx
push eax
push msg
call _printf
add esp, 16
xor eax, eax
ret