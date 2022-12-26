#!/bin/bash
set -e

rm -f /liff-app/tmp/pids/server.pid

exec "$@"