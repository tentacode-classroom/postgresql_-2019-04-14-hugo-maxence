#!/usr/bin/env bash

sudo -u postgres psql -f ./sql/databaseManager.sql
echo '[ INFO ] Lancement du fichier databaseManager.sql'
