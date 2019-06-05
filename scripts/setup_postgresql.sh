#!/bin/bash

# Add the repository in sources
echo "[ INFO ] Ajout du repository dans la sources.list"
echo deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main > /etc/apt/sources.list.d/pgdg.list

# Import the repository
echo "[ INFO ] Import du repository"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Install the package
echo "[ INFO ] Lancement de l'installation de PostgreSQL version 11"
apt-get install postgresql-11 -y

# Start postgres
echo "[ INFO ] Démarrage du service PostgreSQL"
sudo service postgresql start
