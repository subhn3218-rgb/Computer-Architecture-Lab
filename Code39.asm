global _main
extern _printf

section .data
    format db "R1 = %d", 10
           db "R4 = %d", 10, 0

section .text

_main:
    mov eax, 10
    mov ebx, 20
    mov edx, 5

    add eax, ebx

    nop
    nop

    mov ecx, eax
    sub ecx, edx

    push ecx
    push eax
    push format
    call _printf
    add esp, 12

    ret