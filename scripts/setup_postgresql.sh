#!/bin/bash

# Add the repository in sources
echo deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main > /etc/apt/sources.list.d/pgdg.list
echo "[ INFO ] Ajout du repository dans la sources.list"

# Import the repository
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "[ INFO ] Import du repository"

# Install the package
apt-get install postgresql-11 -y
echo "[ INFO ] Lancement de l'installation de PostgreSQL version 11"

# Start postgres
sudo service postgresql start
echo "[ INFO ] Démarrage du service PostgreSQL"
