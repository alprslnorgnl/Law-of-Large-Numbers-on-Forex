import matplotlib
import matplotlib.pyplot as plt
import pandas as pd


#VERİ OKUMA
data = pd.read_csv('values.csv')

data1 = data['ilk_sayi'].tolist()
data2 = data['ikinci_sayi'].tolist()


yuzde_degerler = [f"{i}%" for i in range(0, 101, 10)]

#İLK GRAFİK
plt.figure(1)
plt.bar(range(1, len(data1) + 1), data1, align='center', alpha=0.8)
plt.xticks(range(1, len(data1) + 1))
plt.xlabel('GÜN SAYISI')
plt.ylabel('Yüzde Değerleri')
plt.title('BUY COUNTS')
plt.yticks(range(0, 101, 10), yuzde_degerler)

#İKİNCİ GRAFİK
plt.figure(2)
plt.bar(range(1, len(data2) + 1), data2, align='center', alpha=0.8, color='orange')
plt.xticks(range(1, len(data2) + 1))
plt.xlabel('GÜN SAYISI')
plt.ylabel('Yüzde Değerleri')
plt.title('SELL COUNTS')
plt.yticks(range(0, 101, 10), yuzde_degerler)

plt.show()