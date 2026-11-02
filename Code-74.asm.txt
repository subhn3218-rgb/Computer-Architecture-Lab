global _main
extern _printf

section .data
    align 64
    array times 1024 dd 5       ; 1024 integer array (4096 bytes)
    prefetch_k equ 8             ; Prefetch distance K = 8 elements ahead
    msg db "Task 17: Software Data Prefetching Optimization", 10
        db "Array Elements Processed = %d", 10
        db "Prefetch Distance Ahead (K) = %d elements", 10
        db "Accumulated Vector Sum = %d", 10, 0

section .text
_main:
    mov ecx, 1024        ; Loop count = 1024
    xor eax, eax         ; Sum accumulator = 0
    xor edx, edx         ; Byte offset index = 0

.loop_start:
    ; Prefetch element scheduled K elements ahead (K * 4 bytes)
    prefetcht0 [array + edx + (prefetch_k * 4)]

    ; Current element arithmetic load & addition
    add eax, [array + edx]
    
    add edx, 4           ; Advance offset by 4 bytes
    sub ecx, 1
    jnz .loop_start

    ; Output Display
    push eax
    push dword prefetch_k
    push dword 1024
    push msg
    call _printf
    add esp, 16
    
    xor eax, eax
    ret