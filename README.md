# hello-d-nostdlib
D hello world program on linux x86 without C and D standard libraries.

## Usage
Please use GNU ``make`` to build this program.

### Targets

``all``: Builds the program.

``clean``: Removes the binary and the object file.

``run``: Runs the program.

### Custom variables

``BITS``: System bits. Default value depends on architecture (``x86-64``/``i686``), ``64`` for ``x86-64``, and other values for ``i686``.

``DC``: D compiler. Default value is ``dmd``, but ``ldc2`` is preferred.

``DFLAGS``: Arguments passed to the compiler. Default value is ``-O -release``.

``LD``: Object linker. Default value is ``ld``.

``LDFLAGS``: Arguments passed to the linker. Default value is ``-s``.

## Suggestions
To obtain a smaller and faster binary, please use <a href="https://github.com/ldc-developers/ldc">the LLVM-based D compiler (LDC)</a> to build:

``make DC=ldc2 <your arguments...>``
