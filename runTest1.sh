#!/bin/bash

apt-get update && apt-get install -y --no-install-recommends wget
mkdir /tmp/study-dir
cd /tmp/study-dir
wget --no-check-certificate https://github.com/phnmnl/container-mtbls-factors-viz/example_json.js

makeParallelCoordsPlot.R -i example_json.js

# check that files were created
if ! [ -e "/tmp/study-dir/factors_plot.pdf" ]; then
	echo "PDF plot file doesn't exist"
	exit 1
fi

echo "All files created successfully"
