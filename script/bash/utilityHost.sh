#!/bin/bash

option=$1
result=$(ping -c 10 $1)

echo "$result"
