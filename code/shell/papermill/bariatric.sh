#!/bin/bash

## datalad run --dry-run basic -i data/raw/mbsa-qip --explicit -m "Multiple runs via Datalad" 'code/shell/papermill/bariatric.sh'

# Setup
#------------------------
T="$(date +%s)"
start_time=$(date +"%s")

cd /home/pranav/work/pranavmishra90/courses/by-mishra/research-data-management


# Papermill and Quarto
#------------------------
echo 'Started at ' $(date +"%F-%H-%M-%S")
echo '----------------------------------'

echo "Starting analysis for the MBSA-QIP Dataset"
echo ""
echo ""

papermill "./code/jupyter/bariatric_papermill.ipynb" "./code/jupyter/papermill_tmp/bariatric_papermill.ipynb"

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