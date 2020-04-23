cpdef double no_exception_devide(double a, double b):
    return a / b

cpdef double exception_devide(double a, double b) except? -1:
    return a / b
