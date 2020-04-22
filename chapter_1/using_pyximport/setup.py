from distutils.core import Extension, setup
from Cython.Build import cythonize

ext_lib = Extension(
    name="cfib",
    sources=['fib.c', 'cfib.pyx']
)

setup(ext_modules=cythonize(ext_lib))
