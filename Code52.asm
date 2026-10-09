global _main
extern _printf

section .data
equal_msg db "Branch taken: R1 == R2", 10, 0
not_equal_msg db "Branch not taken: R1 != R2", 10, 0

section .text
_main:
    mov eax, 10
    mov ebx, 10

    cmp eax, ebx
    je TARGET

    nop

    push equal_msg
    call _printf
    add esp, 4
    jmp EXIT

TARGET:
    push equal_msg
    call _printf
    add esp, 4

EXIT:
    ret