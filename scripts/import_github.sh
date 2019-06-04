#!/bin/bash

# Set variables
FILE_DIRECTORY=`dirname $0`
PROJECT_DIRECTORY=$FILE_DIRECTORY/..

# Delete files and directories
rm -Rf $PROJECT_DIRECTORY/imports
rm -Rf $PROJECT_DIRECTORY/data.json

# Download github archives
wget https://data.gharchive.org/2019-04-14-{0..23}.json.gz --quiet -P $PROJECT_DIRECTORY/imports

# Decompress the Github archives
gunzip $PROJECT_DIRECTORY/imports/*.json.gz

# Merge the data from all files into a single file
cat $PROJECT_DIRECTORY/imports/* > $PROJECT_DIRECTORY/data.json

# Delete the imports directory
rm -Rf $PROJECT_DIRECTORY/imports
