global _main
extern _printf

section .data
    N       equ 100              ; Entity count for simulation
    soa_x   times 100 dd 5       ; SoA layout: Contiguous array of attribute x values
    msg     db "Task 6: Structure of Arrays (SoA) Evaluation", 10
            db "Entity Count = %d", 10
            db "SoA Traversal Sum (attribute x) = %d (100% bus utilization)", 10, 0

section .text
_main:
    mov ecx, N           ; Loop counter = 100
    xor eax, eax         ; Sum accumulator = 0
    xor edx, edx         ; Byte offset = 0

.soa_loop:
    add eax, [soa_x + edx] ; Load attribute x without fetching unused fields (y, tag, z)
    add edx, 4           ; Move to next x element (4 bytes)
    sub ecx, 1           ; Decrement counter
    jnz .soa_loop        ; Continue loop

    ; Output Display
    push eax
    push dword N
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret