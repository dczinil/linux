#!/bin/bash

filename="$1"
extension="${filename##*.}"
name="${filename%.*}"

if [[ "$extension" = "zip" ]] ; then
        if [[ `zipinfo -1 "$1" | sed 's/\/.*//' | sort | uniq | wc -l` = '1' ]] ; then
                unzip "$1"
        else
                mkdir "$name"
                unzip "$1" -d "$name"
        fi
        exit 0
fi
tar -xvf "$1"
