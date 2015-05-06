#coding=utf-8

import numpy
import Image
import os, sys, shutil
import zipfile

PNG = ".png"
JPG = ".jpg"
DATA = "_data"
MASK = "_mask"
MERGE = "_merge"
COMPRESS = "_compress"

#设置处理当前路径
path = ".";
#path = os.path.abspath(".")
total = len(os.listdir(path))

print "Start decode total %d" % total

#检测当前文件夹
if os.path.isdir(path):
    #获取文件列表
    pngList = os.listdir(path)
    #遍历png
    for index in range(len(pngList)):
        #获取原图片
        name = pngList[index]
        #解析文件名
        head = os.path.splitext(name)[0]
        #解析文件后缀
        suffix = os.path.splitext(name)[1]

        if suffix == PNG and not(COMPRESS in head) and not(MERGE in head):
            
            ################################################################
            #拆分测试
            ################################################################
            
            im = Image.open(name)
            #获取原图片的通道
            r, g, b, a = im.split()
            #保存为jpg
            im.save(head + DATA, "JPEG")

            #生成灰度图
            array = numpy.asarray(a, dtype=numpy.uint8)
            output = Image.fromarray(array)
            output.save(head + MASK, "JPEG")

            #压缩
            output = zipfile.ZipFile(head + COMPRESS + PNG, "w", zipfile.ZIP_DEFLATED)
            output.write(head + DATA)
            output.write(head + MASK)
            output.close()
            print "Decode \"%s\" complete" % name

            ################################################################
            #合并测试
            ################################################################

            #导入需要处理的jpg
            im = Image.open(head + DATA)
            r, g, b = im.split()
            #导入需要处理的mask
            mask = Image.open(head + MASK)
            #分离mask的通道
            a = mask.split()[0]
            #合并通道
            im = Image.merge("RGBA", (r, g, b, a))
            #输出
            im.save(head + MERGE + PNG, "PNG")
            print "Encode \"%s\" complete" % name

            #os.remove(name)
            os.remove(head + DATA)
            os.remove(head + MASK)
            os.remove(head + MERGE + PNG)
