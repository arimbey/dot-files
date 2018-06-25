#!/bin/bash

TEST_LOG="idsToDelete.txt"

source $ARES/dev/ares_dev.env

application=$1
recordType=$2

echo "Selecting time_bucket for application $1 and record_type $2"

echo "Getting IDS"
cqlsh -e "select time_bucket from search.search where application='$1' and record_type ='$2' allow filtering" ${CAS_HOST} | tee $TEST_LOG

while read -r id; do
	newid=${id//-/}
	if [[ $newid =~ ^[[:xdigit:]]{32}$ ]]
	then
	echo "deleting id: $id"
	cqlsh -e "delete from search.search where time_bucket='$id'" ${CAS_HOST}
        fi
done < $TEST_LOG

rm -rf $TEST_LOG

