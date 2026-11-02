global _main
extern _printf

section .data
    N   equ 1024
    ; Allocate 1024 dword integers initialized to 1 for easy verification (Sum = 1024)
    ; (Using times directive to fill array)
    align 4
    array times N dd 1
    
    msg db "Task 1: Spatial Locality via Contiguous Array Traversal", 10
        db "Array Size = %d elements (4 KB)", 10
        db "Calculated Sum = %d (Expected: 1024)", 10
        db "Theoretical Miss Rate = 6.25%", 10, 0

section .text
_main:
    mov ecx, N           ; Loop counter = 1024
    xor eax, eax         ; Sum accumulator = 0
    xor edx, edx         ; Array index offset = 0

.loop_start:
    add eax, [array + edx] ; Load array element and add to sum (spatial locality hit on subsequent elements)
    add edx, 4           ; Move to next 32-bit integer (4 bytes offset)
    sub ecx, 1           ; Decrement loop counter
    jnz .loop_start      ; Repeat until ecx == 0

    ; Output Display
    push eax
    push dword N
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret