#!/usr/bin/env python

import re
import subprocess
import os
username=''
password=''
passfile  = open("test1.txt", "r")
ip = ''
flag = 1

for line in passfile:
    if re.match(".*Nmap scan.*", line) and flag:
            ip  = line.split(' ')[4]
            flag = 0

print ip
   # os.system("ssh"+" "+username+"@172.16.10.2")

