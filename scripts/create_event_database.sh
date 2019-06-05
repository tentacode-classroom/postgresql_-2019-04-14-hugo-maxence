#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create tables in database
echo '[ INFO ] Création de la base de données, des tables, et INSERT pour tester'
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/create_event_database.sql
