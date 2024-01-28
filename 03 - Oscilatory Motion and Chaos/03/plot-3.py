import pandas as pd
import matplotlib.pyplot as plt

dados = pd.read_csv("dados1.data", header=None, sep=",")

t = dados[0]
theta = dados[1]
plt.ylim(-1,1)
plt.xlim(0,10)
plt.legend(loc="best")
plt.plot(t,theta)
plt.show()
