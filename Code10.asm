global _main
extern _printf
section .data
format db "After DEC, EBX= %d", 10, 0
section .text
_main:
    mov ebx, 10
    dec ebx
    push ebx
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret