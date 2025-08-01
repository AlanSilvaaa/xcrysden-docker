#!/bin/bash

# If the first argument is "--convert", run the Python script
if [[ "$1" == "--convert" ]]; then
    shift
    python3 /app/convert_cif_to_xsf.py "$@"
else
    exec ./xcrysden
fi
