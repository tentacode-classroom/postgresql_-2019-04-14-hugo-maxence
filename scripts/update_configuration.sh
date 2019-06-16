#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
SQL_DIRECTORY=$FILE_DIRECTORY/../sql

# Create tables in database
echo "[ INFO ] Changement du port et de la mémoire de la base de données"
sudo -u postgres psql -f $SQL_DIRECTORY/update_configuration.sql

# Restart postgres to apply changes
echo "[ INFO ] Restart de PostgreSQL"
sudo service postgresql restart

# Try the changes
echo "[ INFO ] Test des changements précédents"
sudo -u postgres psql -c "SELECT name, setting FROM pg_settings WEHERE name = 'port' OR name = 'work_mem' "

# Use default configurations
echo "[ INFO ] Remise à zéro des configurations"
sudo -u postgres psql -c 'ALTER SYSTEM RESET all'
sudo service postgresql restart
