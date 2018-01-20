#!/usr/bin/env python

############################################################
#  Dom 1
#
#  Copyright 2018 niquit. All rights reserved.
############################################################

############################################################
#  BEGIN CONFIGURE SCRIPT

from numpy import sin, cos
import numpy as numpy
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plot
import scipy.integrate as integrate
import matplotlib.animation as animation

#  END CONFIGURE SCRIPT
############################################################

############################################################
#  BEGIN DEFAULT VARIABLES

G = 9.81
L1 = 1.0
L2 = 2.0
M1 = 1.0
M2 = 2.0
fi1 = 180.0
fi2 = 50.0

#  END DEFAULT VARIABLES
############################################################

############################################################
#  BEGIN RUNGE-KUTTA FOURTH ORDER METHOD

def derivation(state, t):
    dydx = numpy.zeros_like(state)

    dydx[0] = state[1]
    dydx[1] = (M2 * L1 * state[1] * state[1] * sin(state[2] - state[0]) * cos(state[2] - state[0]) + M2 * G * sin(state[2]) * cos(state[2] - state[0]) + M2 * L2 * state[3] * state[3] * sin(state[2] - state[0]) - (M1 + M2) * G * sin(state[0])) / ((M1 + M2) * L1 - M2 * L1 * cos(state[2] - state[0]) * cos(state[2] - state[0]))
    dydx[2] = state[3]
    dydx[3] = (-M2 * L2 * state[3] * state[3] * sin(state[2] - state[0]) * cos(state[2] - state[0]) + (M1 + M2) * G * sin(state[0]) * cos(state[2] - state[0]) - (M1 + M2) * L1 * state[1] * state[1] * sin(state[2] - state[0]) - (M1 + M2) * G * sin(state[2])) / ((L2 / L1) * ((M1 + M2) * L1 - M2 * L1 * cos(state[2] - state[0]) * cos(state[2] - state[0])))

    return dydx

#  END RUNGE-KUTTA FOURTH ORDER METHOD
############################################################

############################################################
#  BEGIN SCRIPT

y = integrate.odeint(derivation, numpy.radians([fi1, 0, fi2, 0]), numpy.arange(0.0, 30, 0.01))

x1 = L1 * sin(y[:, 0])
x2 = L2 * sin(y[:, 2]) + L1 * sin(y[:, 0])

y1 = -L1 * cos(y[:, 0])
y2 = -L2 * cos(y[:, 2]) - L1 * cos(y[:, 0])

figure = plot.figure()
ax = figure.add_subplot(111, autoscale_on=False, xlim=(-1.1*(L1+L2), 1.1*(L1+L2)), ylim=(-1.1*(L1+L2), 1.1*(L1+L2)))
line, = ax.plot([], [], 'o-', lw=2)

def init():
    line.set_data([], [])
    return line,

def animate(i):
    line.set_data([0, x1[i], x2[i]], [0, y1[i], y2[i]])
    line.set_color("red")
    return line,

animation = animation.FuncAnimation(figure, animate, 600, interval=30, init_func=init)

fullscreen = plot.get_current_fig_manager()
fullscreen.resize(*fullscreen.window.maxsize())

plot.show()

#  END SCRIPT
############################################################