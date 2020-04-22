from distutils.core import Extension, setup
from Cython.Build import cythonize

ext = Extension(
    name="wrap_cfib",
    sources=["cfib.c", "wrap_cfib.pyx"]
)

setup(ext_modules=cythonize(ext))
