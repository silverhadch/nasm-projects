; hello_world.asm - A simple "Hello, World!" program in x86 Assembly
; global declarations for linker
global _start

; text section aka program section
section .text
; program entry point
_start:
    mov eax, 0x04       ; sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, msg        ; pointer to message to write
    mov edx, msg_length ; length of message
    int 0x80            ; trigger syscall

    mov eax, 0x01  ; sys_exit
    mov ebx, 0     ; exit code 0
    int 0x80       ; trigger syscall
; end of program

; data section      
section .data
; message to print and its length
msg: db "Hello, World!", 0xA
msg_length: equ $-msg