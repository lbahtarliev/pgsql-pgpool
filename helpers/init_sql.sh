#!/bin/bash
psql template1 2>&1 <<EOF
CREATE EXTENSION pgpool_regclass;
CREATE EXTENSION pgpool_recovery;
CREATE DATABASE test;
EOF
