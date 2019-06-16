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

Nous avons créé un script (setup.sh) qui permet d'installer PostgreSQL facilement.

Pour le lancer tapez la commande suivante :

```bash
$ ./setup_postgresql.sh
```



## Import GitHub Data :

Dans un premier, ce script, télécharge les données de Github, sous une forme compressée, de la journée du 14 avril 2019 de minuit à 23h00. Dans un second il décompresse les archives pour avoir des fichiers au format JSON. Pour terminer, le script concataine toutes les données dans un unique fichier “data.json“.

Pour cela tapez la commande suivante :

```bash
$ ./import_github.sh
```



##  Héritage des tables : 

Dans ce script, on créé une base de données “github_events“ avec les tables actors, repos, events, push_events, issue_events, pull_request_events. On essaie ensuite d'insérer des données pour tester le bon fonctionnement des tables. Puis losque cela est fait, on clean les tables.

Pour lancer l'opération tapez la commande suivant :

```bash
$ ./create_event_database.sh
```



## Modification de la configuration :

Le but de ce script est de configurer le serveur PostgreSQL directement en SQL, ainsi, nous modifions le port de Postgres ainsi que la mémoire utilisée. Une fois les configurations testée, nous remettons les configurations à zéro car un bug présent lors du changement de port.

Pour configurer Postgres, lancer la commande :

```bash
$ ./update_configuration.sh
```



## Créations des utilisateurs :

Nous allons créer 2 utilisateurs avec leurs droits et leurs rôles respectifs, le premier utilisateur “super_admin“ et le second “github_events“. Pour lancer le script de création des utilisateurs tapez la commande suivante :

```bash
$ ./create_users.sh
```



## La table events_raw :

Le script populate_raw_events permet d'insérer toutes les lignes JSON, importées auparavant, dans une nouvelle table nommée “events_raw“. Attention, cette opération peut-être très longue.

Tapez la commande :

```bash
$ ./populate_raw_events.sh
```



## Installation de pgAdmin :

Avec ce script nous allons installer pgAdmin. Ce script fais en sorte que le serveur Postgres accepte toute les adresses. 

Pour exectuer ce script lancez :

```bash
$ ./pg_admin_install
```

Suite à ce script, dans le fichier “/etc/postgresql/11/main/pg_hba.conf“ nous devons ajouter quel utilisateur à le droit de se connecter, en y ajoutant cette ligne dans le fichier :

```bash
local	all	super_admin	{plage_dadresse}	md5
```



## Insertion depuis le JSON :

Cette étape permet de transformer les données JSON insérées à l'étape “La table events_raw“ dans les 



## Les vues statistiques :

Ce script permet de créer un vue afin d'afficher les repos ordonnés par nombre de commits.

Tapez la commande suivante :

```bash
$ ./create_views.sh
```



## Script de backup

Ce script permet de sauvergarder les données (tables, rows, etc..) de la base données “github_events“ ainsi que les utilisateurs et les globales. 

Pour lancer le backup effectuez la commande suivante :

```bash
$ ./backup.sh
```
