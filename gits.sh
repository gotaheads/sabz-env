#!/bin/bash

source projects.sh

for p in "${PROJECTS[@]}"
do
    echo "Check $p"
    cd $p
    git status
    cd ..
done

