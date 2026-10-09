global _main
extern _printf

section .data
exit_msg db "R4 reached zero", 10, 0
continue_msg db "R4 did not reach zero", 10, 0

section .text
_main:
    mov eax, 1

    sub eax, 1
    cmp eax, 0
    je EXIT

    nop

    push continue_msg
    call _printf
    add esp, 4
    jmp DONE

EXIT:
    push exit_msg
    call _printf
    add esp, 4

DONE:
    ret