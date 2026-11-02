global _main
extern _printf

section .data
    N       equ 16               ; Reduced N for simulation efficiency (matrix 16x16)
    matrix  times 256 dd 1       ; 16x16 matrix initialized with 1s
    msg     db "Task 4: Row-Major vs. Column-Major Matrix Traversal", 10
            db "Matrix Dimension = %dx%d", 10
            db "Row-Major Traversal Sum = %d", 10, 0

section .text
_main:
    ; Row-Major Traversal Demonstration
    xor eax, eax         ; Sum accumulator = 0
    xor ecx, ecx         ; Outer loop index i = 0

.row_outer_loop:
    cmp ecx, N
    jge .row_done
    
    xor edx, edx         ; Inner loop index j = 0
.row_inner_loop:
    cmp edx, N
    jge .row_inner_done
    
    ; Compute linear offset for row-major: (i * N + j) * 4 bytes
    push eax
    mov eax, ecx
    imul eax, N
    add eax, edx
    shl eax, 2           ; Multiply by 4 (sizeof(int))
    
    mov ebx, matrix
    add ebx, eax
    pop eax
    
    add eax, [ebx]       ; Add matrix[i][j]
    
    inc edx
    jmp .row_inner_loop

.row_inner_done:
    inc ecx
    jmp .row_outer_loop

.row_done:
    ; Output Display
    push eax
    push dword N
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret