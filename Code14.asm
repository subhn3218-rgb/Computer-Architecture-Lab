global _main
extern _printf
section .data
zeroMessage db "No common 1 bits were found.", 10, 0
commonMessage db "Common 1 bits were found.", 10, 0
section .text
_main:
    mov al, 0xF0
    mov bl, 0x0F
    test al, bl
    jz no_common_bits
common_bits:
    push commonMessage
    call _printf
    add esp, 4
    jmp finished
no_common_bits:
    push zeroMessage
    call _printf
    add esp, 4
finished:
    xor eax, eax
    ret