global _main
extern _printf

section .data
X dd 4, 6
Y dd 5, 7
format db "X0 = %d, Y0 = %d, X1 = %d, Product = %d, Sum = %d", 10, 0

section .text
_main:
    mov ebx, X
    mov ecx, Y

    mov eax, [ebx]

    mov edx, [ecx]

    mov esi, [ebx + 4]

    imul eax, edx

    mov edi, eax

    push edi
    push eax
    push esi
    push edx
    push dword [X]
    push format
    call _printf
    add esp, 24

    ret