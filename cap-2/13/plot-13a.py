import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

#
dados1 = pd.read_csv("bola_no_wind.data", header=None, sep=",")
x1 = dados1[0]
y1 = dados1[1]



#
plt.xlim(0,150)
plt.ylim(0,35)

plt.xlabel("x[m]")
plt.ylabel("y[m]")
# plt.yticks(np.arange(0,35,10))
# plt.xticks(np.arange(0,200,50))
plt.plot(x1,y1, linestyle="-", label="No wind")


plt.legend(loc="best")
plt.show()
