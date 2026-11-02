global _main
extern _printf

section .data
    N       equ 8                ; Matrix dimension N=8
    T       equ 4                ; Tile dimension T=4
    matrixA times 64 dd 1        ; Input Matrix A (8x8 initialized)
    matrixB times 64 dd 0        ; Output Transposed Matrix B (8x8)
    msg     db "Task 5: Loop Tiling (Blocking) Matrix Transpose", 10
            db "Matrix Size = %dx%d, Tile Size = %dx%d", 10
            db "Tiling completed successfully (Blocks processed in L1 cache)", 10, 0

section .text
_main:
    ; Loop Tiling Implementation for Matrix Transposition (B[j][i] = A[i][j])
    mov ecx, 0           ; Outer block row index (ii)

.block_row_loop:
    cmp ecx, N
    jge .done
    
    mov edx, 0           ; Outer block col index (jj)

.block_col_loop:
    cmp edx, N
    jge .next_block_row
    
    ; Inner block row loop (i)
    mov esi, ecx         ; i = ii
.inner_row_loop:
    mov eax, ecx
    add eax, T
    cmp esi, eax
    jge .next_block_col
    
    ; Inner block col loop (j)
    mov edi, edx         ; j = jj
.inner_col_loop:
    mov eax, edx
    add eax, T
    cmp edi, eax
    jge .next_inner_row
    
    ; Compute source index: (i * N + j)
    push esi
    push edi
    
    mov eax, esi
    imul eax, N
    add eax, edi
    shl eax, 2           ; * 4 bytes
    mov ebx, [matrixA + eax] ; Load A[i][j]
    
    ; Compute destination index for transpose: (j * N + i)
    pop edi
    pop esi
    
    push esi
    push edi
    mov eax, edi
    imul eax, N
    add eax, esi
    shl eax, 2           ; * 4 bytes
    mov [matrixB + eax], ebx ; Store into B[j][i]
    
    pop edi
    pop esi
    
    inc edi
    jmp .inner_col_loop

.next_inner_row:
    inc esi
    jmp .inner_row_loop

.next_block_col:
    add edx, T
    jmp .block_col_loop

.next_block_row:
    add ecx, T
    jmp .block_row_loop

.done:
    ; Output Display
    push dword T
    push dword T
    push dword N
    push dword N
    push msg
    call _printf
    add esp, 20
    
    xor eax, eax
    ret