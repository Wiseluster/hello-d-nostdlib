version (DigitalMars)
    version (linux)
    {
        version (X86_64)
            version = SUPPORTED;
        else version (X86)
            version = SUPPORTED;
    }

version (SUPPORTED)
{
}
else
    static assert(false, "Unsupported");

__gshared char[14] msg = "Hello, world!\n";

extern (C) pure nothrow @nogc @safe
{
     void _start()
     {
         version (X86_64)
             asm pure nothrow @nogc @trusted
             {
                 naked;
                 mov EAX, 1;
                 mov EDI, EAX;
                 lea ESI, msg;
                 mov EDX, msg.length;
                 syscall;
                 mov EAX, 60;
                 xor EDI, EDI;
                 syscall;
             }
         else version (X86)
             asm pure nothrow @nogc @trusted
             {
                 naked;
                 mov EAX, 4;
                 mov EBX, 1;
                 lea ECX, msg;
                 mov EDX, msg.length;
                 int 0X80;
                 mov EAX, 1;
                 xor EBX, EBX;
                 int 0x80;
             }
    }

    int __dmd_personality_v0()
    {
        return 7;
    }

    void _d_arraybounds()
    {
    }

    void _d_assert()
    {
    }

    void _d_unittest()
    {
    }

    void _d_dso_registry()
    {
    }
}
