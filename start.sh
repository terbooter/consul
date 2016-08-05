#!/bin/bash
echo Gettip my IP ...;
curl 'https://api.ipify.org' > /ip;
echo My IP is $(cat /ip);

if [[ -n $CONSUL_RUN_MODE ]]
then

  BASE_COMMAND="consul agent -config-file /conf.json -advertise $(cat /ip)"

  if [[ $CONSUL_RUN_MODE == "BOOTSTRAP" ]]
  then
    echo "BOOTSTRAP"
    echo "$BASE_COMMAND -bootstrap -server -ui";
    eval "$BASE_COMMAND -bootstrap -server -ui";
    exit
  elif [[ $CONSUL_RUN_MODE == "SERVER" ]]
  then
    echo "SERVER"
    echo "$BASE_COMMAND -server -join $JOIN_IP";
    eval "$BASE_COMMAND -server -join $JOIN_IP";
    exit
  else
    echo "AGENT"
    echo "$BASE_COMMAND -join $JOIN_IP";
    eval "$BASE_COMMAND -join $JOIN_IP";
    exit
  fi
else
  echo -e "CONSUL_RUN_MODE not set\n"
fi