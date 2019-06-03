#!/bin/bash

CURRENT_DIRECTORY=`dirname $0`

rm -Rf $CURRENT_DIRECTORY/imports
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz -P $CURRENT_DIRECTORY/imports

gunzip $CURRENT_DIRECTORY/imports/*.json.gz
