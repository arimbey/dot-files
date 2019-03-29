#!/bin/bash

source $ARES/dev/ares_dev.env

cd $TELEMETRY_SQLITE_DATA_DIR

echo "Delete telemetry folder"
rm -rf 2019/

echo "Drop active tracks, tracks, and overrides tables"
psql aide -U postgres -c "TRUNCATE TABLE telemetry.active_tracks;"
psql aide -U postgres -c "TRUNCATE TABLE telemetry.tracks;"
psql aide -U postgres -c "TRUNCATE TABLE telemetry.overrides;"

echo "Flush Redis"
redis-cli flushall

