#!/usr/bin/env bash

CMD=$1
services=(
    "npg-finance-service"
)

grantPermission(){
    for service in "${services[@]}"; do
        echo "Grant permission to execute sh for ${service} ..."
        chmod +x $PWD/../${service}/scripts/seed-up.sh
        chmod +x $PWD/../${service}/scripts/seed-down.sh
    done
}



grantPermission

if [ "$1" = 'up' ]; then
    if [ -n "$2" ]; then
        if [ "$2" = 'all' ]; then
            for service in "${services[@]}"; do
                echo "Seeding up for ${service} ..."
                $PWD/../${service}/scripts/seed-up.sh
            done
        else
            echo "Seeding up for ${2} ..."
            $PWD/../${2}/scripts/seed-up.sh
        fi
    fi
elif [ "$1" = 'down' ]; then
    if [ -n "$2" ]; then
        if [ "$2" = 'all' ]; then
            for service in "${services[@]}"; do
                echo "Seeding down for ${service} ..."
                $PWD/../${service}/scripts/seed-down.sh
            done
        else
            echo "Seeding down for ${2} ..."
            $PWD/../${2}/scripts/seed-down.sh
        fi
    fi
fi