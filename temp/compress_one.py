#coding=utf-8

import numpy
import struct
import Image
import os, sys, shutil
import zipfile

#设置处理当前路径
path = ".";

im = Image.open("atlas.png")
im.save("atlas_data", "JPEG")
a = im.split()[3]

array = numpy.asarray(a, dtype=numpy.uint8)
mask = Image.fromarray(array)
mask.save("atlas_mask", "JPEG")

output = zipfile.ZipFile("atlas_compress.png", "w", zipfile.ZIP_DEFLATED)
output.write("atlas_data")
output.write("atlas_mask")
output.close()
