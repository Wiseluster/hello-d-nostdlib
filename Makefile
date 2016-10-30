.PHONY: all clean run

BIN = hello
BITS = $(shell getconf LONG_BIT)
DC = dmd
DFLAGS = -O -release -m
LD = ld
LDFLAGS = -s
OBJ = $(BIN).o
RM = rm
RMFLAGS = -fr
SRC = $(BIN).d

all: $(BIN)

clean:
	$(RM) $(RMFLAGS) $(OBJ) $(BIN)

run: all
	$(PWD)/$(BIN)

$(BIN): $(OBJ)
	$(LD) $(LDFLAGS) $^ -o$@

$(OBJ): $(SRC)
	$(DC) $(DFLAGS) -c $^ -of$@
