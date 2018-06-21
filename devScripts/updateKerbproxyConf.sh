#!/bin/sh

cd /opt/kerbproxy/conf

#classifications changes
echo "Swapping Classifications"
echo ""

sudo rm -rf classifications.yaml.old
sudo rm -rf classifications.yaml.new

sudo cp classifications.yaml classifications.yaml.new
sudo rm -rf classifications.yaml

sudo cp classifications.yaml.rpmsave classifications.yaml

#maps changes
echo ""
echo "Swapping Maps"
echo ""

sudo rm -rf maps.yaml.old
sudo rm -rf maps.yaml.new

sudo cp maps.yaml maps.yaml.new
sudo rm -rf maps.yaml

sudo cp maps.yaml.rpmsave maps.yaml

#kerbproxy env
echo ""
echo "Swapping Kerproxy ENV"
echo ""

sudo rm -rf kerbproxy.env.old
sudo rm -rf kerbproxy.env.new

sudo cp kerbproxy.env kerbproxy.env.new
sudo rm -rf kerbproxy.env

sudo cp kerbproxy.env.rpmsave kerbproxy.env

cd ../setup/sql

echo ""
echo "Dropping old schemas"
echo ""
psql $PGDATABASE -U postgres -c "DROP SCHEMA IF EXISTS SESSION CASCADE;"
psql $PGDATABASE -U postgres -c "DROP SCHEMA IF EXISTS SECURITY CASCADE;"

echo ""
echo "Running Setup.sh"
echo ""
./setup.sh

echo ""
echo "Restarting Kerbproxy"
sudo service kerbproxy restart
