def cy_fact(n):
    if n <= 1:
        return 1
    return n * cy_fact(n - 1)

def typed_fact(unsigned long long n):
    if n <= 1:
        return 1
    return n * typed_fact(n - 1)

cdef unsigned long long _c_fact(unsigned long long n):
    if n <= 1:
        return 1
    return n * _c_fact(n - 1)

def c_fact(unsigned long long n):
    return _c_fact(n)

cpdef unsigned long long cp_fact(unsigned long long n):
    if n <= 1:
        return 1
    return n * cp_fact(n - 1)

cdef inline unsigned long long _inline_c_fact(unsigned long long n):
    if n <= 1:
        return 1
    return n * _inline_c_fact(n - 1)

def inline_c_fact(unsigned long long n):
    return _inline_c_fact(n)

cpdef inline unsigned long long inline_cp_fact(unsigned long long n):
    if n <= 1:
        return n
    return n * inline_cp_fact(n - 1)
