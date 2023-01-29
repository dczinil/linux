#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "Fedora 1"
            ./dnf.sh;;
        "Option 2")
            echo "Ubuntu 2"
            ./apt.sh;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            echo "the error is between the chair and the keyboard";;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
