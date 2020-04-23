import warnings
warnings.filterwarnings("ignore")

import pyximport
pyximport.install()

from preprocessor import *
from loops import *
from timeit import timeit

print(f"Time taken by python for loop: {timeit(lambda: pylike_loop(1000))}")
print(f"Time taken by cython for loop: {timeit(lambda: cylike_loop(1000))}")

print("Benchmarks complete!")
print("Other tests running...")

zero_creator()
