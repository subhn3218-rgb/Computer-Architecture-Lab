global _main
extern _printf

section .data
    ; Simulate memory blocks A, B, C colliding in a 2-way set-associative cache
    block_a     dd 0x11111111
    block_b     dd 0x22222222
    block_c     dd 0x33333333
    
    msg         db "Task 14: FIFO vs. LRU Eviction Divergence", 10
                db "Reference sequence executed for FIFO vs LRU divergence comparison.", 10, 0

section .text
_main:
    ; Access trace where FIFO and LRU replacement policies diverge
    ; 1. Load A into Way 0
    mov eax, [block_a]
    
    ; 2. Load B into Way 1
    mov ebx, [block_b]
    
    ; 3. Access A (LRU updates A as most recent, FIFO keeps original order)
    mov eax, [block_a]
    
    ; 4. Load C (FIFO evicts A because it was loaded first; LRU evicts B if B was least recently used)
    mov edx, [block_c]
    
    ; 5. Access A again to observe hit/miss divergence
    mov eax, [block_a]

    ; Output Display
    push msg
    call _printf
    add esp, 4
    
    xor eax, eax
    ret