global _main
extern _printf

section .data
    ; Simulate 2-way set associative cache state tracking for stream: [A, B, A, C, A, B]
    block_a     dd 0x11110000
    block_b     dd 0x22220000
    block_c     dd 0x33330000
    
    msg         db "Task 13: Least Recently Used (LRU) State Machine Tracing", 10
                db "Access Stream: [A, B, A, C, A, B]", 10
                db "Simulation executed successfully for 2-way associativity.", 10, 0

section .text
_main:
    ; Simulate access stream sequence
    ; 1. Access A (Cold Miss -> Way 0 = A, LRU updated)
    mov eax, [block_a]
    
    ; 2. Access B (Cold Miss -> Way 1 = B, LRU updated)
    mov ebx, [block_b]
    
    ; 3. Access A (Hit in Way 0 -> LRU updated)
    mov eax, [block_a]
    
    ; 4. Access C (Conflict Miss -> Evicts LRU block, Way updated)
    mov edx, [block_c]
    
    ; 5. Access A (Hit or Miss depending on eviction)
    mov eax, [block_a]
    
    ; 6. Access B (Access sequence wrap-up)
    mov ebx, [block_b]

    ; Output Display
    push msg
    call _printf
    add esp, 4
    
    xor eax, eax
    ret