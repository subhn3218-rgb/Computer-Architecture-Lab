global _main
extern _printf

section .data
memory_value dd 0
format db "R4 = %d, Memory = %d", 10, 0

section .text
_main:
    mov eax, 20
    mov ebx, 15

    add eax, ebx

    mov ecx, memory_value
    mov [ecx], eax

    push dword [ecx]
    push eax
    push format
    call _printf
    add esp, 12

    ret