#!/bin/bash

pcp_$1 -h localhost -p 5433 -w -v $2

exit 0
