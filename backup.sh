#/bin/bash

kasutaja=$(whoami)
kodukasutaja_kaust=/home/$kasutaja

kuupaev=$(date +%d.%m.%Y)

#echo "Hetke kasutaja on $kasutaja"
echo -n "Sisesta kasutaja keda varundada tahad: (Vaikeväärtus: $kasutaja)"
read backup_user
backup_user="${backup_user:=$kasutaja}"
backitav_folder=/home/$backup_user

if [ -d /home/$backup_user ]; then tar cv $backitav_folder | gzip > /home_bcp/$backup_user.$kuupaev.tar.gz
else
	echo "Kausta ei eksisteeri"
fi


