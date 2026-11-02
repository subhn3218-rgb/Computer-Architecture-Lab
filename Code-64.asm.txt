global _main
extern _printf

section .data
    test_addr dd 0x80001FE0    ; Boundary test address specified in Task 7
    msg db "Task 7: Address Bit-Field Extraction", 10
        db "Input Address         = 0x%08X", 10
        db "Tag (bits 31:12)      = 0x%05X", 10
        db "Set Index (bits 11:5) = 0x%02X", 10
        db "Block Offset (bits 4:0)= 0x%02X", 10, 0

section .text
_main:
    mov eax, [test_addr]   ; Load test address into EAX
    
    ; 1. Extract Block Offset (bits 4:0): Mask with 0x1F
    mov ebx, eax
    and ebx, 0x1F          ; EBX = Block Offset
    
    ; 2. Extract Set Index (bits 11:5): Shift right by 5, then mask with 0x7F
    mov ecx, eax
    shr ecx, 5
    and ecx, 0x7F          ; ECX = Set Index
    
    ; 3. Extract Tag (bits 31:12): Shift right by 12
    mov edx, eax
    shr edx, 12            ; EDX = Tag
    
    ; Output Display
    push ebx               ; Block Offset
    push ecx               ; Set Index
    push edx               ; Tag
    push eax               ; Input Address
    push msg
    call _printf
    add esp, 20
    
    xor eax, eax
    ret