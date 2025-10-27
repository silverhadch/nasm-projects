; caller.asm - Calls a C library function (puts) from assembly
; Global declarations for linker
global main
; External declaration for puts function
extern puts

; Assemble and link with:
; nasm -felf64 caller.asm && gcc -no-pie caller.o -o caller && ./caller

; Text section
section .text
; Program entry point
; C Main will under the hood call _start
main:
    ; Call the input.asm program
    mov rdi, msg   ; Load address of message into rdi
    call puts      ; Call the puts function from C library
    xor eax, eax   ; Return 0 by setting eax to 0 by comparing it with itself if equal set zero flag
    ret            ; Return from main

section .data
msg db "Calling input.asm program...", 0