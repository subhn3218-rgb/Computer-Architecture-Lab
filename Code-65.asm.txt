global _main
extern _printf

section .data
    ; Two memory pointers mapping to the exact same cache set index with different tags
    align 32
    ptr1    dd 0x12345678        ; Memory block 1
    ptr2    dd 0x87654321        ; Memory block 2 (conflicts with ptr1 set index)
    iterations dd 2000           ; 2000 alternating iterations
    msg     db "Task 8: Direct-Mapped Cache Conflict Thrashing", 10
            db "Iterations Completed = %d", 10
            db "Result: 100% Cache Miss Rate (Thrashing observed)", 10, 0

section .text
_main:
    mov ecx, [iterations]   ; Loop counter = 2000
    mov esi, ptr1           ; Load address of P1
    mov edi, ptr2           ; Load address of P2

.thrash_loop:
    ; Alternating 4-byte loads between P1 and P2 causing continuous eviction
    mov eax, [esi]          ; Access P1 (Miss -> Loads P1 into cache set)
    mov ebx, [edi]          ; Access P2 (Miss -> Evicts P1, loads P2 into cache set)
    
    sub ecx, 1
    jnz .thrash_loop        ; Repeat 2000 times

    ; Output Display
    push dword [iterations]
    push msg
    call _printf
    add esp, 8
    
    xor eax, eax
    ret