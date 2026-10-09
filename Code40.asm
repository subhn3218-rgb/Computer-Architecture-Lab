global _main
extern _printf

section .data
format db "R2 = %d, R6 = %d, R9 = %d", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 20
    mov ecx, 5

    add eax, ebx

    mov edx, 7
    mov esi, 3
    and edx, esi

    nop

    mov edi, eax
    or edi, ecx

    push edi
    push edx
    push eax
    push format
    call _printf
    add esp, 16

    ret