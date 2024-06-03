#!/bin/bash

# MBSAQIP: Create figures without watermarks

## datalad run --dry-run basic -i data/raw/mbsa-qip -o notebook -o docs -o data/analysis/bariatric -m "Multiple runs via Datalad" 'code/shell/papermill/bariatric_publish.sh'

# Setup
#------------------------
T="$(date +%s)"
start_time=$(date +"%s")

cd /home/pranav/work/pranavmishra90/courses/by-mishra/research-data-management

# Papermill and Quarto
#------------------------
echo 'Started at ' $(date +"%F-%H-%M-%S")
echo '----------------------------------'

echo "Starting analysis and preparing PUBLICATION figures for the MBSA-QIP Dataset"
echo ""
echo ""

rm "./code/jupyter/papermill_tmp/bariatric_papermill.ipynb"

papermill "./code/jupyter/bariatric_papermill.ipynb" "./code/jupyter/papermill_tmp/bariatric_papermill.ipynb" -p watermarks False

# Quarto
#------------------------

echo "Rendering the notebook"
echo ""
quarto render .

T="$(($(date +%s) - T))"
minutes=$((T / 60))

echo '------------------------------------------------'
echo 'Ended at ' $(date +"%F-%H-%M-%S")
echo "It took ${minutes} minutes to complete"
echo ""
echo "Done."


