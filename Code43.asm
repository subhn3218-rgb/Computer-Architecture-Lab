global _main
extern _printf

section .data
memory_value dd 25
format db "Loaded R1 = %d, R3 = %d", 10, 0

section .text
_main:
    mov ebx, memory_value
    mov eax, [ebx]

    nop

    mov edx, 10
    add eax, edx

    push eax
    push 25
    push format
    call _printf
    add esp, 12

    ret