global _main
extern _printf
section .data
result db 0
format db "AL=%d,BL=%d,Memory=%d", 10, 0
section .text
_main:
    mov al, 10
    add al, 20
    sub al, 5
    mov byte [result], al
    mov bl, [result]
    movzx eax, al
    movzx ecx, bl
    movzx edx, byte [result]
    push edx
    push ecx
    push eax
    push format
    call _printf
    add esp, 16
    xor eax, eax
    ret