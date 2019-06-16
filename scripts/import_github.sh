#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..
IMPORTS_DIRECTORY=$PROJECT_DIRECTORY/imports

# Delete files and directories
echo "[ INFO ] Remise à zéro - Suppression du dossier “imports“ si déjà existant"
rm -Rf $IMPORTS_DIRECTORY

echo "[ INFO ] Suppression du fichier “data.json“"
rm -Rf $PROJECT_DIRECTORY/data.json

# Download github archives
echo "[ INFO ] Téléchargement des archives Github dans le dossier “imports“"
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz --quiet -P $IMPORTS_DIRECTORY

# Decompress the Github archives
echo "[ INFO ] Décompression des archives Github"
gunzip $IMPORTS_DIRECTORY/*.json.gz

# Merge the data from all files into a single file
echo "[ INFO ] Merge toutes les données des fichiers json dans un unique fichier “data.json“"
cat $IMPORTS_DIRECTORY/*.json > $PROJECT_DIRECTORY/data.json


# Delete the imports directory
echo "[ INFO ] Suppression du dossier “imports“"
rm -Rf $IMPORTS_DIRECTORY
