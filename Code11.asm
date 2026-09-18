global _main
extern _printf
section .data
format db "Result=0x%02X", 10, 0
section .text
_main:
    mov al, 0xAA
    and al, 0x0F
    movzx eax, al
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret