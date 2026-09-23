#!/bin/bash

check_service() {

	local service=$1
	echo "Verificando: $service"
	
	if ! systemctl cat "$service" >/dev/null 2>&1; then
	    echo "ERRO: $service não existe."
	    return 3

	elif systemctl is-active --quiet "$service"; then
             echo "OK: $service está funcioando."
	     return 0

	else
	    echo "AViSO: $service está inativo."
	    return 2
	fi


}

if [ $# -eq 0 ]; then
   echo "Erro: informe pelo menos um serviço."
   echo "Uso: ./functions.sh <serviço1> <serviço2> ..."
   exit 1
fi

final_status=0

for service in "$@"; do
    check_service "$service"
    result=$?
    echo "Resultado: $result"
    echo ""
    if [ $result -ne 0 ]; then
       final_status=1
    fi
done

exit $final_status




