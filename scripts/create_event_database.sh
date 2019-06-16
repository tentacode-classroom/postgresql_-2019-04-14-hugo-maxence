#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
SQL_DIRECTORY=$FILE_DIRECTORY/../sql

# Create tables in database
echo '[ INFO ] Création de la base de données, des tables, et INSERT pour tester'
sudo -u postgres psql -f $SQL_DIRECTORY/create_event_database.sql
