from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt 
import pandas as pd
import numpy as np


df = pd.read_csv("~/Documents/computational-physics/cap-4/04/dados.data", header=None, sep=",")
t = df[0]
x = df[1]
y = df[2]

scale = 2

x_data = []
y_data = []
fig, ax = plt.subplots(figsize=(9,9))
ax.set_facecolor("#dbdbdb")
# fig.patch.set_facecolor('black')
ax.set_xlim(-scale,scale)
ax.set_ylim(-scale,scale)

# Caso eu queria mostrar os eixos
ax.set_yticks(np.arange(-scale,scale+0.1,scale/2))
ax.set_xticks(np.arange(-scale,scale+0.1,scale/2))

# Esconde os eixos
# ax.get_xaxis().set_ticks([])
# ax.get_yaxis().set_ticks([])

# Plota o sol
ax.plot(0,0, 'o', markersize=8, color="red")

# Plota texto

time_template = 'time = %.3f Years'

planet_x = 0
planet_y = 0
time_text = ax.text(1+0.01, 1+0.01,'', verticalalignment='bottom', horizontalalignment='right',  transform=ax.transAxes, fontsize=15)

planet, = ax.plot(planet_x,planet_y, 'o', markersize=8, color="blue")
ln, = ax.plot(x_data,y_data, color="blue")

def init():
    return ln,planet,

def animate(i):
    
    x_data.append(x[i]) 
    y_data.append(y[i]) 
    ln.set_data(x_data, y_data) 
    planet.set_data(x_data[i], y_data[i]) 
    time_text.set_text(time_template % t[i]) 


animation = FuncAnimation(fig, animate, interval=100,init_func=init,frames=len(df[0]),repeat=True)
plt.show()

