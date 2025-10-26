# NASM Projects

Small Linux assembly programs written in **NASM syntax**,  
because the other syntaxes are crimes against clarity.

### Build & Run
```bash
nasm -f elf32 hello_world.asm -o hello_world.o
ld -m elf_i386 hello_world.o -o hello_world
./hello_world
````

### Requirements

* NASM
* ld (GNU linker)
* Linux (32-bit or 64-bit with multilib)

### Syscall Table

Full list of Linux syscall numbers (for all architectures):
[syscalls.md](https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md)

---

Clean syntax. Real control.
