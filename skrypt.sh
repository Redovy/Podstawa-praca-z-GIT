#!/bin/bash

while [ $# -gt 0 ]; do
    case "$1" in
        --date)
            date
            exit 0
            ;;
        --logs)
            shift
            if [[ $1 =~ ^-?[0-9]+$ ]]; then
                n=${1#}
                for i in $(seq 1 $n); do
                    echo "Nazwa pliku: log$i.txt" > log$i.txt
                    echo "Komenda wywołania skryptu: $0 $1" >> log$i.txt
                    echo "Data utworzenia pliku: $(date)" >> log$i.txt
                done
            else
                for i in {1..100}; do
                  echo "Nazwa pliku: log$i.txt" > log$i.txt
                  echo "Komenda wywołania skryptu: $0 $1" >> log$i.txt
                  echo "Data utworzenia pliku: $(date)" >> log$i.txt
                done
                exit 1
            fi
            exit 0
            ;;
    esac
    shift
done