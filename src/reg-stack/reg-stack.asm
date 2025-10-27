; nasm -f elf32 reg-stack.asm && ld -m elf_i386 reg-stack.o -o reg-stack && ./reg-stack

section .data
msg db "Value of EAX before/after:", 10
msglen equ $ - msg
buf  times 32 db 0

section .text
global _start

_start:
    mov eax, 42          ; original value
    mov ebx, 99

    push eax             ; save both on the stack
    push ebx

    ; print label
    mov eax, 4           ; syscall: write
    mov ebx, 1           ; fd = stdout
    mov ecx, msg
    mov edx, msglen
    int 0x80

    ; print saved EAX (the one below top)
    mov eax, [esp+4]
    mov esi, buf
    call print_number

    ; modify registers
    mov eax, 1234
    mov ebx, 5678

    ; print new value
    mov esi, buf
    call print_number

    ; restore saved values
    pop ebx
    pop eax

    ; print restored value
    mov esi, buf
    call print_number

    ; exit(0)
    mov eax, 1
    xor ebx, ebx
    int 0x80


;----------------------------------------------------------
; print_number: converts EAX → ASCII and prints it
; EAX destroyed, ECX, EDX, ESI used
;----------------------------------------------------------
print_number:
    mov ecx, 10          ; base 10
    mov edi, esi         ; keep buffer pointer
    add edi, 31          ; write backwards
    mov byte [edi], 10   ; newline

.convert:
    xor edx, edx
    div ecx              ; EAX / 10
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .convert

    ; print result
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buf + 32
    sub edx, edi
    int 0x80
    ret

