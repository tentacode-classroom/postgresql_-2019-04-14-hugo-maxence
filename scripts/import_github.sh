#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Delete files and directories
echo "[ INFO ] Remise à zéro - Suppression du dossier /imports si déjà existant"
rm -Rf $PROJECT_DIRECTORY/imports

echo "[ INFO ] Suppression du fichier /data.json"
rm -Rf $PROJECT_DIRECTORY/data.json

# Download github archives
echo "[ INFO ] Téléchargement du dossier JSON dans le dossiers /imports"
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz --quiet -P $PROJECT_DIRECTORY/imports

# Decompress the Github archives
echo "[ INFO ] Décompression des fichiers json"
gunzip $PROJECT_DIRECTORY/imports/*.json.gz

# Merge the data from all files into a single file
echo "[ INFO ] Merge toutes les données des fichiers dans le fichier /data.json"
cat $PROJECT_DIRECTORY/imports/* > $PROJECT_DIRECTORY/data.json


# Delete the imports directory
echo "[ INFO ] Dossier devenu obsolète, suppression"
rm -Rf $PROJECT_DIRECTORY/imports
