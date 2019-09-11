#!/bin/bash

TEST_LOG="DbsToDelete.txt"

source $ARES/dev/ares_dev.env

#echo "Getting DB names"
#cqlsh -e "select time_bucket from search.search where application='$1' and record_type ='$2' allow filtering" ${CAS_HOST} | tee $TEST_LOG
#psql -c "SELECT datname from pg_database where datname ILIKE 'aide%%'" | tee $TEST_LOG

while read -r id; do
	if [[ $id != "aide" ]] #$newid =~ ^[[:xdigit:]]{32}$ ]]
	then
	echo "deleting db: $id"
	#cqlsh -e "delete from search.search where time_bucket='$id'" ${CAS_HOST}
	psql -c "DROP DATABASE $id"
        fi
done < $TEST_LOG

#rm -rf $TEST_LOG
