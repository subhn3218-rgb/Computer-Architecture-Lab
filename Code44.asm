global _main
extern _printf

section .data
memory_value dd 25
format db "R1 = %d, R5 = %d, R3 = %d", 10, 0

section .text
_main:
    mov ebx, memory_value
    mov eax, [ebx]

    mov ecx, 20
    mov edx, 8
    sub ecx, edx

    mov esi, 10
    add eax, esi

    push eax
    push ecx
    push 25
    push format
    call _printf
    add esp, 16

    ret