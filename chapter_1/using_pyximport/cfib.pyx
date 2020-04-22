cdef extern from "fib.h":
    unsigned long _cfib "cfib"(unsigned long n);

def cfib(unsigned long n):
    return _cfib(n);

def fib(unsigned long n):
    cdef unsigned long a=0, b=1;
    for i in range(n):
        a, b = a + b, a
    return a
