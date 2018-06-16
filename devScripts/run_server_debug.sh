#!/bin/bash
# Runs pwcop (Ares) server from a local directory, not the installed directory.
# Used to test a developmental version of pwcop before installing it into the
# official location.
#
# NOTE:  Run run_recorder.sh before running this script.
#

set -e	  # Exit immediately if a command exits with a non-zero status.
set -u	  # Treat unset variables as an error when performing parameter expansion.

DEV_DIR="$GOPATH/src/github.com/Novetta/pwcop/dev"

# Read in and set up the environment variables.
source $DEV_DIR/ares_dev.env

export LOG_LEVEL="DEBUG"
echo "LOG_LEVEL $LOG_LEVEL"

# Update the local installation with any changes.
echo "Building webserver"

cd $ARES/aresserver/server

go run server.go

# Done.
exit $?
