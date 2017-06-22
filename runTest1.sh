#!/bin/bash

apk -U add wget ca-certificates
mkdir /tmp/study-dir
cd /tmp/study-dir
wget https://raw.githubusercontent.com/phnmnl/container-mtbls-factors-viz/develop/example_json.js 

makeParallelCoordsPlot.R -i example_json.js

# check that files were created
if ! [ -e "/tmp/study-dir/factors_plot.pdf" ]; then
	echo "PDF plot file doesn't exist"
	exit 1
fi

echo "All files created successfully"
