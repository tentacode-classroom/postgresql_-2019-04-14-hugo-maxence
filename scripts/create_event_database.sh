#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create tables in database
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/databaseManager.sql
echo '[ INFO ] Lancement du fichier databaseManager.sql'
