#!/bin/bash
PGPOOL_INSTALL_DIR="/usr"
PGBIN="/usr/pgsql-10/bin"
PGLIB="/usr/pgsql-10/lib"
PGSOCKET_DIR="/var/run/postgresql"
USE_REPLICATION_SLOT="true"
USE_PG_REWIND="false"

psql="$PGBIN/psql"
pport="5432"
sport="55432"
pargs="-c"

clear
$psql -q -p $pport $pargs "show pool_nodes" postgres
echo "------------------------------------------------------------------------------------------"
$psql -q -p $sport $pargs "select pid, usesysid, usename, state_change, wait_event_type, wait_event, \
state, backend_type from pg_stat_activity;" postgres
echo "------------------------------------------------------------------------------------------"
$psql -q -p $sport $pargs "select * from pg_replication_slots;"
echo "------------------------------------------------------------------------------------------"
$psql -t -q -p $sport $pargs "select pid,status,last_msg_send_time,last_msg_receipt_time,latest_end_time,slot_name from pg_stat_wal_receiver;"
echo "------------------------------------------------------------------------------------------"
$psql -t -q -p $sport $pargs "select checkpoints_timed,checkpoints_req,checkpoint_write_time, \
checkpoint_sync_time,buffers_checkpoint,buffers_alloc,stats_reset from pg_stat_bgwriter;"
echo "------------------------------------------------------------------------------------------"
$psql -t -q -p $sport $pargs "select pid,usesysid,usename,application_name,client_addr,client_hostname, \
client_port,backend_start,state,sync_priority,sync_state from pg_stat_replication;"
echo "------------------------------------------------------------------------------------------"
#select * from pg_stat_progress_vacuum;
#select * from pg_stat_archiver;
