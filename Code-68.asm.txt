global _main
extern _printf

section .data
    power_two_stride dd 1024       ; S = 2^10 (Power-of-two stride causing set conflict)
    array times 4096 dd 1         ; Large array to simulate strided access
    msg             db "Task 11: Power-of-Two Stride Pathologies", 10
                    db "Stride (S) = %d bytes (Power-of-Two)", 10
                    db "Traversal Sum = %d (Demonstrates set under-utilization)", 10, 0

section .text
_main:
    mov ecx, 16           ; Number of traversal iterations
    xor eax, eax          ; Accumulator sum = 0
    xor edx, edx          ; Byte offset = 0
    mov esi, [power_two_stride] ; Load power-of-two stride into ESI

.stride_loop:
    add eax, [array + edx] ; Load array element at base + offset
    add edx, esi          ; Advance offset by power-of-two stride
    dec ecx
    jnz .stride_loop

    ; Output Display
    push eax
    push dword [power_two_stride]
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret