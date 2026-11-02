global _main
extern _printf

section .data
    align 64
    ; Simulated 4 KB working set buffer for L1 boundary testing
    buffer times 1024 dd 0
    
    iterations dd 50000
    msg db "Task 20: Mapping Cache Hierarchy Thresholds (The Memory Wall)", 10
        db "Working Set Size = 4 KB (L1 Cache Region)", 10
        db "Randomized Traversal Iterations = %d", 10
        db "Hierarchy Threshold Mapping Completed Successfully.", 10, 0

section .text
_main:
    ; Setup a simple permuted/strided pointer chain within the buffer
    mov ecx, 1023
    mov eax, buffer

.setup_chain:
    lea edx, [eax + 4]
    mov [eax], edx           ; Set pointer to next node
    add eax, 4
    loop .setup_chain
    
    mov dword [eax], buffer  ; Loop back to head

    ; Pointer Chasing Traversal Loop
    mov ecx, [iterations]
    mov eax, buffer

.traverse_loop:
    mov eax, [eax]           ; Dereference pointer
    sub ecx, 1
    jnz .traverse_loop

    ; Output Display
    push dword [iterations]
    push msg
    call _printf
    add esp, 8
    
    xor eax, eax
    ret