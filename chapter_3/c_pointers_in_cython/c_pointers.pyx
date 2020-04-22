import cython

def basic_pointer():
    cdef double golden_ratio
    cdef double *p_double
    p_double = &golden_ratio
    p_double[0] = 1.618
    print(golden_ratio)
    print(p_double[0])

cpdef tuple array_pointer(const int n):
    cdef int i
    cdef double arr[n]
    for i in range(n):
        arr[i] = i
    return arr
