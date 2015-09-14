#! /usr/bin/env python

import argparse
import math

parse = argparse.ArgumentParser()
parse.add_argument('latitude')
parse.add_argument('longitude')
args = parse.parse_args()

latitude = float(args.latitude)
longitude = float(args.longitude)

print str(latitude * 180 / math.pi) + ', ' + str(-longitude * 180 / math.pi)