def pylike_loop(N):
    res = 0
    for i in range(N):
        res += i
    return res

def cylike_loop(N):
    cdef int n = <int>N
    cdef int i, res = 0
    for i in range(n):
        res += i
    return res
