#!/bin/bash

ovs-vsctl set Open_vSwitch . other_config:pmd-cpu-mask=0xc0000
#ovs-vsctl set Open_vSwitch . other_config:pmd-cpu-mask=0x40000

# Add the 2 physical ports & Create the bridge
ovs-vsctl add-br ovsbr0 -- set bridge ovsbr0 datapath_type=netdev
ovs-vsctl add-port ovsbr0 dpdk0 -- set Interface dpdk0 type=dpdk
ovs-vsctl add-port ovsbr0 dpdk1 -- set Interface dpdk1 type=dpdk
sleep 1

ovs-vsctl add-port ovsbr0 vhost-user-1 -- set Interface vhost-user-1 type=dpdkvhostuser
#ovs-vsctl add-port ovsbr0 vhost-user-2 -- set Interface vhost-user-2 type=dpdkvhostuser

ovs-ofctl add-flow ovsbr0 "in_port=1,actions=output:2"
ovs-ofctl add-flow ovsbr0 "in_port=2,actions=output:1"

exit


ovs-ofctl del-flows ovsbr0

ovs-vsctl get interface vhost-user-1 statistics

ovsdb-client dump

# globally?
ovs-vsctl set Open_vSwitch . other_config:n-dpdk-rxqs=<integer>
