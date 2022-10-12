#!/bin/bash

serviceRepos=(
    "node-finance-service"
)


CURR_DIR=$PWD/../


for repo in "${serviceRepos[@]}"; do
    echo 'Grant permission & execute entrypoint.sh for' ${repo}
    # cd $PWD/../${repo}/scripts
    chmod +x $PWD/../${repo}/scripts/entrypoint.sh
    $PWD/../${repo}/scripts/entrypoint.sh
done








