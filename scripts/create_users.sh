#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create the super_user user
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/create_super_user.sql
echo '[ INFO ] Lancement du fichier create_super_user.sql'

# Create the github_events user
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/create_github_user.sql
echo '[ INFO ] Lancement du fichier create_github_user.sql'
