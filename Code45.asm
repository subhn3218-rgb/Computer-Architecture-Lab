global _main
extern _printf

section .data
pointer_value dd memory_value
memory_value dd 50
format db "R1 = %d, R3 = %d", 10, 0

section .text
_main:
    mov ebx, pointer_value
    mov eax, [ebx]

    nop

    mov ecx, [eax]

    push ecx
    push eax
    push format
    call _printf
    add esp, 12

    ret