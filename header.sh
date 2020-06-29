#!/bin/bash
#Common variables used by all programs

export config_path="$SNAP_USER_DATA""/config/mc-as-a-service.json"

#make sure config directory exists
if [ ! -d "$SNAP_USER_DATA""/config" ]; then
    mkdir "$SNAP_USER_DATA""/config"
fi
#make sure config exists
if [ ! -f $config_path ]; then
    cp "$SNAP""/etc/default-config.json" "$config_path"
fi

export server_path="$SNAP_USER_DATA""`cat "$config_path" | jq -r '.launcher.server_path | @sh' | sed "s/^'//" | sed "s/'$//"`" 

#make sure server folder exists
if [ ! -d $server_path ]; then
    mkdir $server_path
fi

export jarfile_path="$SNAP_USER_DATA""$server_path""`cat "$config_path" | jq -r '.launcher.jarfile | @sh' | sed "s/^'//" | sed "s/'$//"`"
export eula_path="$server_path""/eula.txt"
export server_jar_path="$server_path""/server.jar"
export manifest_url="https://launchermeta.mojang.com/mc/game/version_manifest.json"
export in_pipe="$server_path""/inpipe"
export out_pipe="$server_path""/outpipe"