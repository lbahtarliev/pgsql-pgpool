#!/usr/bin/env python
# -*- coding: utf-8 -*-
from os import environ as oe
from os import system as osys
import psycopg2
import psycopg2.extras
import sqlalchemy
from pprint import pprint as pp
from tabulate import tabulate

# DB Conf
DB_CONF = {
    'type': oe.get('DB_TYPE', 'postgresql'),
    'user': oe.get('DB_USER', 'postgres'),
    'pass': oe.get('DB_PASS', 'postgres'),
    'name': oe.get('DB_NAME', 'postgres'),
    'host': oe.get('DB_HOST', '127.0.0.1'),
    'port': oe.get('DB_PORT', '55432'),
}
# SQLAlchemy Conf
# PostgreSQL
SQLALCHEMY_DATABASE_URI = '{type}+psycopg2://{user}:{pass}@{host}:{port}/{name}'.format(**DB_CONF)
DB_CONNECTION_STRING = 'host={host} port={port} dbname={name} user={user} password={pass}'.format(**DB_CONF)

dbConn = psycopg2.connect(DB_CONNECTION_STRING)
cur = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)

qsql = []
#qsql.append("show pool_nodes;")
qsql.append("select pid, usesysid, usename, state_change, wait_event_type, wait_event, state, backend_type from pg_stat_activity;")
qsql.append("select * from pg_replication_slots;")
qsql.append("select pid,status,last_msg_send_time,last_msg_receipt_time,latest_end_time,slot_name from pg_stat_wal_receiver;")
qsql.append("select checkpoints_timed,checkpoints_req,checkpoint_write_time,checkpoint_sync_time,buffers_checkpoint,buffers_alloc,stats_reset from pg_stat_bgwriter;")
qsql.append("select pid,usename,application_name,client_addr,client_hostname,client_port,backend_start,state,sync_state from pg_stat_replication;")

def get_info(qsql):
    cur.execute(qsql)
    res = cur.fetchall()
    odata = []
    for row in res:
        odata.append(dict(row.items()))
    print(tabulate(odata, headers="keys", tablefmt="fancy_grid"))


osys('clear')

for q in qsql:
    print("")
    get_info(q)
    print("")
