#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Erro: informe pelo menos um serviço."
    echo "Uso: ./check-services.sh <serviço1> <serviço2> ..."
    exit 1
fi

errors=0

for service in "$@"; do

    echo "Verificando: $service"

    if ! systemctl cat "$service" >/dev/null 2>&1; then
        echo "ERRO: $service não existe."
        errors=1

    elif systemctl is-active --quiet "$service"; then
        echo "OK: $service está funcionando."

    else
        echo "AVISO: $service está inativo."
        errors=1
    fi

    echo ""

done

exit $errors
