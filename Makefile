.PHONY: all clean run

BITS = $(shell getconf LONG_BIT)
DC = dmd
DFLAGS = -O -release
LD = ld
LDFLAGS = -s
OBJECT = $(PACKAGE).o
PACKAGE = hello
SOURCE = $(PACKAGE).d
TARGET = $(PACKAGE)
RM = rm
RMFLAGS = -fr

ifeq ($(BITS), 64)
	DFLAGS += -m64
	LDFLAGS += -melf_x86_64
else
	DFLAGS += -m32
	LDFLAGS += -melf_i386
endif

all: $(TARGET)

clean:
	$(RM) $(RMFLAGS) $(OBJECT) $(TARGET)

run: all
	$(shell pwd)/$(TARGET)

$(TARGET): $(OBJECT)
	$(LD) $(LDFLAGS) $^ -o$@

$(OBJECT): $(SOURCE)
	$(DC) $(DFLAGS) -c $^ -of$@
