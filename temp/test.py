#coding=utf-8

import Image
import os, sys, shutil

PNG = ".png"
JPG = ".jpg"
DATA = ".data"
MASK = "_mask"
RES = "_res"

#设置处理当前路径
path = ".";
#path = os.path.abspath(".")
total = len(os.listdir(path))

print "Start decode %s" % path

if os.path.isdir(path):
    pngList = os.listdir(path)
    for index in range(len(pngList)):
        #获取原图片
        name = pngList[index]
        
        head = os.path.splitext(name)[0]
        suffix = os.path.splitext(name)[1]

        if suffix == PNG:
            ################################################################
            #拆分测试
            ################################################################
            
            im = Image.open(name)
            #print(im.format,im.size,im.mode)
            #保存为jpg
            im.save(head + JPG)
            #获取原图片的alpha通道
            a = im.split()[3]

            #创建mask
            mask = Image.new("RGBA", (2048, 2048), (0, 0, 0))
            #获取mask的rgb值
            r = mask.split()[0]
            g = mask.split()[1]
            b = mask.split()[2]
            #合并原图片的alpha通道到mask
            mask = Image.merge("RGBA", (r, g, b, a))
            #输出mask
            mask.save(head + MASK + PNG)
            print "Decode \"%s\" complete" % name

            break

            ################################################################
            #合并测试
            ################################################################

            #导入需要处理的jpg
            im = Image.open(head + JPG)
            r, g, b = im.split()
            #导入需要处理的mask
            mask = Image.open(head + MASK + PNG)
            #分离mask的通道
            a = mask.split()[3]
            #合并通道
            im = Image.merge("RGBA", (r, g, b, a))
            #输出
            im.save(head + RES + PNG)
            print "Encode complete"

