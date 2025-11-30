#!/bin/bash

# To get all variables passed - $@
# To get number of variables - $#
# Script name - $0
# Present working directory - $PWD
# Home directory of current user - $HOME
# Which user is running the script - $USER
# Process id of current script - $$
# Process id of last command in background - $!
# Last command status - $?

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running the script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in background: $!"
echo "Last command status: $?"