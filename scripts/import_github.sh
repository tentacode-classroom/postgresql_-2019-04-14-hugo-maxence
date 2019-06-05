#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Delete files and directories
rm -Rf $PROJECT_DIRECTORY/imports
echo "[ INFO ] Remise à zéro - Suppression du dossier /imports si déjà existant"

rm -Rf $PROJECT_DIRECTORY/data.json
echo "[ INFO ] Suppression du fichier /data.json"

# Download github archives
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz --quiet -P $PROJECT_DIRECTORY/imports
echo "[ INFO ] Téléchargement du dossier JSON dans le dossiers /impots"

# Decompress the Github archives
gunzip $PROJECT_DIRECTORY/imports/*.json.gz
echo "[ INFO ] Décompression des fichiers json"

# Merge the data from all files into a single file
cat $PROJECT_DIRECTORY/imports/* > $PROJECT_DIRECTORY/data.json
echo "[ INFO ] Merge toutes les données des fichiers dans le fichier /data.json"


# Delete the imports directory
rm -Rf $PROJECT_DIRECTORY/imports
echo "[ INFO ] Dossier devenu obsolète, suppression"
