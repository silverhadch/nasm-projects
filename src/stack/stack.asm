global _start
section .text
_start:
    ; Initialize registers
    mov rax, 1
    mov rbx, 2

    ; Push registers onto stack
    push rax
    push rbx

    ; Pop registers from stack
    pop rcx
    pop rdx

    ; Return 0
    xor eax, eax
    ret
