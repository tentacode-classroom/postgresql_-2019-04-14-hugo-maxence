#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create tables in database

echo "[ INFO ] Création des tables dans la base de données"
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/configure_db.sql

# Restart postgres to apply changes
echo "[ INFO ] Redémarage de PostgreSQL"
sudo service postgresql restart
