global _main
extern _printf

section .data
    format db "Producer Result (R1/EAX) = %d", 10
            db "Consumer Result (R4/ECX) = %d", 10, 0

section .text

_main:

    ; R2 = 10
    mov eax, 10

    ; R3 = 20
    mov ebx, 20

    ; Producer:
    ; R1 = R2 + R3
    ; EAX = 10 + 20 = 30
    add eax, ebx

    ; Save producer result
    mov esi, eax

    ; R5 = 5
    mov edx, 5

    ; Consumer:
    ; R4 = R1 - R5
    ; ECX = 30 - 5 = 25
    mov ecx, eax
    sub ecx, edx

    ; Print both results
    push ecx
    push esi
    push format
    call _printf
    add esp, 12

    ret