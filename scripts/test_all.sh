#!/bin/sh

echo "Testing all maps"
echo "================"

# convert all test_scripts files to executable
chmod +x ~/15418-Final-Project/scripts/test_scripts/*.sh

# run all sh files in the test_scripts directory
for file in ~/15418-Final-Project/scripts/test_scripts/*.sh
do
	echo "Testing $file"
	$file
done
