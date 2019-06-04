#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Create tables in database
sudo -u postgres psql -f $PROJECT_DIRECTORY/sql/configure_db.sql

# Restart postgres to apply changes
sudo systemctl restart postresql