import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

dados = pd.read_csv("dados1.data", header=None, sep=",")
x = dados[0]
y = dados[1]
plt.xlim(0,200)
plt.ylim(0,35)
plt.yticks(np.arange(0,35,10))
plt.xticks(np.arange(0,200,50))
plt.plot(x,y)
plt.show()
