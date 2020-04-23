"""
NOTE: you cannot use `ctypedef` inside any local scope like a function
"""

ctypedef double real
ctypedef int integral

cpdef real displacement(real d0, real v0, real a, real t):
    cdef real d = d0 + v0 * a + 0.5 * a * t ** 2
    return d
