# Projet PostgreSQL [Maxence MOTTARD & Hugo Bordais]



## Démarrer le serveur :

Pour notre projet, nous avons utilise Vagrant. Une fois que [vagrant est installé](https://www.vagrantup.com/downloads.html) sur votre machine, il suffit de lancer la commande suivante pour démarrer le serveur :

```bash
$ vagrant up
```

Une fois la machine créée et lancée, vous pouvez y accéder avec la commande :

```bash
$ vagrant ssh
```



## Setup PostgreSQL:

Nous avons créé un script (setup.sh) qui permet d'installer PostgreSQL facilement. Pour le lancer tapez la commande suivante :

```bash
$ ./setup_postgresql.sh
```



## Import GitHub Data :

Nous allons ensuite importer les données de la journée du 14 avril 2019 de minuit à 23h00. Pour cela tapez la commande suivante :

```bash
$ ./import_github.sh
```



##  Héritage des tables : 

Nous allons créer la base de données avec les tables. Des valeurs sont déjà rentrée afin de tester. Pour lancer l'opération tapez la commande suivant :

```bash
$ ./create_event_database.sh
```



## Modification de la configuration :

## Créations des utilisateurs :

## La table events_raw :

## Installation de pgAdmin :

## Insertion depuis le JSON :

## Les vues statistiques :

## Script de backup

