from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules=cythonize('devide_by_zero.pyx'))
