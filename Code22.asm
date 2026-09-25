global _main
extern _printf

section .data
formatRaw db "Raw EFLAGS = 0x%08X", 10, 0
formatFlags db "Zero Flag (ZF) = %d, Carry Flag (CF) = %d", 10, 0

section .text
_main:
    mov eax, 5
    sub eax, 5

    pushfd
    pop ebx

    push ebx
    push formatRaw
    call _printf
    add esp, 8

    mov ecx, ebx
    shr ecx, 6
    and ecx, 1

    mov edx, ebx
    and edx, 1

    push edx
    push ecx
    push formatFlags
    call _printf
    add esp, 12

    xor eax, eax
    ret