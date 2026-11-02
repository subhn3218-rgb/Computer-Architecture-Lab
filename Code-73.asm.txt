global _main
extern _printf

section .data
    align 32
    uncached_loc dd 0          ; Memory location for write allocate testing
    msg          db "Task 16: Write Allocate vs. No-Write Allocate Verification", 10
                 db "Store and subsequent load executed successfully.", 10
                 db "Loaded Value = %d", 10, 0

section .text
_main:
    mov edx, uncached_loc    ; Load address
    mov eax, 42              ; Value to store
    
    ; 1. Issue a store instruction to the memory location
    mov [edx], eax           
    
    ; 2. Immediately issue a load instruction to the same location
    mov ebx, [edx]           ; Under Write Allocate: fetches line into cache -> L1 hit

    ; Output Display
    push ebx
    push msg
    call _printf
    add esp, 8
    
    xor eax, eax
    ret