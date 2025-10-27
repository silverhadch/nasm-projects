; input.asm - read from stdin and write to stdout
; global declarations for linker
global _start

; dynamic data section
section .bss
    ; buffer of 64 bits and its length
    buffer: resb 64
    buffer_length: equ $-buffer

; text section aka programm section
section .text
_start:
    ; Read from stdin
    mov eax, 0x03           ; Move sys_read (0x03) into eax
    mov ebx, 0              ; Move fd of stdin (0) into ebx
    mov ecx, buffer         ; Move the adresse of the buffer into ecx
    mov edx, buffer_length  ; Move the length of the buffer into edx
    int 0x80                ; Trigger a syscall via interupt 0x80

    ; Write to stdout
    mov edx, eax            ; Move number of bytes read into edx
    mov eax, 0x04           ; Move sys_write (0x04) into eax
    mov ebx, 1              ; Move fd of stdout (1) into ebx
    mov ecx, buffer         ; Move the adresse of the buffer into ecx
    int 0x80                ; Trigger a syscall via interupt 0x80

    mov eax, 0x01   ; Move sys_exit (0x01) into eax
    mov ebx, 0      ; Move exit code (0) into ebx
    int 0x80        ; Trigger a syscall via interupt 0x80

; no data section needed