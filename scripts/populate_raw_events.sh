#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

echo '[ INFO ] Création de la table events_raw'
psql --username super_admin -d github_events -f $PROJECT_DIRECTORY/sql/create_events_raw_table.sql


echo '[ INFO ] Création des fichiers SQL'
LINE_NUMBER=1

rm -rf $PROJECT_DIRECTORY/data.sql

QUERY="INSERT INTO events_raw (data_json) values"

cat $PROJECT_DIRECTORY/data.json | while  read LINE ; do
#    LINE=`echo $LINE | sed s/\'/#/g`
    echo $LINE_NUMBER

    if [ $LINE_NUMBER -eq 100 ]
    then
        QUERY="$QUERY ('$LINE');"
        echo $QUERY > $PROJECT_DIRECTORY/data.sql
        sudo -u postgres psql --username super_admin -d github_events -f $PROJECT_DIRECTORY/data.sql
        LINE_NUMBER=1
    else
        echo $LINE_NUMBER
        ((LINE_NUMBER+=1))
        QUERY="$QUERY ('$LINE'), "
    fi

done


rm -rf $PROJECT_DIRECTORY/sql_datas
