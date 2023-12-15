import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv("data1.data",sep=",",header=None)
x=dados[0]
y=dados[1]
plt.ylim(0,20000)
plt.plot(x,y)
plt.show()