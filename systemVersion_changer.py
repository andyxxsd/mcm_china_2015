#! /usr/bin/env python

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('param')
args = parser.parse_args(['10.10.5'])
args = parser.parse_args()

first = '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n<plist version="1.0">\n<dict>\n\t<key>ProductBuildVersion</key>\n\t<string>14F27</string>\n\t<key>ProductCopyright</key>\n\t<string>1983-2015 Apple Inc.</string>\n\t<key>ProductName</key>\n\t<string>Mac OS X</string>\n\t<key>ProductUserVisibleVersion</key>\n\t<string>10.10.5</string>\n\t<key>ProductVersion</key>\n\t<string>'
second = '</string>\n</dict>\n</plist>\n'

print(args.param)
target = open('/System/Library/CoreServices/SystemVersion.plist', 'w').write(first+args.param+second)