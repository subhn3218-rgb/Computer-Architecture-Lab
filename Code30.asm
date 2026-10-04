global _main
extern _printf
section .data
msg db "Input: 0x%02X AND Mask: 0x%02X-> Result: 0x%02X", 10, 0
section .text
_main:
mov eax, 0x5A ; 
mov ebx, 0x0F ; 
mov ecx, eax
and ecx, ebx ; 
push ecx
push ebx
push eax
push msg
call _printf
add esp, 16
xor eax, eax
ret