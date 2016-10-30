.PHONY: all clean run

ARCH_BITS = $(shell getconf LONG_BIT)
ifeq ($(ARCH_BITS), 64)
ARCH_DFLAGS = -m64
ARCH_LDFLAGS = -melf_x86_64
else
ARCH_DFLAGS = -m32
ARCH_LDFLAGS = -melf_i386
endif

DC = dmd
DFLAGS = -O -release
LD = ld
LDFLAGS = -s
RM = rm
RMFLAGS = -fr

PACKAGE = hello
SOURCE = $(PACKAGE).d
OBJECT = $(PACKAGE).o
TARGET = $(PACKAGE)

all: $(TARGET)

clean:
	$(RM) $(RMFLAGS) $(OBJECT) $(TARGET)

run: all
	$(shell pwd)/$(TARGET)

$(TARGET): $(OBJECT)
	$(LD) $(ARCH_LDFLAGS) $(LDFLAGS) $^ -o$@

$(OBJECT): $(SOURCE)
	$(DC) $(ARCH_DFLAGS) $(DFLAGS) -c $^ -of$@
