for i in ./*.sh; do
	echo $i
	subsys=${i/etc/rc$runlevel.d/K??}
	echo $0
	echo $adam
done
