#!/bin/bash

# Set CURRENT_DIRECTORY variable
CURRENT_DIRECTORY=`dirname $0`
CURRENT_DIRECTORY=$CURRENT_DIRECTORY/..

# Delete files and directories
rm -Rf $CURRENT_DIRECTORY/imports
rm -Rf $CURRENT_DIRECTORY/data.json

# Download github archives
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz --quiet -P $CURRENT_DIRECTORY/imports

# Decompress the Github archives
gunzip $CURRENT_DIRECTORY/imports/*.json.gz

# Merge the data from all files into a single file
cat $CURRENT_DIRECTORY/imports/* > $CURRENT_DIRECTORY/data.json

# Delete the imports directory
rm -Rf $CURRENT_DIRECTORY/imports
