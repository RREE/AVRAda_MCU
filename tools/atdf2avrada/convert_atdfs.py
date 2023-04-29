#! /usr/bin/env python

from __future__ import print_function
import sys
import os
import atdf2avrada

if __name__ == '__main__':
    in_path = sys.argv[1]
    out_path = sys.argv[2]

    for file_name in os.listdir (in_path):
        file_path = os.path.join (in_path, file_name)
        _, file_extension = os.path.splitext(file_path)
        if os.path.isfile (file_path) and file_extension.lower () == '.atdf':
            print("Generate", file_path)
            atdf2avrada.convert (file_path, sys.argv[2])
