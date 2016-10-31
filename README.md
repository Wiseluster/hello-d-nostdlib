# hello-d-nostdlib
D hello world program on linux x86 without C and D standard libraries.

## Usage
Please use GNU ``make`` to build this program.

### Targets

``all``: Builds the program.

``clean``: Removes the binary and the object file.

``run``: Runs the program.

### Custom variables

``BITS``: Target system bits. Its default value depends on architecture (``x86-64``/``i686``). If its value is ``64``, then the target architecture will be ``x86-64``, otherwise ``i686``.

``DC``: D compiler. Its default value is ``dmd``, but ``ldc2`` is preferred.

``DFLAGS``: Arguments passed to the compiler. Its default value is ``-O -release``.

``LD``: Object linker. Its default value is ``ld``.

``LDFLAGS``: Arguments passed to the linker. Its default value is empty.

## Suggestions
To obtain a smaller and faster binary, please use <a href="https://github.com/ldc-developers/ldc">the LLVM-based D compiler (LDC)</a> to build:

``make DC=ldc2 <your arguments...>``
