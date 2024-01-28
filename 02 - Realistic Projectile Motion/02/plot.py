import matplotlib.pyplot as plt
import pandas as pd

dados1 = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\2\dados.dat", header=None, sep=",")
dados2 = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\2\dados1.dat", header=None, sep=",")
dados3 = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\2\dados2.dat", header=None, sep=",")
dados4 = pd.read_csv(r"C:\Users\joaov\Documents\computational-physics\cap-2\2\dados3.dat", header=None, sep=",")

x = dados1[0]
y2=dados2[1]
y3=dados3[1]
y4=dados4[1]

y = dados1[1]

plt.figure(figsize=(14,8))

plt.xlim(0,200)
plt.ylim(0,50)
plt.plot(x,y,label="air resistence")
plt.plot(x,y2,label="no air resistence")
plt.plot(x,y3,label="air resistence area 30%% less")
plt.plot(x,y4,label="air resistence Power 3 times greater")
plt.legend(loc='best')
plt.savefig('plot1.png', dpi=300, )
plt.show()