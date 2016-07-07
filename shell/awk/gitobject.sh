#!/bin/sh
find .git/objects -type f | ./gitobject.awk > hashfile
hash=`cat hashfile`
num=0
for i in $hash; do
	((num++))
	echo -----------the $num node is $i--------------------->>hashfile;
    git cat-file -p $i >>hashfile;
	echo -----------the $num node print end--------------------->>hashfile;
done
