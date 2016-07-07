#!/bin/bash

set -x

#Kill any Qemu/VM launched
pkill -9 qemu

#Kill all the OVS process running
pkill -9 ovs 

#Clear theOVS files created
rm -rf /usr/local/var/run/openvswitch 
rm -rf /usr/local/etc/openvswitch/ 
rm -f /usr/local/etc/openvswitch/conf.db

#Create the OVS directories
mkdir -p /usr/local/etc/openvswitch 
mkdir -p /usr/local/var/run/openvswitch

#Clear any hugepage files
rm -rf /dev/hugepages/*

#Create OVS DB file from default schema
ovsdb-tool create /usr/local/etc/openvswitch/conf.db  \
             /usr/local/share/openvswitch/vswitch.ovsschema

sleep 1
#Start OVSDB Server
ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile --detach

sleep 1

#Initialize DB
ovs-vsctl --no-wait init
sleep 1

#Start ovs-vswitchd
export DB_SOCK=/usr/local/var/run/openvswitch/db.sock
taskset -c 18,19 ovs-vswitchd --dpdk -c 0xc0000 -n 4 --socket-mem 0,2048 --huge-dir=/mnt/huge_1G -- unix:$DB_SOCK
#taskset -c 18 ovs-vswitchd --dpdk -c 0x40000 -n 4 --socket-mem 0,2048 -- unix:$DB_SOCK
#ovs-vswitchd unix:$DB_SOCK

