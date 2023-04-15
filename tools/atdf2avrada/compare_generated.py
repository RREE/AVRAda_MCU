#! /usr/bin/env python
#-*- coding: utf-8 -*-

from __future__ import print_function
import os

old_path = "./old"
new_path = "../../src"

def compare (old_path, new_path):
    with open (old_path) as f:
        old_raw = f.read ().split ("\n")
    if "with Interfaces;               use Interfaces;" not in old_raw:
        print ("Ignore: Old format")
        os.exit (1)
    with open (new_path) as f:
        new_raw = f.read ()
        new = new_raw.replace (" ", "").split ("\n")
    
    for line_raw in old_raw:
        line = line_raw.replace(" ", "")
        if not line or line.startswith ("--"):
            continue
        if line not in new:
            print (line_raw)


if __name__ == '__main__':
    import sys

    compare (sys.argv[1], sys.argv[2])
