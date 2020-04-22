cimport cython

cpdef double integrate(double a, double b, f):
    cdef int i
    cdef int N=2000
    cdef double dx, res=0.0
    dx = (b-a)/N
    for i in range(N):
        res += f(a+i*dx)
    return res * dx

@cython.infer_types(True)
cpdef complex check_type():
    i = 1
    d = 2.0
    c = 3 + 4j
    r = i * d + c
    return r


