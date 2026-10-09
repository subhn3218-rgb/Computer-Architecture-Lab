global _main
extern _printf

section .data
format db "R1 = %d", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 10

    cmp eax, ebx
    je TARGET

    mov ecx, 20
    add ecx, 30

TARGET:
    push ecx
    push format
    call _printf
    add esp, 8

    ret