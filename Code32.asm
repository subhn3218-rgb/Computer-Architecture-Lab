global _main
extern _printf
section .data
msg db "Input: 0x%02X-> Inverted (NOT): 0x%02X", 10, 0
section .text
_main:
mov al, 0xAA ; 
not al ; 
movzx eax, al ; 
push eax
push 0xAA
push msg
call _printf
add esp, 12
xor eax, eax
ret