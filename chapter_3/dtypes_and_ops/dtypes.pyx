import cython


def py_int_to_c_int_checkoverflow(n):
    cdef int i
    with cython.overflowcheck(True):
        i = n

@cython.overflowcheck(False)
def py_int_to_c_int_no_checkoverflow(n):
    cdef int i = n

def static_dinamic_mixin():
    b1 = b"All man are mortal"
    b2 = b"Socretes is a man"
    # Here is the problem in the below code. Addition of
    # two python object yields a new "temporary" object.
    # Temporary in the sense that the object is not pointed to
    # by any other python varaibles. So, python's garbage collector
    # deletes the object and hence `cdef char*` variable `buf` ends up
    # pointing to nothing.
    cdef char *buf = b1 + b2
