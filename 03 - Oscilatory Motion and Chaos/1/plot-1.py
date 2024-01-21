import pandas as pd
import matplotlib.pyplot as plt

dados = pd.read_csv("dados1.data", header=None, sep=",")

t = dados[0]
theta = dados[1]
E = dados[2]
plt.ylim(-3,3)

plt.legend(loc="best")
plt.plot(t,E)
plt.show()
