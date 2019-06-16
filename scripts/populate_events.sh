#!/bin/bash

FILE_DIRECTORY=`dirname $0`
SQL_DIRECTORY=$FILE_DIRECTORY/../sql


# Insert users into the table
echo '[ INFO ] Insertion des actors en base de données'
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_actors.sql

# Insert repos into the table
echo '[ INFO ] Insertion des repos en base de données'
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_repos.sql

# Insert push_events into the table
echo '[ INFO ] Insertion des évènements de push en base de données'
psql --username super_admin -d github_events -f $SQL_DIRECTORY/insert_events.sql
