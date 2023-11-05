#!/bin/bash

vec=$(shuf -n 1 /home/vavookeys)

curl -k --location --request POST 'https://www.vavoo.tv/api/box/ping2' --header 'Content-Type: application/json' --data "{\"vec\": \"$vec\"}" | sed 's#^.*"signed":"##' | sed "s#\"}}##g" | sed 's/".*//' > /home/authkey
exit 0
