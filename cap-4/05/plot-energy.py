import matplotlib.pyplot as plt 
import pandas as pd


df = pd.read_csv("~/Documents/computational-physics/cap-4/05/energy.data", header=None, sep=",")
t = df[0]
E = df[1]



plt.plot(t,E)
plt.show()

