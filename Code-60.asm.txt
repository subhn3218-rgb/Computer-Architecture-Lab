global _main
extern _printf

section .data
    ; Allocate a large array to support strided walking
    ; S values to test: 4, 16, 32, 64, 128 bytes
    current_stride dd 64         ; Configurable stride S (testing critical stride = 64 bytes)
    array times 512 dd 1         ; Array of 512 integers
    msg db "Task 3: Strided Access Degradation", 10
        db "Configured Byte Stride (S) = %d bytes", 10
        db "Traversal Completed. Accumulated Sum = %d", 10, 0

section .text
_main:
    mov ecx, 32          ; Number of steps/loads with the given stride
    xor eax, eax         ; Accumulator sum = 0
    xor edx, edx         ; Byte offset index = 0
    mov esi, [current_stride] ; Load stride value into ESI

.loop_start:
    ; Access array element at Base + (i * S)
    add eax, [array + edx] 
    
    ; Advance offset by stride S
    add edx, esi         
    
    sub ecx, 1           
    jnz .loop_start      

    ; Output Display
    push eax
    push dword [current_stride]
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret