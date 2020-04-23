from cython cimport integral, floating, numeric
cimport cython

ctypedef fused point:
    cython.list
    cython.tuple

ctypedef fused integral_or_floating:
    cython.short
    cython.int
    cython.long
    cython.float
    cython.double

cpdef integral int_max(integral a, integral b):
    return a if a >= b else b

cpdef floating float_max(floating a, floating b):
    return a if a >= b else b

cpdef integral_or_floating generic_max(integral_or_floating a, integral_or_floating b):
    return a if a >= b else b

"""
cpdef invalid_calls(a, b):
    # ambigious overloading error at compile time
    cdef int c = int_max(<int>a, <short>b)
    cdef int d = int_max(<long>a, <int>b)
"""