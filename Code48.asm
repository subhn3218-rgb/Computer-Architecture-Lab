global _main
extern _printf

section .data
format db "Temp1 = %d, Temp2 = %d, Result = %d", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 20
    add eax, ebx

    mov ecx, 5
    mov edx, 15
    add ecx, edx

    mov esi, eax
    add esi, ecx

    push esi
    push ecx
    push eax
    push format
    call _printf
    add esp, 16

    ret