#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np

fin = open("publicaciones.bib", "r")
data = fin.readlines()
fin.close()

Q = {'Q1': 0, 'Q2': 0, 'Q3': 0, 'Q4': 0, 'NA': 0}  # Q1 Q2 Q3 Q4 NA

for l in data:
    lin = l.split()
    if len(lin) > 0 and lin[0] == "note":
        q = lin[2][1:3]
        Q[q] += 1
        
print(Q, Q['Q1']+Q['Q2']+Q['Q3']+Q['Q4']+Q['NA'])

    #
fig, ax = plt.subplots(figsize=(4.5,3), subplot_kw=dict(aspect='equal'))

vals = np.array([Q['Q1'], Q['Q2'], Q['Q3'], Q['Q4'], Q['NA']])
total = vals.sum()
prop = vals / total * 100
print('Total:', total)
labels = ['Q1', 'Q2', 'Q3', 'Q4', 'N/A']
wedges, texts = ax.pie(vals, wedgeprops=dict(width=0.5), startangle=0)

bbox_props = dict(boxstyle="square,pad=0.3", fc="w", ec="k", lw=0.72)
kw = dict(arrowprops=dict(arrowstyle="-"),
          bbox=bbox_props, zorder=0, va="center")

for i, p in enumerate(wedges):
    ang = (p.theta2 - p.theta1)/2. + p.theta1
    y = np.sin(np.deg2rad(ang))
    x = np.cos(np.deg2rad(ang))
    horizontalalignment = {-1: "right", 1: "left"}[int(np.sign(x))]
    connectionstyle = "angle,angleA=0,angleB={}".format(ang)
    kw["arrowprops"].update({"connectionstyle": connectionstyle})
    ax.annotate(f'{labels[i]}: {prop[i]:.1f} %', xy=(x, y), xytext=(1.25*np.sign(x), 1.2*y),
                horizontalalignment=horizontalalignment, **kw)
ax.annotate(f'Total: {int(total)}', xy=(0, 0), ha='center')

#  ax.set_title(f"Cuartiles de las publicaciones ({int(total)})")
fig.tight_layout()
plt.savefig('publicaciones_q.pdf')

# plt.show()

