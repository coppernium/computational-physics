import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv("dados.data",header=None, sep=",")
x = dados[0]
y = dados[1]

plt.plot(x,y)
plt.show()
