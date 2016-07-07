~/shell/tagfiles.sh $1
ctags -L ./tagfiles -R 
~/shell/namelist.sh $1
cscope  -bqkR -inamelist
~/shell/lookUpFiles.sh $1
