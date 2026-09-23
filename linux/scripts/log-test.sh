#!/bin/bash

echo "$(date) - Script iniciado" >> script.log
echo "$(date) - Verificando SSH" >> script.log

if systemctl is-active --quiet ssh; then
   echo "$(date) - SSH ok" >> script.log

else
   echo "$(date) - ALERTA: SSH parado" >> script.log
fi

echo "$(date) - Script finalizado" >> script.log

