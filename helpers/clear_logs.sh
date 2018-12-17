#!/bin/bash
set -x
cp -v /dev/null log/recovery.log
cp -v /dev/null log/pgpool.log
cp -v /dev/null log/failover.log
rm -rfv data{0,1}/log/*
