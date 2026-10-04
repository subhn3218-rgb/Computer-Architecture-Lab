global _main
extern _printf
section .data
msg db "Input: 0x%02X OR Mask: 0x%02X-> Result: 0x%02X", 10, 0
section .text
_main:
mov eax, 0x20 ; 
mov ebx, 0x05 ; 
mov ecx, eax
or ecx, ebx ; 
push ecx
push ebx
push eax
push msg
call _printf
add esp, 16
xor eax, eax
ret