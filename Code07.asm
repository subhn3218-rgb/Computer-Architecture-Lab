global _main
extern _printf
section .data
format db "20-5=%d", 10, 0
section .text
_main:
    mov al, 20
    sub al, 5
    movzx eax, al
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret