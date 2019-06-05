#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create tables in database
echo '[ INFO ] Lancement du fichier create_event_database.sql'
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/create_event_database.sql
