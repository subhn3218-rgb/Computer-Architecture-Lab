global _main
extern _printf
section .data
format db "EAX=0x%08X", 10, 0
section .text
_main:
    mov eax, 0x12345678
    push eax
    push format
    call _printf
    add esp, 8
    xor eax, eax
    ret