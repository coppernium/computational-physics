from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt 
import pandas as pd
import numpy as np


df = pd.read_csv("~/Documents/computational-physics/cap-4/07/orbit.data", header=None, sep=",")
t = df[0]
x1 = df[1]
y1 = df[2]
x2 = df[3]
y2 = df[4]

AU = 1.5e11
scale = 10*AU

x1_data = []
y1_data = []
x2_data = []
y2_data = []




fig, ax = plt.subplots(figsize=(9,9))
ax.set_facecolor("#dbdbdb")
plt.grid()
# fig.patch.set_facecolor('black')
ax.set_xlim(-scale,scale)
ax.set_ylim(-scale,scale)

# Caso eu queria mostrar os eixos
ax.set_yticks(np.arange(-scale,scale+0.1,scale/3))
ax.set_xticks(np.arange(-scale,scale+0.1,scale/3))

# Esconde os eixos
# ax.get_xaxis().set_ticks([])
# ax.get_yaxis().set_ticks([])


# Plota texto

time_template = 'time = %.2f Years'
time_text = ax.text(1+0.01, 1+0.01,'', verticalalignment='bottom', horizontalalignment='right',  transform=ax.transAxes, fontsize=15)
# Planeta 1
planet_x1 = 0
planet_y1 = 0

planet1, = ax.plot(planet_x1,planet_y1, 'o', markersize=8, color="blue")
ln1, = ax.plot(x1_data,y1_data, color="blue")

# Planeta 2
planet_x2 = 0
planet_y2 = 0

planet2, = ax.plot(planet_x2,planet_y2, 'o', markersize=8, color="red")
ln2, = ax.plot(x2_data,y2_data, color="red")


def init():
    return ln1,planet1,ln2,planet2

def animate(i):
    
    x1_data.append(x1[i]) 
    y1_data.append(y1[i]) 
    ln1.set_data(x1_data, y1_data) 
    planet1.set_data(x1_data[i], y1_data[i]) 

 
    x2_data.append(x2[i]) 
    y2_data.append(y2[i]) 
    ln2.set_data(x2_data, y2_data) 
    planet2.set_data(x2_data[i], y2_data[i]) 

    time_text.set_text(time_template % t[i]) 


animation = FuncAnimation(fig, animate, interval=10,init_func=init,frames=len(df[0]),repeat=True)
plt.show()

