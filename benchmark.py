#!/usr/bin/env python3

import sys

if len(sys.argv) <= 1:
    print('No arguments supplied.')
    exit()

def main():
    '''
    Main function
    '''
    for turn in range(0, 5):
        print('test', turn)



if __name__ == '__main__':
    main()
