.PHONY: all clean run

BIN = hello
DC = dmd
DFLAGS = -O -release
LD = gcc
LDFLAGS = -nostdlib -s
OBJ = $(BIN).o
RM = rm
RMFLAGS = -fr
SRC = $(BIN).d

all: $(BIN)

clean:
	$(RM) $(RMFLAGS) $(OBJ) $(BIN)

run:
	$(PWD)/$(BIN)

$(BIN): $(OBJ)
	$(LD) $(LDFLAGS) $^ -o$@

$(OBJ): $(SRC)
	$(DC) $(DFLAGS) -c $^ -of$@
