#!/bin/bash
config_path="$SNAP""/etc/mc-as-a-service.json"
server_path="`cat "$config_path" | jq -r '.launcher.server_path | @sh' | sed "s/^'//" | sed "s/'$//"`"
cat $server_path"/logs/latest.txt"
cat $server_path"/outpipe" | sed '/.*/d'
while true; do
    cat $server_path"/outpipe"
    sleep 0.1
done