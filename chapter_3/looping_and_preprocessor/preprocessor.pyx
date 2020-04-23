DEF E = 2.718281828459045
DEF PI = 3.141592653589793

"""
IF UNAME_SYSNAME == "Windows":
    cpdef double zero_creator():
        print("Hello windows user!")
        return E ** (1j * PI) + 1.0
ELIF UNAME_SYSNAME == "Linux":
    cpdef double zero_creator():
        print("Hello linux user!")
        return E ** (1j * PI) + 1.0
ELSE:
    cpdef double zero_creator():
        print("Hello unknown user!")
        return E ** (1j * PI) + 1.0
"""

def zero_creator():
    pass