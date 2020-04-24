import sys
import functools

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib.animation import FuncAnimation

# define some mathematical constants we would need during
# the calculation of velocities and posisions.
PI = 3.14159265358979323
SOLAR_MASS = 4 * PI * PI
DAYS_PER_YEAR = 365.24

# We are making the simulation of Juvian Bodies
# Each body is represented using a dictionary whose
# key is name of the body and whose value is a tuple of:
# 'body': (
#       [px, py, pz],
#       [vx, vy, vz],
#       <mass of the body>
# )
# Here, vx, vy, and vz are the velocities in the direction of each axis
# Similarly, px, py, pz are the co-ordinates of the body in a equlidian space.
BODIES = {
    'sun': (
        [0.0, 0.0, 0.0],
        [0.0, 0.0, 0.0],
        SOLAR_MASS
    ),

    'jupiter': (
        [4.84143144246472090e+00,
        -1.16032004402742839e+00,
        -1.03622044471123109e-01],
        [1.66007664274403694e-03 * DAYS_PER_YEAR,
        7.69901118419740425e-03 * DAYS_PER_YEAR,
        -6.90460016972063023e-05 * DAYS_PER_YEAR],
        9.54791938424326609e-04 * SOLAR_MASS
    ),

    'saturn': (
        [8.34336671824457987e+00,
        4.12479856412430479e+00,
        -4.03523417114321381e-01],
        [-2.76742510726862411e-03 * DAYS_PER_YEAR,
        4.99852801234917238e-03 * DAYS_PER_YEAR,
        2.30417297573763929e-05 * DAYS_PER_YEAR],
        2.85885980666130812e-04 * SOLAR_MASS
    ),

    'uranus': (
        [1.28943695621391310e+01,
        -1.51111514016986312e+01,
        -2.23307578892655734e-01],
        [2.96460137564761618e-03 * DAYS_PER_YEAR,
        2.37847173959480950e-03 * DAYS_PER_YEAR,
        -2.96589568540237556e-05 * DAYS_PER_YEAR],
        4.36624404335156298e-05 * SOLAR_MASS
    ),

    'neptune': (
        [1.53796971148509165e+01,
        -2.59193146099879641e+01,
        1.79258772950371181e-01],
        [2.68067772490389322e-03 * DAYS_PER_YEAR,
        1.62824170038242295e-03 * DAYS_PER_YEAR,
        -9.51592254519715870e-05 * DAYS_PER_YEAR],
        5.15138902046611451e-05 * SOLAR_MASS
    )
}

def combinations(bodies):
    """We need to find all the combinations
    of bodies as each body interacts with the other
    which would affect the relative velocities and positions.
    """
    pairs = []
    for idx in range(len(bodies) - 1):
        other_bodies = bodies[idx + 1:]
        for other_body in other_bodies:
            pairs.append((bodies[idx], other_body))
    return pairs

def sympletic_integrator_step(dt: float, bodies: list, pairs: list, ax: Axes3D, *args, **kwargs):
    """A sympletic integrator to update the positions
    of bodies in our system of bodies.

    Reference
    ---------
    [1]: Sympletic Integrator on Wikipedia
         https://en.wikipedia.org/wiki/Symplectic_integrator
    """
    for (
        ([x1, y1, z1], v1, m1),
        ([x2, y2, z2], v2, m2)
    ) in pairs:
        dx = x1 - x2
        dy = y1 - y2
        dz = z1 - z2
        mag = dt * ((dx * dx + dy * dy + dz * dz) ** (-1.5))
        b1m = m1 * mag
        b2m = m2 * mag
        v1[0] -= dx * b2m
        v1[1] -= dy * b2m
        v1[2] -= dz * b2m
        v2[0] += dx * b1m
        v2[1] += dy * b1m
        v2[2] += dz * b1m
    for (r, [vx, vy, vz], m) in bodies:
        r[0] += dt * vx
        r[1] += dt * vy
        r[2] += dt * vz
    ax.clear()
    ax.axis("off")
    ax.set_xlim(-20., 20.)
    ax.set_ylim(-20., 20.)
    ax.set_zlim(-20., 20.)
    for ii in range(360):
        ax.view_init(elev=90., azim=ii)
    for name, body in BODIES.items():
        pos, _, mass = body
        sc = ax.scatter(*pos, s=20 * (mass**0.3), label=name)
    ax.legend()
    return sc

def leapfrog_integrator_step(dt, n, bodies, pairs):
    pass

def offset_momentum(ref, bodies):
    px = py = pz = 0.0
    for (r, [vx, vy, vz], m) in bodies:
        px -= m * vx
        py -= m * vy
        pz -= m * vz
    r, v, m = ref
    v[0] = px / m
    v[1] = py / m
    v[2] = pz / m

def report_energy(bodies, pairs):
    E = 0.0
    for (
        ([x1, y1, z1], v1, m1),
        ([x2, y2, z2], v2, m2)
    ) in pairs:
        dx = x1 - x2
        dy = y1 - y2
        dz = z1 - z2
        E -= (m1 * m2) / ((dx * dx + dy * dy + dz * dz) ** 0.5)
    for r, [vx, vy, vz], m in bodies:
        E += m * (vx * vx + vy * vy + vz * vz) / 2.0
    print(f"{E:.9f}")

def stimulate(n, bodies=BODIES, ref='sun'):
    pass

if __name__ == '__main__':
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    bodies_list = list(BODIES.values())
    pairs = combinations(bodies_list)
    offset_momentum(BODIES['sun'], bodies_list)
    # report_energy(bodies_list, pairs)
    integrator = functools.partial(sympletic_integrator_step, 0.1, bodies_list, pairs, ax)
    # report_energy(bodies_list, pairs)
    anim = FuncAnimation(fig, integrator, frames=1000, interval=20)
    anim.save('solar_bodies.mp4')
    # plt.show()
