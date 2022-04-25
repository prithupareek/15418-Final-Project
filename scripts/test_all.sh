#!/bin/sh

echo "Testing all maps"
echo "================"

# convert all test_scripts files to executable
chmod +x test_scripts/*.sh

# run all sh files in the test_scripts directory
for file in test_scripts/*.sh
    echo "Running $file"
    ./$file
done