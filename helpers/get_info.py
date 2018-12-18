#!/usr/bin/env python
# -*- coding: utf-8 -*-
from os import environ as oe
from os import system as osys
import psycopg2
import psycopg2.extras
import sqlalchemy
from pprint import pprint as pp
from tabulate import tabulate
from colored import fore, back, style

# DB Conf
DB_CONF = {
    'type': oe.get('DB_TYPE', 'postgresql'),
    'user': oe.get('DB_USER', 'postgres'),
    'pass': oe.get('DB_PASS', 'postgres'),
    'name': oe.get('DB_NAME', 'postgres'),
    'host': oe.get('DB_HOST', '127.0.0.1'),
    'port': oe.get('DB_PORT', '55432'),
    'gport': oe.get('DB_GPORT', '5432'),
}
# SQLAlchemy Conf
DB_CONNECTION_STRING = 'host={host} port={port} dbname={name} user={user} password={pass}'.format(**DB_CONF)
G_DB_CONNECTION_STRING = 'host={host} port={gport} dbname={name} user={user} password={pass}'.format(**DB_CONF)

dbConn = psycopg2.connect(DB_CONNECTION_STRING, cursor_factory = psycopg2.extras.DictCursor)
G_dbConn = psycopg2.connect(G_DB_CONNECTION_STRING, cursor_factory = psycopg2.extras.DictCursor)
cur = dbConn.cursor()
G_cur = G_dbConn.cursor()

qsql = []
# Pool Nodes' Status
qsql.append("select checkpoints_timed,checkpoints_req,checkpoint_write_time,checkpoint_sync_time,buffers_checkpoint,buffers_alloc,stats_reset from pg_stat_bgwriter;")
qsql.append("select pid,status,last_msg_send_time,last_msg_receipt_time,latest_end_time,slot_name from pg_stat_wal_receiver;")
qsql.append("select pid,usename,application_name,client_addr,client_hostname,client_port,backend_start,state,sync_state from pg_stat_replication;")
qsql.append("show pool_nodes;")
# Get only active PostgreSQL tasks
#qsql.append("select pid, usesysid, usename, state_change, wait_event_type, wait_event, state, backend_type from pg_stat_activity WHERE state = 'active';")
# Get all PostgreSQL tasks activity
qsql.append("select pid, usesysid, usename, state_change, wait_event_type, wait_event, state, backend_type from pg_stat_activity;")
#qsql.append("select * from pg_replication_slots;")

def get_info(qsql):
    for idx, q in enumerate(qsql):
        if idx == 3:
            G_cur.execute(q)
            res = G_cur.fetchall()
        else:
            cur.execute(q)
            res = cur.fetchall()
        odata = []
        for row in res:
            odata.append(dict(row.items()))
        tdata = list(tabulate(odata, headers="keys", tablefmt="fancy_grid").split("\n"))
        #print("")
        #print("List length: ", len(tdata))
        for idx, line in enumerate(tdata):
            if idx in [1]:
                print(fore.BLACK + back.WHITE + style.BOLD + line + style.RESET)
            else:
                if "down" in line:
                    print(fore.RED + back.BLACK + style.BOLD + line + style.RESET)
                elif "primary" in line or "streaming" in line or "active" in line or "True" in line:
                    print(fore.GREEN + back.BLACK + line + style.RESET)
                elif "standby" in line or "idle" in line:
                    print(fore.YELLOW + back.BLACK + line + style.RESET)
                else:
                    print(fore.BLUE + back.BLACK + line + style.RESET)
        #print("")


if __name__ == '__main__':
    osys('clear')
    get_info(qsql)
