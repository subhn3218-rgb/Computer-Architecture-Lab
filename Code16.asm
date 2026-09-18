global _main
extern _printf
section .data
number db 0
format db "Value in memory=%d", 10, 0
section .text
_main:
    mov byte [number], 42
    movzx eax, byte [number]
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret