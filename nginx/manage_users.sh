#!/bin/bash

HTPASSWD_FILE="$HOME/Fil-Rouge-Final/nginx/auth/.htpasswd"

case "$1" in

add)
    if [ -z "$2" ]; then
        echo "Usage: $0 add username"
        exit 1
    fi

    USERNAME=$2
    read -s -p "Password: " PASSWORD
    echo
    HASH=$(openssl passwd -apr1 "$PASSWORD")

    echo "$USERNAME:$HASH" >> "$HTPASSWD_FILE"
    echo "User '$USERNAME' added."
    ;;

delete)
    if [ -z "$2" ]; then
        echo "Usage: $0 delete username"
        exit 1
    fi

    USERNAME=$2
    sed -i "/^$USERNAME:/d" "$HTPASSWD_FILE"
    echo "User '$USERNAME' deleted."
    ;;

list)
    echo "Current users:"
    cut -d: -f1 "$HTPASSWD_FILE"
    ;;

*)
    echo "Usage:"
    echo "$0 add username"
    echo "$0 delete username"
    echo "$0 list"
    ;;

esac
