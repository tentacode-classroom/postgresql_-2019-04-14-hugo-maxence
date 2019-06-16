#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

SQL_DATA_FILE=$PROJECT_DIRECTORY/data.sql

echo '[ INFO ] Création de la table events_raw'
psql --username super_admin -d github_events -f $PROJECT_DIRECTORY/sql/create_events_raw_table.sql


LINE_NUMBER=1
rm -rf $SQL_DATA_FILE

QUERY="INSERT INTO events_raw (data_json) values"

echo '[ INFO ] Insertion des lignes dans la base de données.'
echo '[ WARNING ] Ça peut-être très long 🙄'
cat $PROJECT_DIRECTORY/data.json | sed 's/\\/\\\\/g' | while read LINE ; do
    LINE=`echo $LINE | sed s/\'/#/g`

    if [ $LINE_NUMBER -eq 1000 ]
    then
        QUERY="$QUERY ('$LINE');"
        echo $QUERY > $SQL_DATA_FILE
        psql --username super_admin -d github_events -f $SQL_DATA_FILE
        echo "[ INFO ] 1000 lignes viennent d'être insérées en base de données."

        QUERY="INSERT INTO events_raw (data_json) values"
        LINE_NUMBER=1
    else
        ((LINE_NUMBER+=1))
        QUERY="$QUERY ('$LINE'), "
    fi

done

QUERY="$QUERY ('$LINE');"
echo $QUERY > $SQL_DATA_FILE
psql --username super_admin -d github_events -f $SQL_DATA_FILE

echo "[ INFO ] Insertion terminée"
rm $SQL_DATA_FILE

psql --username super_admin -d github_events -c 'SELECT * FROM events_raw LIMIT 10'
