#!/usr/bin/env python3

import sys, os, re

def print_usage():
    print("""Usage:
    %s [MODULE_NAME] [PATH_TO_MK_FILE]
    """%sys.argv[0])
    
def is_include(line):
    
    
def split_file(mk_path):
    print("File...")
    with open(mk_path) as mk_file:
        for line in mk_file:
            if ':=' in line:
                (prop, value) = line.split(':=')
                print("Property: %s, Value: %s"%(prop, value))
                
            if (match = re.match('include $\('
        mk_file.close()
    return

def main():
    if len(sys.argv) != 3:
        print_usage()
        sys.exit(0)
    mk_path = sys.argv[2]
    split_file(mk_path)
    
if __name__=="__main__":
    main()