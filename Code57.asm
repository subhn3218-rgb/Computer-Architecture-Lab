global _main
extern _printf

section .data
memory_value dd 0
target_msg db "Branch taken: R1 = 0", 10, 0
normal_msg db "Branch not taken: R1 != 0", 10, 0

section .text
_main:
    mov ebx, memory_value
    mov eax, [ebx]

    nop
    nop

    cmp eax, 0
    je TARGET

    push normal_msg
    call _printf
    add esp, 4
    jmp EXIT

TARGET:
    push target_msg
    call _printf
    add esp, 4

EXIT:
    ret