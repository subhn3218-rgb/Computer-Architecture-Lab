global _main
extern _printf

section .data
array dd 10, 20
format db "Array after swap: %d %d", 10, 0

section .text
_main:
    mov ebx, array
    mov eax, [ebx]

    mov ecx, [ebx + 4]

    mov [ebx + 4], eax

    mov [ebx], ecx

    push dword [ebx + 4]
    push dword [ebx]
    push format
    call _printf
    add esp, 12

    ret