Wicked fast computation with Python
=====================================

- Python is a dynamic language with no built-in static typing.  
- Pure Python is generally slow for numeric computation.

In this notebook I go through a series of techniques that are available
for making numerical code fast within Python.  This is _heavily_ based on
the examples found in [Performance Python](http://www.scipy.org/PerformancePython)
and the [Speeding up Python][1] blog post by Travis Oliphant.

[1]: http://technicaldiscovery.blogspot.com/2011/06/speeding-up-python-numpy-cython-and.html

Before you make it faster
--------------------------

**Profiling!**

Sometimes you'll be surprised where your code is spending time.

Two places to start:

- Standard library [profile](http://docs.python.org/2/library/profile.html) module: by function
- [Line profiler](http://packages.python.org/line_profiler/): line-by-line

Options not covered
--------------------

- Parallelization (e.g. [multiprocessing](http://docs.python.org/2/library/multiprocessing.html),
  [IPython parallel processing](http://ipython.org/ipython-doc/dev/parallel/), MPI, etc etc.
- [PyPy](pypy.org): alternate implementation of Python that uses 
  [JIT](http://en.wikipedia.org/wiki/Just-in-time_compilation) compilation to achieve
  high performance (geometric mean speedup of about 6 over CPython).
  They are obsessed with [speed](http://speed.pypy.org/).

The problem
--------------

Solve the 2D Laplace equation with a specified boundary condition using an iterative finite difference scheme (four point averaging, Gauss-Seidel or Gauss-Jordan). 

