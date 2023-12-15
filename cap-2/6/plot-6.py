import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv("data1.data", header=None, sep=",")
x = dados[3]
y = dados[4]
plt.xlim(0,4000)
plt.ylim(0,4000)
plt.plot(x,y)
plt.show()
