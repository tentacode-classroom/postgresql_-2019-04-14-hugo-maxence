
FILE_DIRECTORY=`dirname $0`
BACKUPS_DIRECTORY=$FILE_DIRECTORY/../backups

rm -fr $BACKUPS_DIRECTORY

mkdir $BACKUPS_DIRECTORY

echo '[ INFO ] Backup github_events database'
pg_dump --username super_admin github_events -f $BACKUPS_DIRECTORY/github_events-table.sql

echo '[ INFO ] Backup globals'
pg_dumpall --globals-only --username super_admin -f $BACKUPS_DIRECTORY/globals.sql

echo '[ INFO ] Backup roles'
pg_dumpall --roles-only --username super_admin -f $BACKUPS_DIRECTORY/roles.sql
