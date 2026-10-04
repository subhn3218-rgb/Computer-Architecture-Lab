global _main
extern _printf
section .data
msg db "Select Line S=%d-> MUX Routed Output: %d", 10, 0
section .text
_main:
mov edx, 1 ; 
mov eax, 100 ; 
mov ebx, 200 ; 
cmp edx, 1 ; 
jne .channel_a ; 
mov eax, ebx ; 
.channel_a:
push eax ; 
push edx ; 
push msg
call _printf
add esp, 12
xor eax, eax
ret