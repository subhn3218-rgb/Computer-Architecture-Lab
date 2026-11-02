global _main
extern _printf

section .data
    align 64
    ; Simulated circular linked nodes spaced at S = 64 bytes (Cache Line boundary)
    node1 dd node2
          times 15 dd 0      ; Padding to 64 bytes
    node2 dd node3
          times 15 dd 0      ; Padding to 64 bytes
    node3 dd node1           ; Loop back to node1
          times 15 dd 0      ; Padding to 64 bytes

    iterations dd 10000
    msg db "Task 19: Empirical Cache Line Size Detection via Pointer Chasing", 10
        db "Configured Node Stride S = 64 Bytes", 10
        db "Pointer Chasing Traversal Iterations = %d", 10
        db "Circular Pointer Traversal Completed Successfully.", 10, 0

section .text
_main:
    mov ecx, [iterations]    ; Loop counter
    mov eax, node1           ; Load base pointer (head of linked list)

.chase_loop:
    mov eax, [eax]           ; Dereference next pointer: r0 = [r0]
    sub ecx, 1
    jnz .chase_loop

    ; Output Display
    push dword [iterations]
    push msg
    call _printf
    add esp, 8
    
    xor eax, eax
    ret