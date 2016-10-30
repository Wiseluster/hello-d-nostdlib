__gshared char[14] msg = "Hello, world!\n";

extern (C) pure nothrow @nogc @safe
{
    version (linux)
        void _start()
        {
            version (D_InlineAsm_X86_64)
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
            else version (D_InlineAsm_X86)
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
            else
                static assert(false, "Inline assembler unsupported");
        }
    else
        static assert(false, "Operating system unsupported");

    version (DigitalMars)
    {
        int __dmd_personality_v0(int, int, ulong, void*, void*)
        {
            return 7;
        }

        void _d_arraybounds(string, uint)
        {
        }

        void _d_assert(string, uint)
        {
        }

        void _d_unittest(string, uint)
        {
        }
    }

    void _d_dso_registry(void*)
    {
    }
}
