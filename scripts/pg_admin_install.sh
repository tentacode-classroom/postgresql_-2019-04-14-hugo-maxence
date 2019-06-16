#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
SQL_DIRECTORY=$FILE_DIRECTORY/../sql

# Create tables in database
echo "[ INFO ] Modification des adresses d'écoute de postgres"
sudo -u postgres psql -f $SQL_DIRECTORY/pg_admin_install.sql

echo "[ INFO ] Redémarrage du service PostgreSQL"
sudo service postgresql restart
