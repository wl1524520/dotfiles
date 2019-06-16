#!/usr/bin/env python
# -*- coding:utf-8 -*-

'''
requirements: Pillow（PIL）
'''

import os
import sys

from PIL import Image

# 重新设置图片大小
def resize_img(width, filename):
    newdir = "size_" + str(width)
    if not os.path.exists(newdir):
        os.mkdir(newdir)
    img = Image.open(filename)
    (x, y) = img.size

    x_s = width
    y_s = int(y * x_s / x)

    out = img.resize((x_s, y_s), Image.ANTIALIAS)
    out.save(newdir + '/' + filename, 'jpeg');


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print('usage: ' + sys.argv[0] + " width(px)")
        print('e.g. : ' + sys.argv[0] + " 1000")
        sys.exit(1)

    files = os.listdir(os.getcwd())
    for filename in files:
        if 'jpg' == filename.split('.')[-1].lower():
            resize_img(int(sys.argv[1]), filename)
            print('resize ' + filename + ' success')
