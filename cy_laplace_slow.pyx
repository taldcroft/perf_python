cimport cython
cimport numpy as np

@cython.boundscheck(False)
@cython.wraparound(False)
def timestep(double[:, ::1] u, double dx2, double dy2):
    cdef double mult = 0.5 / (dx2 + dy2)

    for i in range(1, u.shape[0] - 1):
        for j in range(1, u.shape[1] - 1):
            u[i, j] = ((u[i+1, j] + u[i-1, j]) * dy2 + (u[i, j+1] + u[i, j-1]) * dx2) * mult

    return None
