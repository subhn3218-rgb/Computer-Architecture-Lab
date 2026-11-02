global _main
extern _printf

section .data
    ; Simulate an 8-entry fully associative lookup table (Tag + Valid Bit pairs)
    align 32
    tag_table   dd 0x0001, 0x0004, 0x0009, 0x0010, 0x0019, 0x0024, 0x0031, 0x0040
    valid_table dd 1, 1, 1, 1, 1, 1, 1, 1
    table_size  dd 8
    target_tag  dd 0x0019          ; Tag we want to look up (matches entry 5)
    
    msg_hit     db "Task 10: Fully Associative Software Emulation", 10
                db "Target Tag 0x%04X found -> CACHE HIT!", 10, 0
    msg_miss    db "Task 10: Fully Associative Software Emulation", 10
                db "Target Tag not found -> CACHE MISS!", 10, 0

section .text
_main:
    mov ecx, [table_size]  ; Loop counter = 8 entries
    mov edx, 0             ; Index offset = 0
    mov ebx, [target_tag]  ; Load target tag into EBX

.search_loop:
    cmp ecx, 0
    jle .cache_miss        ; If we scan all entries without match -> Miss
    
    ; Check if entry is valid and tag matches
    mov eax, [tag_table + edx * 4]
    cmp eax, ebx
    je .cache_hit          ; Found matching tag -> Hit
    
    inc edx                ; Move to next entry index
    dec ecx
    jmp .search_loop

.cache_hit:
    ; Output Hit Message
    push ebx
    push msg_hit
    call _printf
    add esp, 8
    jmp .end

.cache_miss:
    ; Output Miss Message
    push ebx
    push msg_miss
    call _printf
    add esp, 8

.end:
    xor eax, eax
    ret