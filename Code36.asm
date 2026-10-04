global _main
extern _printf
section .data
msg db "Subtraction 15- 15 = %d-> Zero Flag (ZF) = %d", 10, 0
section .text
_main:
mov eax, 15
sub eax, 15 ; 
pushfd
pop ebx ; 
shr ebx, 6 ; 
and ebx, 1 ; 
push ebx ; 
push eax ; 
push msg
call _printf
add esp, 12
xor eax, eax
ret