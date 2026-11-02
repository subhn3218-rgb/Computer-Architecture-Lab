global _main
extern _printf

section .data
    align 64
    target_data dd 0x12345678    ; Target memory variable
    
    msg db "Task 18: Cache Flushing & Cold-Start Latency Measurement", 10
        db "1. Hot Cache Access Latency  = %u cycles", 10
        db "2. Cold Access Latency (Flush)= %u cycles", 10, 0

section .bss
    hot_cycles  resd 1
    cold_cycles resd 1

section .text
_main:
    ; -------------------------------------------------------------
    ; 1. Warm-up & Hot Access Measurement (L1 Hit)
    ; -------------------------------------------------------------
    mov eax, [target_data]       ; Load into cache
    
    rdtsc                        ; Read time-stamp counter (EDX:EAX)
    mov ebx, eax                 ; Store start cycle count
    
    mov eax, [target_data]       ; Hot load (Cache Hit)
    
    rdtsc                        ; Read end time-stamp counter
    sub eax, ebx                 ; Calculate delta cycles
    mov [hot_cycles], eax

    ; -------------------------------------------------------------
    ; 2. Cache Line Flush & Cold Access Measurement (DRAM Miss)
    ; -------------------------------------------------------------
    clflush [target_data]        ; Explicitly flush cache line containing target_data
    
    rdtsc                        ; Read time-stamp counter
    mov ebx, eax                 ; Store start cycle count
    
    mov eax, [target_data]       ; Cold load (Cache Miss -> DRAM fetch)
    
    rdtsc                        ; Read end time-stamp counter
    sub eax, ebx                 ; Calculate delta cycles
    mov [cold_cycles], eax

    ; Output Display
    push dword [cold_cycles]
    push dword [hot_cycles]
    push msg
    call _printf
    add esp, 12
    
    xor eax, eax
    ret