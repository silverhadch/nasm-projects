global _start

section .text
_start:
    mov eax, 0x04
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_length
    int 0x80

    mov eax, 0x01
    mov ebx, 0
    int 0x80

section .data
msg: db "Hello, World!", 0xA
msg_length: equ $-msg
