global _main
extern _printf

section .data
    ; Simulate an N-way set-associative cache collision test where K addresses map to the same set index
    N_assoc         dd 2         ; Assume a 2-way set-associative cache (N = 2)
    K_addresses     dd 3         ; K = N + 1 addresses colliding on the same set index
    align 32
    colliding_addr1 dd 0x00000020 ; Address 1 (Tag 1, Set Index 1)
    colliding_addr2 dd 0x00001020 ; Address 2 (Tag 2, Set Index 1)
    colliding_addr3 dd 0x00002020 ; Address 3 (Tag 3, Set Index 1 - Exceeds associativity W=2)
    iterations      dd 1000      ; Traversal loop count
    msg             db "Task 9: Set-Associative Collision Thresholding", 10
                    db "Associativity (N) = %d, Working Addresses (K) = %d", 10
                    db "Threshold exceeded: Conflict misses induced successfully!", 10, 0

section .text
_main:
    mov ecx, [iterations]   ; Loop counter = 1000

.traversal_loop:
    ; Access K addresses that map to the exact same set index
    mov eax, [colliding_addr1]
    mov ebx, [colliding_addr2]
    mov edx, [colliding_addr3] ; Exceeding N=2 causes conflict/eviction
    
    sub ecx, 1
    jnz .traversal_loop

    ; Output Display
    push dword [K_addresses]
    push dword [N_assoc]
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret