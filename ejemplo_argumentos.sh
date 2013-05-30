#!/bin/bash
#-u, -d y-p necesitan algo extra (ej. -d dir). -f no y los : iniciales es para el error
while getopts :u:d:p:f option
do
        case "${option}"
        in
                u) USER_=${OPTARG};;
		#El sigiente es un ejemplo para tomar todas las veces que se de un argumento -d
                d) DATE=$DATE${OPTARG}\ ;;
                p) PRODUCT=${OPTARG};;
		#-f no se supone que tome argumentos, aasi que format no tomaría nada de $OPTARG
                f) FORMAT="usast -f";;
		?) ERROR=$OPTARG;;
        esac
done

shift $((OPTIND-1))
echo ${@} 

echo \"$USER_\" \"$DATE\"  \"$PRODUCT\" \"$FORMAT\" "--" ${OPTIND} "::" $ERROR 
#los argumentos que no vayan con opciones (no sean -algo) deben ir de último
