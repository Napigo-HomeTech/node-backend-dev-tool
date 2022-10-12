#!/usr/bin/env bash

CMD=$1
serviceRepos=(
    "node-finance-service"
)

serviceName=$SERVICE_NAME

if [ "$1" = 'up' ]; then
    if [ -n "$2" ]; then
    echo "Seeding up for ${2} ..."
    chmod +x $PWD/../${r}/scripts/seed.sh
    done
    npm run mig:up
elif [ "${CMD}" = 'down' ]; then
    echo "Seeding down for ${serviceName}... "
    npm run mig:down
done