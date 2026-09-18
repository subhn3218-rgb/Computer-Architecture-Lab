global _main
extern _printf
section .data
number db 10
format db "New memory value = %d", 10, 0
section .text
_main:
    mov bl, 5
    add byte [number], bl
    movzx eax, byte [number]
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret