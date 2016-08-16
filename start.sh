#!/bin/bash

if [[ -z $PARAMS ]]
then
    echo "!!! CONFIGURATION ERROR !!!";
    echo "SET PARAMS env variable";
    exit 1;
fi

echo Gettip my IP ...;
curl 'https://api.ipify.org' > /ip;
export PUBLIC_IP=$(cat /ip)

echo "consul agent -config-file /conf.json $PARAMS";
eval "consul agent -config-file /conf.json $PARAMS";
