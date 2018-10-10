#!/bin/sh

# This script will be called from a cron job on the server using the below command
# 0 2 * * curl https://raw.githubusercontent.com/Bahmni/bahmni-scripts/master/demo/db-backups/v0.82/dbRestore.sh | sh  > /home/centos/dbRestoreLog.log

# . ~/.cronfile

GITHUB_BASE_URL="https://github.com/Bahmni/bahmni-scripts/raw/master/demo/db-backups/v0.82"

OPENELIS_SQL_FILE="openelis_backup.sql"
OPENERP_SQL_FILE="openerp_backup.sql"
OPENMRS_SQL_FILE="openmrs_backup.sql"
BAHMNIPACS_SQL_FILE="bahmni_pacs_backup.sql"
PACSDB_SQL_FILE="pacsdb_backup.sql"
DEST_LOCATION="/vagrant/databases/tmp"
OPENELIS_DB_NAME="clinlims"
OPENERP_DB_NAME="openerp"
BAHMNIPACS_DB_NAME="bahmni_pacs"
PACS_DB_NAME="pacsdb"

export SQLUSER=root
export PASSWORD=password
export PSQLUSER=postgres
export CLINLIMSUSER=clinlims
export OPENERPUSER=openerp
export PACSUSER=pacs
export PACSSUER=pacs


setup(){
	rm -rf $DEST_LOCATION
	mkdir $DEST_LOCATION	
}

download_and_unzip(){
	wget -O $DEST_LOCATION/$OPENELIS_SQL_FILE.gz $GITHUB_BASE_URL/$OPENELIS_SQL_FILE.gz
	wget -O $DEST_LOCATION/$OPENERP_SQL_FILE.gz $GITHUB_BASE_URL/$OPENERP_SQL_FILE.gz
	wget -O $DEST_LOCATION/$OPENMRS_SQL_FILE.gz $GITHUB_BASE_URL/$OPENMRS_SQL_FILE.gz
	wget -O $DEST_LOCATION/$BAHMNIPACS_SQL_FILE.gz $GITHUB_BASE_URL/$BAHMNIPACS_SQL_FILE.gz
	wget -O $DEST_LOCATION/$PACSDB_SQL_FILE.gz $GITHUB_BASE_URL/$PACSDB_SQL_FILE.gz


	gzip -d $DEST_LOCATION/$OPENELIS_SQL_FILE.gz $DEST_LOCATION/$OPENERP_SQL_FILE.gz $DEST_LOCATION/$OPENMRS_SQL_FILE.gz $DEST_LOCATION/$BAHMNIPACS_SQL_FILE.gz $DEST_LOCATION/$PACSDB_SQL_FILE.gz
}

restore(){
	echo "Restoring the database"
	bahmni -i local stop
	mysql -u$SQLUSER -p$PASSWORD -e "drop database openmrs"
	mysql -u$SQLUSER -p$PASSWORD -e "create database openmrs"
	mysql -u$SQLUSER -p$PASSWORD openmrs < $DEST_LOCATION/$OPENMRS_SQL_FILE
	mysql -u$SQLUSER -p$PASSWORD -e "FLUSH PRIVILEGES"

	ps aux | grep -ie $OPENELIS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -U$PSQLUSER -c "drop database if exists clinlims;"
	psql -U$PSQLUSER -c "create database clinlims;"
	psql -U$CLINLIMSUSER $OPENELIS_DB_NAME < $DEST_LOCATION/$OPENELIS_SQL_FILE

	ps aux | grep -ie $OPENERP_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -U$PSQLUSER -c  "drop database if exists openerp;"
	psql -U$PSQLUSER -c  "create database openerp;"
	psql -U$OPENERPUSER $OPENERP_DB_NAME < $DEST_LOCATION/$OPENERP_SQL_FILE

	ps aux | grep -ie $BAHMNIPACS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -U$PSQLUSER -c  "drop database if exists bahmni_pacs;"
	psql -U$PSQLUSER -c  "create database bahmni_pacs;"
	psql -U$PACSUSER $BAHMNIPACS_DB_NAME < $DEST_LOCATION/$BAHMNIPACS_SQL_FILE

    ps aux | grep -ie $PACS_DB_NAME | awk '{print $2}' | xargs kill -9
	psql -U$PSQLUSER -c  "drop database if exists pacsdb;"
	psql -U$PSQLUSER -c  "create database pacsdb;"
	psql -U$PACSSUER $PACS_DB_NAME < $DEST_LOCATION/$PACSDB_SQL_FILE	

	bahmni -i local start	
}

setup
download_and_unzip
restore
