#!/bin/bash

MOVIES=("Bahubali" "Rangasthalam" "RRR")
# index starts from 0 for arrays in shell

echo "First movie: ${MOVIES[0]}"
echo "Last movie: ${MOVIES[2]}"

echo "All movies are: ${MOVIES[@]}"