__gshared char[14] msg = "Hello, world!\n";

extern (C) pure nothrow @nogc @safe
{
     void _start()
     {
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
