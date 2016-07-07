#!/bin/sh
#lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/"> filenametags
#find . -not -regex '.*\.\(png\|gif\|bin\|pem\|mcb\)' -type f -printf "%f\t%p\t1\n" | grep -E -v "user/opensource|\./opensource" | sort -f>> filenametags
find . -not -regex '.*\.\(png\|gif\|bin\|pem\|mcb\)' -type f -printf "%f\t%p\t1\n" |  sort -f>> filenametags
