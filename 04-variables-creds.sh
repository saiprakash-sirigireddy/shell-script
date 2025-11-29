#!/bin/bash

echo "Please enter your username::"

read -s USERNAME # USERNAME is variable stored from input given
# -s is to hide what we are entering 

echo "Username entered is: $USERNAME"

echo "Please enter Password::"

read -s PASSWORD