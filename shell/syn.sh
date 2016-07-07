#echo "$#"
#echo $0
if [ "$#" == "0" ];then
echo "please enter one action parameter"
else
if [ "$1" == "push" ];then
scp ~/.vimrc zheta@sn-crdc-build1:~/.vimrc<<!
!
elif [ "$1" == "pull" ];then
scp zheat@sn-crdc-build1:~/.vimrc ~/.vimrc
else
echo "enter the pull or push"
fi
fi
cp -r ~/shell/ ~/shellbackup
