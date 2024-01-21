import matplotlib.pyplot as plt
import pandas as pd

dados = pd.read_csv("dados1.data", header=None, sep=",")
x = dados[0]*3.28
y = dados[1]*3.28

plt.xlabel("x [feet]")
plt.ylabel("y [feet]")
plt.ylim(-4,4)
plt.xlim(-5,150)
plt.plot(x,y,label="Deflexão vertical")
plt.legend(loc="best")
plt.show()
