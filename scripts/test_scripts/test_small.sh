#!/bin/sh

echo "----------------------------------- Testing Small -----------------------------------"

echo "Testing 1 Thread and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_1_5000.txt -s 0,0 -g 499,499 -n 5000 -t 1

echo "Testing 2 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_2_5000.txt -s 0,0 -g 499,499 -n 5000 -t 2

echo "Testing 4 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_4_5000.txt -s 0,0 -g 499,499 -n 5000 -t 4

echo "Testing 8 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_8_5000.txt -s 0,0 -g 499,499 -n 5000 -t 8

echo "Testing 16 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_16_5000.txt -s 0,0 -g 499,499 -n 5000 -t 16

echo "Testing 32 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_32_5000.txt -s 0,0 -g 499,499 -n 5000 -t 32

echo "Testing 64 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_64_5000.txt -s 0,0 -g 499,499 -n 5000 -t 64

echo "Testing 128 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_128_5000.txt -s 0,0 -g 499,499 -n 5000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_1_12500.txt -s 0,0 -g 499,499 -n 12500 -t 1

echo "Testing 2 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_2_12500.txt -s 0,0 -g 499,499 -n 12500 -t 2

echo "Testing 4 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_4_12500.txt -s 0,0 -g 499,499 -n 12500 -t 4

echo "Testing 8 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_8_12500.txt -s 0,0 -g 499,499 -n 12500 -t 8

echo "Testing 16 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_16_12500.txt -s 0,0 -g 499,499 -n 12500 -t 16

echo "Testing 32 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_32_12500.txt -s 0,0 -g 499,499 -n 12500 -t 32

echo "Testing 64 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_64_12500.txt -s 0,0 -g 499,499 -n 12500 -t 64

echo "Testing 128 Threads and 12,500 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_128_12500.txt -s 0,0 -g 499,499 -n 12500 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_1_25000.txt -s 0,0 -g 499,499 -n 25000 -t 1

echo "Testing 2 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_2_25000.txt -s 0,0 -g 499,499 -n 25000 -t 2

echo "Testing 4 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_4_25000.txt -s 0,0 -g 499,499 -n 25000 -t 4

echo "Testing 8 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_8_25000.txt -s 0,0 -g 499,499 -n 25000 -t 8

echo "Testing 16 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_16_25000.txt -s 0,0 -g 499,499 -n 25000 -t 16

echo "Testing 32 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_32_25000.txt -s 0,0 -g 499,499 -n 25000 -t 32

echo "Testing 64 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_64_25000.txt -s 0,0 -g 499,499 -n 25000 -t 64

echo "Testing 128 Threads and 25,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Small.txt -o ~/15418-Final-Project/paths/tests/size/Small_128_25000.txt -s 0,0 -g 499,499 -n 25000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
