#!/bin/bash

while true; do

    if systemctl is-active --quiet ssh; then
        echo "$(date '+%H:%M:%S') - OK: SSH está funcionando."
    else
        echo "$(date '+%H:%M:%S') - ALERTA: SSH está parado."
    fi

    sleep 5

done

