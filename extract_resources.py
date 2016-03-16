#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Rundeck Node 추가를 위한 node resources data데이터 추출 프로그램

import os

name = raw_input("node name: ")
description = raw_input("description: ")
tags = raw_input("tags: ")
hostname = os.environ['COMPUTERNAME'].lower()
os_arch = os.environ['PROCESSOR_ARCHITEW6432'].upper()
os_family = os.environ['OS'].upper()
user_name = os.environ['USERNAME'] + '@' + os.environ['USERDNSDOMAIN']

line = '<node name="{0}" description="{1}" tags="{2}" hostname="{3}" osArch="{4}" osFamily="{5}" username="{6}"/>'.format(name, description, tags, hostname, os_arch, os_family, user_name)

filename = hostname+".xml"
print filename

print line
file = open(filename, "w")
file.writelines(line)
file.close()
