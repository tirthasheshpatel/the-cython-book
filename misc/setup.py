from distutils.core import Extension, setup
from Cython.Build import cythonize

setup(ext_modules=cythonize('integrate.pyx'))

