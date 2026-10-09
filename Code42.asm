global _main
extern _printf

section .data
format db "Final R1 = %d", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 5
    add eax, ebx

    nop
    nop

    mov ecx, 3
    add eax, ecx

    nop
    nop

    mov edx, 2
    add eax, edx

    push eax
    push format
    call _printf
    add esp, 8

    ret