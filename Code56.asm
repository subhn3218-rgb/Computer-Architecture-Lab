global _main
extern _printf

section .data
memory_value dd 25
format db "R1 = %d, R3 = %d, R6 = %d, R9 = %d", 10, 0

section .text
_main:
    mov ebx, memory_value
    mov eax, [ebx]

    mov ecx, 10
    mov edx, 5
    add ecx, edx

    mov esi, 20
    mov edi, 8
    sub esi, edi

    mov edx, 6
    mov ebp, 3
    and edx, ebp

    push edx
    push esi
    push ecx
    push eax
    push format
    call _printf
    add esp, 20

    ret