cimport cython

def automatic_inference():
    """Cython automatically recognized python floats and doubles
    as C doubles but is unable to infer python integers as c int,
    short, or long. So, in the below script, the following happens
    i -> python int -> not typecasted to c type => static typing not achieved
    d -> python float -> typecasted as c double => static typing achieved
    c -> python complex -> not typecastable => static typing not achieved
    r -> python complex -> not typecastable => static typing not achieved
    """
    i = 1
    d = 2.0
    c = 3 + 4j
    r = i * d + c

@cython.infer_types(True)
def forced_inference():
    """Cython decorator `infer_types` forces cython to perform
    automatic typecasting to C types whenever possible. So, python
    integers and floats are typecasted to C longs and doubles and
    in case of overflow, an exception OverflowError is thrown.
    i -> python int -> typecasted to c long => static typing achieved
    d -> python float -> typecasted as c double => static typing achieved
    c -> python complex -> typecasted to c type complex => static typing achieved
    r -> python complex -> typecasted to c type complex => static typing achieved
    """
    i = 1
    d = 2.0
    c = 3 + 4j
    r = i * d + c
