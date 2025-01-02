#!/bin/bash

for parent in $1/*; do
    if [ -d "${parent}/.git" ]; then
        echo -e "\033[0;32mWorking directory ${parent}\033[0m"
        echo -e "\033[0;31mCleaning remote stale branches\033[0m"
        git -C ${parent} fetch --prune origin
        branches=()
        eval "$(git -C ${parent} for-each-ref --shell --format='branches+=(%(refname))' refs/heads/)"
        for branch in "${branches[@]}"; do
            echo -e "\033[1;33mUpdating branch ${branch:11}\033[0m"
            git -C ${parent} fetch origin ${branch:11}
            if [ $? -ne 0 ]; then
                echo -e "\033[0;31mCleaning local stale branch ${branch:11}\033[0m"
                git -C ${parent} branch -D ${branch:11}
            fi
        done
    fi
done