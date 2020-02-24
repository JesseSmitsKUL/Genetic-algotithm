import csv
import os
import glob
from os import listdir
from os.path import isfile, join
import matplotlib.pyplot as plt
import random

pic = "./pictures/"

def visfile(file):
    splt = file.split("/")
    splt.reverse()
    name = splt[0]
    name = name[0:-4]
    with open(file, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
        sp = list(spamreader)
        fig, ax = plt.subplots()
        ax.plot([float(x[0]) for x in sp], [float(x[1]) for x in sp], color='g')
        ax.plot([float(x[0]) for x in sp], [float(x[2]) for x in sp], color='blue')
        ax.plot([float(x[0]) for x in sp], [float(x[3]) for x in sp], color='red')
        ax.set_xlabel('Generations')
        ax.set_ylabel('Fitness Values')
        ax.set_title('Evolution of fitness over Generations')
        plt.savefig(pic+name,bbox_inches='tight')


def boxplotFolder(folder):
        files = [folder+f for f in listdir(folder) if isfile(join(folder, f))]
        randomFile = random.choice(files)
        visfile(randomFile)
        data = []
        for file in files:
            with open(file, newline='') as csvfile:
                spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
                sp = list(spamreader)
                data.append(float(sp[len(sp)-1][1]))

        red_square = dict(markerfacecolor='r', marker='s')
        fig, ax = plt.subplots()
        name = folder.split("/")[2]
        ax.set_title(name)
        ax.boxplot(data, vert=False, flierprops=red_square)
        plt.savefig(pic+name,bbox_inches='tight')




def run():
    subfolders = [f.path+"/" for f in os.scandir("./data") if f.is_dir() ]
    #subfoldernames = [f.name for f in os.scandir("./data") if f.is_dir() ]
    for folder in subfolders:
        print("Plotting " + folder)
        boxplotFolder(folder)

run()
