#!/bin/bash

if systemctl is-active --quiet ssh; then
    echo "SSH está funcionando"
else
    echo "ALERTA: SSH está parado"
fi
