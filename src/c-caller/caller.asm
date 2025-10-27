global main
; nasm -felf64 caller.asm && gcc -no-pie caller.o -o caller && ./caller
section .text
main:
    ; Call the input.asm program
    extern puts
    mov rdi, msg
    call puts
    ; ret removed to have a null status exit
    ; because the return value of puts is the length of the string

    ; Strings in C end with null terminator
    mov eax, 0x01
    mov ebx, 0
    int 0x80

msg db "Calling input.asm program...", 0

