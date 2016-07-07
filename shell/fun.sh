parse_args()
{
    echo "Parsing arguments:" $0 $1 $2 $3 $4 $5
    BUILD_CLEAN=0
    BUILD_CONFIGURE=0
    BUILD_NOENCRYPT=0
    BUILD_NOPASS=0
    BUILD_ATTPASS=0
    BUILD_CISCOPASS=0
    BUILD_HELP=0
	BUILD_CONTINUE=0
    while [ $# -ge 1 ]; do
        case $1 in
        -clean) 
            echo "+clean"
            BUILD_CLEAN=1;;
        -configure) 
            echo "+configure"
            BUILD_CONFIGURE=1;;
        -noencrypt) 
            echo "+noencrypt"
            BUILD_NOENCRYPT=1;;
        -nopass) 
            echo "+nopass"
            BUILD_NOPASS=1;;
        -attpass) 
            echo "+attpass"
            BUILD_ATTPASS=1;;
        -ciscopass) 
            echo "+ciscopass"
            BUILD_CISCOPASS=1;;
        -continue) 
            echo "+continue"
            BUILD_CONTINUE=1;;
        *)
            BUILD_HELP=1
            build_help
			break;;
        esac
        shift
    done
}

build_help()
{
    echo "Usage: $0 [-clean | -configure | -noencrypt ]"
    echo "          [ -nopass | -attpass | -ciscopass ]"
    echo "          [ -continue ]"
    echo
    echo "-clean: clean all binary and object files."
    echo "-configure: make all packages and generate firmware."
    echo "-noencrypt: not to encrypt shell scripts."
    echo "-nopass: no login password."
    echo "-attpass: use AT&T login password. (default)"
    echo "-ciscopass: use Cisco login password."
	echo "-continue: do not stop after the first error."
    echo 
}

test()
{
	echo "this is a test $1 and $2"
	TT=500
	echo "this is number $$"
}
parse_args $@
test ad abynes
adam=50
echo ${adam}
echo ${TT}
	echo "this is number $$"
