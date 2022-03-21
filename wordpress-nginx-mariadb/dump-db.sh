#!/usr/bin/env bash

MDB_PASSWORD=$(cat docker-compose.yml | grep mdb_pass | head -1 | awk '{ print $3}')
MDB_DB=$(cat docker-compose.yml | grep mdb_db | head -1 | awk '{ print $3}')

RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${RED}### Dumping database ...${NC}\n"
docker-compose exec mariadb /bin/bash -c "mysqldump -alv -h localhost -u root -p${MDB_PASSWORD} ${MDB_DB} > /docker-entrypoint-initdb.d/mariadb.sql"
printf "${RED}### Finished! Check initdb mountpoint.${NC}\n"

