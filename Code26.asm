global _main
extern _printf
section .data
target dd 0 ; 
msg db "Memory Target after Writeback: %d", 10, 0
section .text
_main:
mov eax, 95 ;
mov [target], eax ;
push dword [target]
push msg
call _printf
add esp, 8
xor eax, eax
ret