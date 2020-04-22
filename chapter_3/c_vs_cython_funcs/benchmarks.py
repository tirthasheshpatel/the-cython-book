import pyximport
pyximport.install()
from timeit import timeit
import cy_fact

def py_fact(n):
    if n <= 1:
        return 1
    return n * py_fact(n - 1)

print(f"avg time taken by py_fact:        {timeit(lambda: py_fact(20))} seconds")
print(f"avg time taken by cy_fact:        {timeit(lambda: cy_fact.cy_fact(20))} seconds")
print(f"avg time taken by typed_fact:     {timeit(lambda: cy_fact.typed_fact(20))} seconds")
print(f"avg time taken by c_fact:         {timeit(lambda: cy_fact.c_fact(20))} seconds")
print(f"avg time taken by inline_c_fact:  {timeit(lambda: cy_fact.inline_c_fact(20))} seconds")
print(f"avg time taken by inline_cp_fact: {timeit(lambda: cy_fact.inline_cp_fact(20))} seconds")
