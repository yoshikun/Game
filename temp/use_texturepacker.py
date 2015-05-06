# -*- coding: cp936 -*-
import os,sys,shutil
from biplist import *
animationDir = '.'
outplistdir = '.'
comend = 'TexturePacker'
print "animationDir = %s \noutdir = " % animationDir, outplistdir
animationList = os.listdir(animationDir)
print "have %d animation convert" % len(animationList)

if os.path.isdir(animationDir):
	imageList = os.listdir(animationDir)

	for im in range(len(imageList)):
	  name = str(imageList[im])
	  if os.path.splitext(name)[1] == '.png':
		print "handle " + name
		allImage = animationDir + os.sep + name
		cmdtmp = comend + " " + allImage +\
				 " --sheet " + outplistdir + os.sep + os.path.splitext(name)[0] + ".pvr.ccz"\
				 " --opt RGBA4444"\
				 " --shape-padding 0"\
				 " --border-padding 0"\
				 " --dither-fs-alpha"\
				 " --size-constraints AnySize"\
				 " --disable-rotation "\
				 " --trim-mode None"
				 #" --data " + outplistdir + os.sep + os.path.splitext(name)[0] + ".plist"\
				 #" --opt RGBA4444 --dither-fs-alpha --content-protection \
				 #  19e5c826f732e5325e58d0c52488c7ac"
		os.system(cmdtmp)
		print(cmdtmp)
		
	for im in range(len(imageList)):
	  name = str(imageList[im])
	  if os.path.splitext(name)[1] == ".plist":
		plist = readPlist(name)
		#分离文件名和扩展名
		if os.path.splitext(plist["metadata"]["textureFileName"])[1] == ".png":
			plist["metadata"]["textureFileName"] = os.path.splitext(plist["metadata"]["textureFileName"])[0] + ".pvr.ccz"
			plist["metadata"]["realTextureFileName"] = os.path.splitext(plist["metadata"]["realTextureFileName"])[0] + ".pvr.ccz"
			print plist["metadata"]["textureFileName"]
			writePlist(plist, name, False)