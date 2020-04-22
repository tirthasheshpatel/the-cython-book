#include "cfib.h"

unsigned long fib(unsigned long n)
{
    unsigned long a=0, b=1, tmp, i;
    for(i=0;i<n;i++) {
        tmp=a;
        a=a+b;
        b=tmp;
    }
    return a;
}