from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt 
import pandas as pd
import numpy as np


df = pd.read_csv("dados1.data", header=None, sep=",")
x = df[1]
y = df[2]

scale = 10

x_data = []
y_data = []
fig, ax = plt.subplots()
ax.set_xlim(-scale,scale)
ax.set_ylim(-scale,scale)
ax.set_yticks(np.arange(-scale,scale+0.1,scale/2))
ax.set_xticks(np.arange(-scale,scale+0.1,scale/2))
ln, = ax.plot(x_data,y_data)

def init():
    return ln,

def animate(i):
    
    x_data.append(x[i]) 
    y_data.append(y[i]) 
    ln.set_data(x_data, y_data) 


animation = FuncAnimation(fig, animate, interval=100,init_func=init,repeat=True,save_count=144)

plt.show()
