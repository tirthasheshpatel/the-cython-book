# cython: cdivision=True
import cython


@cython.cdivision(False)
def py_division_and_mod(int n, int m):
    cdef double divi = m / n
    cdef int mod = m % n
    return (divi, mod)


@cython.cdivision(True)
def c_division_and_mod_decorator(int n, int m):
    cdef double divi = m / n
    cdef int mod = m % n
    return (divi, mod)


def c_division_and_mod_context(int n, int m):
    cdef double divi
    cdef int mod
    with cython.cdivision(True):
        divi = m / n
        mod = m % n
    return (divi, mod)


def c_division_and_mod_directive(int n, int m):
    cdef double divi = m / n
    cdef int mod = m % n
    return (divi, mod)
