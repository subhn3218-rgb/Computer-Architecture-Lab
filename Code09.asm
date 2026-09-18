global _main
extern _printf
section .data
format db "After INC, EAX= %d", 10, 0
section .text
_main:
    mov eax, 9
    inc eax
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret