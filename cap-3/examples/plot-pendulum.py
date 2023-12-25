import pandas as pd
import matplotlib.pyplot as plt

dados = pd.read_csv("pendulum.data", header=None, sep=",")
t = dados[0]
theta = dados[1]

plt.ylim(-2,2)
plt.xlim(0,10)
plt.plot(t,theta)
plt.show()
