#!/bin/bash

# 1. Validação de argumento
if [ $# -eq 0 ]; then
    echo "Erro: informe o nome do serviço."
    echo ""
    echo "Uso:"
    echo "./check-service.sh <serviço>"
    exit 1
fi

service=$1

# 2. Verificar se o serviço existe
if ! systemctl cat "$service" >/dev/null 2>&1; then
    echo "Erro: serviço '$service' não existe."
    exit 3
fi

echo "Verificando serviço: $service"

# 3. Verificar se o serviço está ativo
if systemctl is-active --quiet "$service"; then
    echo "Sucesso: O serviço $service está funcionando!"
    exit 0
else
    echo "Aviso: O serviço $service está inativo."
    exit 2
fi
