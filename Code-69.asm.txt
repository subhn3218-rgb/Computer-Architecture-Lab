global _main
extern _printf

section .data
    test_addr   dd 0x80001FE0    ; Raw test physical address
    mask        dd 0x7F          ; Mask for set index bits (7 bits for 128 sets)
    msg         db "Task 12: Cache Index Hashing Emulation", 10
                db "Raw Address   = 0x%08X", 10
                db "Raw Set Index = 0x%02X", 10
                db "Hashed Index  = 0x%02X (XOR randomized)", 10, 0

section .text
_main:
    mov eax, [test_addr]   ; Load raw address into EAX
    
    ; 1. Extract Raw Set Index (bits 11:5)
    mov ebx, eax
    shr ebx, 5
    mov ecx, [mask]
    and ebx, ecx           ; EBX = Raw Set Index
    
    ; 2. Extract Tag (higher bits shifted)
    mov edx, eax
    shr edx, 12            ; EDX = Tag
    
    ; 3. Cache Index Hashing: Index_hashed = Index_raw ^ (Tag & Mask)
    mov esi, edx
    and esi, ecx           ; ESI = Tag & Mask
    mov edi, ebx
    xor edi, esi           ; EDI = Hashed Index (Raw Index XOR (Tag & Mask))
    
    ; Output Display
    push edi               ; Hashed Index
    push ebx               ; Raw Set Index
    push eax               ; Raw Address
    push msg
    call _printf
    add esp, 16
    
    xor eax, eax
    ret