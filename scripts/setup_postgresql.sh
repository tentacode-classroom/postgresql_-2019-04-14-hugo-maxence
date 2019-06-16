#!/bin/bash

echo "[ INFO ] Ajout du repository dans le ficher sources.list"
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" | sudo tee --append /etc/apt/sources.list.d/pgdg.list

echo "[ INFO ] Import du repository"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add
sudo apt-get update

echo "[ INFO ] Lancement de l'installation de PostgreSQL version 11"
sudo apt-get install postgresql-11 -y

echo "[ INFO ] Démarrage du service PostgreSQL"
sudo service postgresql start

echo "[ INFO ] Version : "
sudo -u postgres psql --version
