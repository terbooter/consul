#!/bin/sh
echo Gettip my IP ...;
curl 'https://api.ipify.org' > /ip;
echo My IP is $(cat /ip);
consul agent -config-file /conf.json -advertise $(cat /ip) -bootstrap -server -ui-dir=/consul/ui;
