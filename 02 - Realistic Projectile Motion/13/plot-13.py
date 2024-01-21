import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#
dados1 = pd.read_csv("bola_no_wind.data", header=None, sep=",")
x1 = dados1[0]
y1 = dados1[1]

#
dados2 = pd.read_csv("bola_tailwind.data", header=None, sep=",")
x2 = dados2[0]
y2 = dados2[1]

#
dados3 = pd.read_csv("bola_headwind.data", header=None, sep=",")
x3 = dados3[0]
y3 = dados3[1]

#
plt.xlim(0,150)
plt.ylim(0,35)

plt.xlabel("x[m]")
plt.ylabel("y[m]")
# plt.yticks(np.arange(0,35,10))
# plt.xticks(np.arange(0,200,50))
plt.plot(x1,y1, linestyle="-", label="No wind")
plt.plot(x2,y2, linestyle="--",label="Tailwind")
plt.plot(x3,y3, linestyle=":", label="Headwind")

plt.legend(loc="best")
plt.show()
