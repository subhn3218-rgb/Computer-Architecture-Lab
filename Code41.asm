global _main
extern _printf

section .data
format db "R1 = %d, R2 = %d, R7 = %d", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 20
    add eax, ebx

    mov ecx, 5
    mov edx, 7
    add ecx, edx

    nop
    nop

    mov esi, eax
    add esi, ecx

    push esi
    push ecx
    push eax
    push format
    call _printf
    add esp, 16

    ret