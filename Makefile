.PHONY: all clean run

BITS = $(shell getconf LONG_BIT)
DC = dmd
DFLAGS = -O -release -m
LD = ld
LDFLAGS = -s
OBJECT = $(PACKAGE).o
PACKAGE = hello
SOURCE = $(PACKAGE).d
TARGET = $(PACKAGE)
RM = rm
RMFLAGS = -fr

all: $(TARGET)

clean:
	$(RM) $(RMFLAGS) hello.o hello

run: all
	$(shell pwd)/$(TARGET)

$(TARGET): $(OBJECT)
	$(LD) $(LDFLAGS) $^ -o$@

$(OBJECT): $(SOURCE)
	$(DC) $(DFLAGS) -c $^ -of$@
