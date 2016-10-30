.PHONY: all clean run

BITS = $(shell getconf LONG_BIT)
DC = dmd
DFLAGS = -O -release -m
LD = ld
LDFLAGS = -s
RM = rm
RMFLAGS = -fr

all: hello

clean:
	$(RM) $(RMFLAGS) hello.o hello

run: all
	$(shell pwd)/hello

hello: hello.o
	$(LD) $(LDFLAGS) $^ -o$@

hello.o: hello.d
	$(DC) $(DFLAGS) -c $^ -of$@
