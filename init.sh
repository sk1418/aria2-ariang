#!/bin/sh
conf="/aria2/conf/aria2.conf"
session="/aria2/conf/aria2.session"
download="/aria2/downloads"

if [ ! -f "$conf" ]; then
        cp /aria2/conf-temp/aria2.conf "$conf"
        if [ "$SECRET" ]; then
                echo "rpc-secret=$SECRET" >> "$conf"
        fi
fi
if [ ! -f /aria2/conf/on-complete.sh ]; then
        cp /aria2/conf-temp/on-complete.sh /aria2/conf/on-complete.sh
fi

if [ ! -f "$session" ]; then
        touch "$session"
fi

chmod +x /aria2/conf/on-complete.sh
/aria2/conf/on-complete.sh
echo "starting aria-ng on port 80.."
darkhttpd /aria-ng --port 80 &
echo "starting downloaded http access on 8080..."
darkhttpd "$download" --port 8080 &
exec aria2c --conf-path=$conf
