#/bin/bash
#Määrab kaustade asukohad ja hetkekasutaja.
kasutaja=$(whoami)
kodukasutaja_kaust=/home/$kasutaja
#Määrab tänase kuupäeva
kuupaev=$(date +%d.%m.%Y)

#Annab teada hetkekasutaja ja küsib kasutaja kelle kausta varundada tahame.
#echo "Hetke kasutaja on $kasutaja"
echo -n "Sisesta kasutaja keda varundada tahad: (Vaikeväärtus: $kasutaja)"
read backup_user
#Määrab tühja väärtuse korral hetkekasutaja muutujale.
backup_user="${backup_user:=$kasutaja}"
backitav_folder=/home/$backup_user

#Kontrollib kausta olemasolu ja teeb backupi. Vea korral annab sellest teada.

if [ -d /home/$backup_user ]; then tar cv $backitav_folder | gzip > /home_bcp/$backup_user.$kuupaev.tar.gz
else
	echo "Kausta ei eksisteeri"
fi


