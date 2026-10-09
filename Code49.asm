global _main
extern _printf

section .data
value_a dd 10
value_b dd 20
format db "R1 = %d, R6 = %d, R2 = %d, R7 = %d", 10, 0

section .text
_main:
    mov ebx, value_a
    mov eax, [ebx]

    mov ecx, value_b
    mov edx, [ecx]

    mov esi, 5
    add eax, esi

    mov edi, 8
    add edx, edi

    push edx
    push eax
    push dword [value_b]
    push dword [value_a]
    push format
    call _printf
    add esp, 20

    ret