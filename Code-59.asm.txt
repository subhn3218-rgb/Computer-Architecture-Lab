global _main
extern _printf

section .data
    align 16
    hot_block dd 10      ; Single 16-byte aligned memory block / variable
    iterations dd 10000  ; 10,000 iterations for temporal locality
    msg db "Task 2: Temporal Locality with Hot Working Sets", 10
        db "Iterations Completed = %d", 10
        db "Final Value at Hot Location = %d (Zero cache misses after cycle 1)", 10, 0

section .text
_main:
    mov ecx, [iterations] ; Loop counter = 10,000
    mov edx, hot_block   ; Address of hot working set

.loop_start:
    ; Read-Modify-Write operation on the exact same hot location
    mov eax, [edx]       ; Load value (Cold miss on iter 1, subsequent hits from L1 cache)
    add eax, 1           ; Increment value
    mov [edx], eax       ; Store back to same location (Hot cache block update)
    
    sub ecx, 1           ; Decrement loop counter
    jnz .loop_start      ; Repeat 10,000 times

    ; Output Display
    push dword [hot_block]
    push dword [iterations]
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret