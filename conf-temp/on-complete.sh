#!/bin/sh
echo "setting permission for downloaded files"
chown -R "$UID":"$GID" /aria2/downloads > /dev/null 2>&1
