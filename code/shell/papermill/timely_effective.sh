#!/bin/bash

## datalad run --dry-run basic -i data/raw/mbsa-qip --explicit -m "Timely Effective: Multiple runs via Datalad" 'code/shell/papermill/timely_effective.sh'

# Setup
#------------------------
T="$(date +%s)"
start_time=$(date +"%s")

cd /home/pranav/work/pranavmishra90/courses/by-mishra/research-data-management


# Papermill
#------------------------
echo 'Started at ' $(date +"%F-%H-%M-%S")
echo '----------------------------------'

echo "Starting analysis for the Timely and Effective Care Hospital Dataset"
echo ""

papermill "./code/jupyter/timely_effective.ipynb" "./code/jupyter/papermill_tmp/timely_effective.ipynb"

# Quarto
#------------------------

echo "Rendering the notebook"
echo ""
quarto render .


T="$(($(date +%s)-T))"
minutes=$((T / 60))

echo '------------------------------------------------'
echo 'Ended at ' $(date +"%F-%H-%M-%S")
echo "It took ${minutes} minutes to complete" 
echo ""
echo "Done."