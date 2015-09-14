#! /usr/bin/env python
# -*- coding: utf-8 -*-

import Image
import subprocess
import argparse
import os
import math
from PIL import Image, ImageDraw, ImageChops

parser = argparse.ArgumentParser(description='Automatic shdaow trace anaysis')
parser.add_argument('action')
args = parser.parse_args()

video_addr = '/Users/skylarzheng/playground/shumo2015/problem set/A/Appendix_4.avi'
screen_shot_addr = 'data/screen_shots'
screen_shot_fmt = 'img%03d.tiff'
bw_addr = 'data/bw'
interval = 60
xoffset = 870
yoffset = 800
black_white_seperater = 210
flood_fill_sensitivity = 20
# In real world meter
stick_length = 2
# Only display block greater
block_filter = 400

# The centre point of the base of stick
magic_point = (86.5, 0)
# The length of stick in pixel
magic_length = 886.5 - 204
# The real world time in the beginning of this video
magic_beginning_time = 8. + 54./60 + 36./3600

def dist(a, b):
	'''
		Distence computer
	'''
	return math.sqrt((a[0]-b[0])**2 + (a[1]-b[1])**2)

def clearSpots(image, G, out, cases):
	class Block:
		'''
			Color block (it's gray though)
		'''
		no = 0
		left_point = (0, image.size[0])
		right_point = (0, -1)
		def __init__(self, no):
			self.no = no

		@property
		def length(self):
			return self.right_point[1] - self.left_point[1]

		def __repr__(self):
			return self.__str__()

		def __str__(self):
			return "no: %d left_point: %s right_point: %s length: %s" % (self.no, self.left_point, self.right_point, self.length)

	def label(x, y, cnt):
		'''
			Label the (x, y) pixel is belong to block <cnt>
		'''
		block[x][y] = cnt
		if border[cnt].left_point[1] > y:
			border[cnt].left_point = (x, y)
		if border[cnt].right_point[1] < y:
			border[cnt].right_point = (x, y)

	def bfs(data, x, y, G, cnt):
		'''
			Easy programming
		'''
		ini = data[y, x]
		label(x, y, cnt)
		queue = [(x, y)]
		while len(queue):
			x, y = queue.pop(0)
			if x>0 and block[x-1][y] == 0 and abs(ini - data[y, x-1]) < G:
				label(x-1, y, cnt)
				queue.append((x-1, y))
			if y>0 and block[x][y-1] == 0 and abs(ini - data[y-1, x]) < G:
				label(x, y-1, cnt)
				queue.append((x, y-1))
			if x<image.size[1]-1 and block[x+1][y] == 0 and abs(ini - data[y, x+1]) < G:
				label(x+1, y, cnt)
				queue.append((x+1, y))
			if y<image.size[0]-1 and block[x][y+1] == 0 and abs(ini - data[y+1, x]) < G:
				label(x, y+1, cnt)
				queue.append((x, y+1))

	def output(cnt):
		'''
			Pick the <cnt> block and return the image of it.
			Used for debugging
		'''
		new = Image.new('L', image.size)
		draw = ImageDraw.Draw(new)
		for i in xrange(0, image.size[1]):
			for j in xrange(0, image.size[0]):
				if block[i][j] == border[cnt].no:
					draw.point((j, i), 255)
		return new

	# malloc
	block = [0]*image.size[1]
	for i in xrange(image.size[1]):
		block[i] = [0]*image.size[0]

	# To skip block 0 which represente unprocessed cells
	border = [Block(0)]

	# Flood fill entrance
	data = image.load()
	cnt = 0
	for i in xrange(0, image.size[1]):
		for j in xrange(0, image.size[0]):
			if not block[i][j]:
				cnt += 1
				border.append(Block(cnt))
				bfs(data, i, j, G, cnt)

	# For debug and fun
	border = sorted(border, key=lambda x: x.length, reverse=True)
	for i in border:
		if i.length > block_filter:
			print i

	# Data output in specific way
	out.write(str(border[2].right_point[1]) + ' ' \
		+ str(border[2].right_point[0]) + ' ' \
		+ str(dist(border[2].right_point, magic_point)) + ' ' \
		+ str(magic_beginning_time + cases/interval) + ' ' \
		+ str(dist(border[2].right_point, magic_point)/magic_length*stick_length) + ' ' \
		+ '\n')
	return output(2)


def cut(image, xoffset, yoffset):
	'''
		Cut image to the bottom right cornor (which apply the problem's video)
	'''
	# There are annoying random pixels in the edge
	new = Image.new('L', (image.size[0]-xoffset-5, image.size[1]-yoffset-5))
	new_data = new.load()
	image_data = image.load()
	for i in xrange(xoffset, image.size[0]-5):
		for j in xrange(yoffset, image.size[1]-5):
			new_data[i-xoffset, j-yoffset] = image_data[i, j]
	return new

def bColor(image, G):
	'''
		Turn image into black and white (literally)
	'''
	data = image.load()
	new = Image.new('L', image.size)
	draw = ImageDraw.Draw(new)

	for x in xrange(0, image.size[0] - 1):
		for y in xrange(0, image.size[1] - 1):
			if data[x, y] > G:
				draw.point((x, y), 255)
			else:
				draw.point((x, y), 0)
	return new

def process():
	print '*******Calculating plz be patient...*******'
	out = open('t4_data.txt', 'w')
	img_addr = 'data/screen_shots'
	cases = 0.
	for img in os.listdir(img_addr):
		image = bColor(cut(Image.open(img_addr + '/' + img).convert("L"), xoffset, yoffset), black_white_seperater)
		image.save(bw_addr + '/' + img)
		clearSpots(image, flood_fill_sensitivity, out, cases).save('data/result/' + img)
		cases += 1
		print img + ' process successfully!'

'ffmpeg -i Appendix_4.avi -f image2 -pix_fmt gray -vf fps=fps=1/60 img%03d.tiff'
def capture():
	print '******Capturing screen shots, plz be patient...******'
	subprocess.call(['rm', '-rf', screen_shot_addr])
	subprocess.call(['mkdir', screen_shot_addr])
	subprocess.call(['ffmpeg', '-loglevel', '24', \
		'-i', video_addr, \
		'-f', 'image2', \
		'-pix_fmt', 'gray', \
		'-vf', 'fps=fps=1/%d' % interval, screen_shot_addr + '/' + screen_shot_fmt])

fun_dic = {
	'capture': capture(),
	'process': process(),
}

if args.action:
	fun_dic[args.action]
