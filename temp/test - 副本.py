#coding=utf-8

import numpy
import struct
import Image
import os, sys, shutil

#设置处理当前路径
path = ".";

im = Image.open("elf0.png")

#保存为jpg
im.save("elf0.jpg")
#获取原图片的alpha通道
a = im.split()[3]

#创建mask参考图
mask = Image.new("RGBA", (2048, 2048), (0, 0, 0))
#获取mask的rgb值
r = mask.split()[0]
g = mask.split()[1]
b = mask.split()[2]
#合并原图片的alpha通道到mask
mask = Image.merge("RGBA", (r, g, b, a))
#输出mask
mask.save("elf0_mask.jpg")

dataFile = open("elf0.data", "wb")

arr = numpy.asarray(a)
print arr
for i in range(0, a.size[0]-1):
    for j in range(0, a.size[1]-1):
        value = arr[j][i]
        #print value
        dataFile.write(arr[j][i])

#len = a.size[0] * a.size[1]
#buffer = struct.pack("<%ds"%len, arr)

dataFile.close()
