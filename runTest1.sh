#!/bin/bash

mkdir /tmp/study-dir
cd /tmp/study-dir

makeParallelCoordsPlot.R -i /files/galaxy/tools/visualizations/test-data/example.json

# check that files were created
if ! [ -e "/tmp/study-dir/factors_plot.pdf" ]; then
	echo "PDF plot file doesn't exist"
	exit 1
fi

echo "All files created successfully"
