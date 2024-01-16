from matplotlib.animation import FuncAnimation
import matplotlib.pyplot as plt 
import pandas as pd
import numpy as np


df = pd.read_csv("~/Documents/computational-physics/cap-4/01/dados1.data", header=None, sep=",")
x = df[1]
y = df[2]


x_data = []
y_data = []
fig, ax = plt.subplots()
ax.set_xlim(-2,2)
ax.set_ylim(-2,2)
ax.set_yticks(np.arange(-2,2.1,1))
ax.set_xticks(np.arange(-2,2.1,1))
ln, = ax.plot(x_data,y_data)

def init():
    return ln,

def animate(i):
    
    x_data.append(x[i]) 
    y_data.append(y[i]) 
    ln.set_data(x_data, y_data) 


animation = FuncAnimation(fig, animate, interval=10,init_func=init,repeat=False,save_count=144)

plt.show()
