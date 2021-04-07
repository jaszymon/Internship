#!/bin/bash
function sprawdz_folder {
	sleep .5
	tree  $1
}
while :
do
echo "Listowanie folderow wraz z plikami"
if [ $# -eq 0 ]; then
	echo 'Nie podano argumentu'
	echo 'Prosze podac lokalizacje folderu:'
	read folder
	if [ -d $folder ]; then
		echo 'Folder istnieje, sprawdzam:'
		sprawdz_folder $folder
		exit 0
	else
		echo 'Folder nie istnieje, wprowadz poprawny lub nacisnij CTRL+C'
	fi
else
	if [ -d $1 ]; then
		echo 'Folder istnieje, sprawdzam:'
		sprawdz_folder $1
		exit 0
	else
		echo 'Folder nie istnieje'
		exit 1
	fi
fi
done
