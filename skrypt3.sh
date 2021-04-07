#!/bin/bash

#Listowanie wszystkich plikow i folderow z zadanym folderze

echo "Czesc, ten skrypt wyswietli wszystkie pliki oraz folder w zadanym przez ciebie folderze, podaj prosze lokalizacje folderu:"

read folder

echo "Chwileczke..."

sleep .5

ls -a $folder
