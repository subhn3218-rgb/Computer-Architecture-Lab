global _main
extern _printf

section .data
source_value dd 75
destination_value dd 0
format db "Loaded R1 = %d, Stored Memory = %d", 10, 0

section .text
_main:
    mov ebx, source_value
    mov eax, [ebx]

    mov ecx, destination_value
    mov [ecx], eax

    push dword [ecx]
    push eax
    push format
    call _printf
    add esp, 12

    ret