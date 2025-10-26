ASM = nasm
LD  = ld
SRC = hello_world.asm
OBJ = $(SRC:.asm=.o)
BIN = $(SRC:.asm=)

all: $(BIN)

%.o: %.asm
	$(ASM) -f elf32 $< -o $@

%: %.o
	$(LD) -m elf_i386 $< -o $@

run: $(BIN)
	./$(BIN)

clean:
	rm -f $(OBJ) $(BIN)
