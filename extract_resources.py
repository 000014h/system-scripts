#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
===============================================================================
리눅스용 Rundeck Node 정보 추출 프로그램

author: harakhti@smilegate.com
date: 2016-03-21
result: <HOSTNAME>.json
===============================================================================
"""


import os
import json
import pprint

description = raw_input("Description <ENGLISH ONLY!>: ")
tags = raw_input("Tags <ENGLISH ONLY!>: ")
name = os.environ['COMPUTERNAME'].lower()
hostname = os.environ['COMPUTERNAME'].lower()
os_arch = os.environ['PROCESSOR_ARCHITEW6432'].upper()
os_family = os.environ['OS'].upper()
# username = os.environ['USERNAME'] + '@' + os.environ['USERDNSDOMAIN']
username = 'rundeck' + '@' + os.environ['USERDNSDOMAIN']

node = {
    "description":description,
    "hostname":hostname,
    "name":name,
    "osArch":os_arch,
    "osFamily":os_family,
    "tags":tags,    
    "username":username
}

context = json.dumps(node, sort_keys=True, indent=4, separators=(',',':'))
print context
context_data = json.loads(context)
# print context_data

with open(hostname+'.json', 'w') as file:        
     json.dump(context_data, file, indent=4, separators=(',',':'), sort_keys=True)
