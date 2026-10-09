global _main
extern _printf

section .data
format db "Final R1 = %d", 10, 0

section .text
_main:
    mov eax, 3

LOOP:
    dec eax

    cmp eax, 0
    jne LOOP

    push eax
    push format
    call _printf
    add esp, 8

    ret