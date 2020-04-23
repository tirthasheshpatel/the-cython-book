cdef unsigned long fact(unsigned long n):
    if n <= 1:
        return 1
    return n * fact(n - 1)

cdef unsigned long fib(unsigned long n):
    cdef unsigned long i
    cdef unsigned long a = 0, b = 1
    for i in range(n):
        a, b = a + b, a
    return a

cdef void* fact_wrapper(void *np, void* resp):
    cdef unsigned long n = (<unsigned long*>np)[0]
    cdef unsigned long res = fact(n)
    (<unsigned long*>resp)[0] = res

cdef void* fib_wrapper(void *np, void* resp):
    cdef unsigned long n = (<unsigned long*>np)[0]
    cdef unsigned long res = fib(n)
    (<unsigned long*>resp)[0] = res

cdef void* exec_func(void* (*func)(void*, void*), void *arg, void *resp):
    func(arg, resp)

cpdef unsigned long func_executor(unsigned long n, str func) except? -1:
    cdef unsigned long res
    if func == "fact":
        exec_func(fact_wrapper, &n, &res)
    elif func == "fib":
        exec_func(fib_wrapper, &n, &res)
    return res

def print_address(a):
    cdef void *v = <void*>a
    cdef long addr = <long>v
    print("Cython virtual address: {}".format(addr))
    print("Python ID             : {}".format(id(a)))

def cast_to_list_unchecked(obj):
    cdef list casted = <list>obj
    print(type(obj))
    print(type(casted))
    casted.append(4)

def cast_to_list_checked(obj):
    cdef list casted = <list?>obj
    print(type(obj))
    print(type(casted))
    casted.append(4)
