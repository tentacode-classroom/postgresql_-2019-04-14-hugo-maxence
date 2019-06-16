#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

echo '[ INFO ] Création des views'
psql --username super_admin -d github_events -f $PROJECT_DIRECTORY/sql/create_views.sql
