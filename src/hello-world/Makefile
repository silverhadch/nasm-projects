ASM = nasm
LD  = ld
SRC = hello_world.asm
OBJ = $(SRC:.asm=.o)
BIN = $(SRC:.asm=)

all: $(BIN)
	./$(BIN)

%.o: %.asm
	$(ASM) -f elf32 $< -o $@

%: %.o
	$(LD) -m elf_i386 $< -o $@

clean:
	rm -f $(OBJ) $(BIN)
