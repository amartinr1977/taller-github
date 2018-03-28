#!/bin/bash
. /etc/default/vx-dga-variables/vx-dga-variables-general.conf

function cambiar_passwords_cache {

}
function cambiar_passwords_vita {

  PASSALUMNO='alumno'
  PASSPROFESOR='careidga'
  PASSDGA='careidga'
  if migasfree-tags -g | grep CHE &> /dev/null; then
    if  pdbedit -Lw | grep -q profesor; then
      (echo "${PASSPROFESOR}"; echo "${PASSPROFESOR}") | smbpasswd -s profesor
    fi
    if  pdbedit -Lw | grep -q alumno; then
      (echo "${PASSALUMNO}"; echo "${PASSALUMNO}") | smbpasswd -s alumno
    fi
    # El registro no lo dejamos en el propio servidor, sino que avisamos a migasfree
    echo "Se han modificado contraseñas en el servidor con etiquetas $(migasfree-tags -g)"
    sed -i "/MODIFICARPASSWORDS.*/d" /etc/default/vx-dga-variables/vx-dga-variables-general.conf
    sed -i '/Varibles utilizadas por los paquetes/a MODIFICARPASSWORDS=1' /etc/default/vx-dga-variables/vx-dga-variables-general.conf
    exit 0;
  fi

# Para crear la pass: printf "xxx" | mkpasswd -s -m sha-512 (paquete whois)
# Modificaremos las passwords SOLO en el caso de que NO esté etiquetado el equipo como ENT-CASA
if (migasfree-tags -g | grep -v ENT-CASA &> /dev/null); then
  if grep ^alumno /etc/passwd &> /dev/null ; then
    usermod -p "$(echo -n ${PASSALUMNO} | mkpasswd -s -m sha-512)" alumno
  fi
  if grep ^profesor /etc/passwd &> /dev/null ; then
    usermod -p "$(echo -n ${PASSPROFESOR} | mkpasswd -s -m sha-512)" profesor
  fi
  if grep ^dga /etc/passwd &> /dev/null ; then
    usermod -p "$(echo -n ${PASSDGA} | mkpasswd -s -m sha-512)" dga
  fi
fi
}

if test -z "${MODIFICARPASSWORDS}" \
  && ETIQUETAS="$(migasfree-tags -g 2> /dev/null)" \
  test -z "${ETIQUETAS}" ; then

  # Nuevas passwords de los usuarios:
  if echo "${ETIQUETAS}" | grep "CENTRO" &> /dev/null ; then

  PASSALUMNO='alumno'
  PASSPROFESOR='careidga'
  PASSDGA='careidga'



  # Dejamos un LOG de la ejecución de la falla
  if ! test -d /var/log/vitalinux ; then
    mkdir /var/log/vitalinux
  fi
  echo "$(date) - Se han modificado las passwords de los usuarios por defecto ..." > /var/log/vitalinux/falla-cambio-password-usuarios.log

  # Añadimos la variable para que no se vuelva a ejecutar esta misma falla
  sed -i "/MODIFICARPASSWORDS.*/d" /etc/default/vx-dga-variables/vx-dga-variables-general.conf
  sed -i '/Varibles utilizadas por los paquetes/a MODIFICARPASSWORDS=1' /etc/default/vx-dga-variables/vx-dga-variables-general.conf

fi