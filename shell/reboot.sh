#!/usr/bin/bash
case $1 in
    start)
	sudo systemctl enable smb nmb
	sudo systemctl start smb nmb
	#sudo systemctl start vncserver@:10.service
        ;;
    restart)
	sudo systemctl restart vncserver@:10.service
        ;;
esac

