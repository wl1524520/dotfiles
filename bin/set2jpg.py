#!/usr/bin/env python
# -*- coding:utf-8 -*-

'''
requirements: Pillow（PIL）
'''

import os
import sys

from PIL import Image

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print('usage: ' + sys.argv[0] + " format")
        print('e.g. : ' + sys.argv[0] + " png")
        sys.exit(1)

    img_format = sys.argv[1]

    files = os.listdir(os.getcwd())
    for filename in files:
        if img_format.lower() == filename.split('.')[-1].lower():
            img = Image.open(filename)
            newfilename = filename.split('.')[0] + '.jpg'
            img.save(newfilename)
            print('convert ' + filename + ' to ' + newfilename + ' success')
