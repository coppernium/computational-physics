import pandas as pd
import matplotlib.pyplot as plt

dados = pd.read_csv("dados1.data", sep=",", header=None)
t = dados[0]
x = dados[1]

plt.plot(t,x)
plt.show()