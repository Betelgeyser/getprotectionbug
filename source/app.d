import std.stdio;

struct S(T)
{
	T var;
	pragma(msg, "Inside S: func() is ", __traits(getProtection, __traits(getMember, T, "func"))); // This causes dmd to crash since some version
}

class C
{
	alias Al = S!C;
	
	static int func(U)(U var) // If func() has no template parameters this code compiles fine
	{
		return 123;
	}
	pragma(msg, "Inside C: func() is ", __traits(getProtection, __traits(getMember, C, "func"))); // This works perfectly
}

void main()
{
	writeln("Edit source/app.d to start your project.");
}
