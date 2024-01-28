import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\1\dados.dat",header=None,sep=",")


x = data[0]
y= data[1]
plt.xlim(0,200)
plt.ylim(0,60)

plt.plot(x,y)
plt.show()