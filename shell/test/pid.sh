echo "the pid of father is $$"

function run()
{
echo function "The main pid is $$"
echo function "The subshell pid is $BASHPID"
echo function "The level of shell is $BASH_SUBSHELL" 
}

run&
#bash pidc.sh
#./pidc.sh&
#bash pidc.sh
echo "end of print"
