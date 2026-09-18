global _main
extern _printf
section .data
format db "Result=%d", 10, 0
section .text
_main:
    mov al, 5
    or al, 8
    movzx eax, al
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret