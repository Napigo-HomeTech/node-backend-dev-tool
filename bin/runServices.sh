#!/bin/bash

services=(
    "npg-finance-service"
)


CURR_DIR=$PWD/../


for service in "${services[@]}"; do
    echo 'Grant permission seed.sh for' ${service}
    chmod +x $PWD/../${service}/scripts/seed.sh

    echo 'Grant permission & execute entrypoint.sh for' ${service}
    chmod +x $PWD/../${service}/scripts/entrypoint.sh
    
    $PWD/../${service}/scripts/entrypoint.sh
done








