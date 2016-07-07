#!/bin/sh
#lookupfile plugi
#echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> namelist
#find `pwd` -not -regex '.*\.\(png\|gif\|bin\|pem\|mcb\)' -type f -printf "%f\t%p\t1\n" | sort -f > namelist
#find `pwd` -regex '.*\.\(cpp\|c\|s\|h\|asm\|S\)' -type f -printf "%p\t\n" | grep -E -v "user/opensource|$1/opensource" | sort -f > namelist
find `pwd` -regex '.*\.\(cpp\|c\|s\|h\|asm\|S\)' -type f -printf "%p\t\n" |  sort -f > namelist
