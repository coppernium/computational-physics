import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\4\dados1.data", header=None, sep=",")
x = dados[0]
y = dados[1]
y2 = dados[2]

#plt.xlim(0,max(x))
#plt.ylim(0,200)
plt.plot(x,y,label="v^2")
#plt.plot(x,y2,label="v")
plt.xlabel("Time [s]")
plt.ylabel("Velocity [m/s]")
plt.legend(loc='best')
plt.show()