import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\3\dados1.dat", header=None, sep=",")
x = dados[0]
y = dados[1]

plt.xlim(0,300)
plt.ylim(0,50)
plt.plot(x,y)
plt.show()