#! /bin/sh
# Execute command by failover.
# special values:  %d = node id
#                  %h = host name
#                  %p = port number
#                  %D = database cluster path
#                  %m = new master node id
#                  %M = old master node id
#                  %H = new master node host name
#                  %P = old primary node id
#                  %R = new master database cluster path
#                  %r = new master port number
#                  %% = '%' character
failed_node_id=$1
failed_host_name=$2
failed_port=$3
failed_db_cluster=$4
new_master_id=$5
old_master_id=$6
new_master_host_name=$7
old_primary_node_id=$8
new_master_port_number=$9
new_master_db_cluster=${10}
mydir=/var/lib/pgsql/10
log=$mydir/log/failover.log
pg_ctl=/usr/pgsql-10/bin/pg_ctl
cluster0=$mydir/data0
cluster1=$mydir/data1
cluster2=$mydir/data2
PCP_PORT=11001
export PCPPASSFILE=/var/lib/pgsql/10/pcppass
date >> $log
echo "failed_node_id $failed_node_id failed_host_name $failed_host_name failed_port $failed_port failed_db_cluster $failed_db_cluster new_master_id $new_master_id old_master_id $old_master_id new_master_host_name $new_master_host_name old_primary_node_id $old_primary_node_id new_master_port_number $new_master_port_number new_master_db_cluster $new_master_db_cluster" >> $log

# Stop standby node if it's running
if $pg_ctl -D $failed_db_cluster status|grep "is running" >/dev/null 2>&1
then
	$pg_ctl -w -m f -D $failed_db_cluster stop >> $log 2>&1
	sleep 10
	# recovery the node
	pcp_recovery_node -w -h localhost -p $PCP_PORT -n $failed_node_id >> $log 2>&1
else
	echo "$failed_db_cluster is not running. skipping follow master command." >> $log
fi
