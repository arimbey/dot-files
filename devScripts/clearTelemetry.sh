#!/bin/bash

source $ARES/dev/ares_dev.env

cd $TELEMETRY_SQLITE_DATA_DIR

echo "Delete telemetry folder"
rm -rf 2018/

echo "Drop active tracks table"
psql aide -U postgres -c "TRUNCATE TABLE telemetry.active_tracks;"

echo "Flush Redis"
redis-cli flushall


