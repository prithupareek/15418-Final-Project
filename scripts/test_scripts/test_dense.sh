#!/bin/sh

echo "----------------------------------- Testing Dense -----------------------------------"

echo "Testing 1 Thread and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_5000.txt -s 0,0 -g 999,999 -n 5000 -t 1

echo "Testing 2 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_5000.txt -s 0,0 -g 999,999 -n 5000 -t 2

echo "Testing 4 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_5000.txt -s 0,0 -g 999,999 -n 5000 -t 4

echo "Testing 8 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_5000.txt -s 0,0 -g 999,999 -n 5000 -t 8

echo "Testing 16 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_5000.txt -s 0,0 -g 999,999 -n 5000 -t 16

echo "Testing 32 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_5000.txt -s 0,0 -g 999,999 -n 5000 -t 32

echo "Testing 64 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_5000.txt -s 0,0 -g 999,999 -n 5000 -t 64

echo "Testing 128 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_5000.txt -s 0,0 -g 999,999 -n 5000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_110000.txt -s 0,0 -g 999,999 -n 10000 -t 1

echo "Testing 2 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_110000.txt -s 0,0 -g 999,999 -n 10000 -t 2

echo "Testing 4 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_110000.txt -s 0,0 -g 999,999 -n 10000 -t 4

echo "Testing 8 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_110000.txt -s 0,0 -g 999,999 -n 10000 -t 8

echo "Testing 16 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_110000.txt -s 0,0 -g 999,999 -n 10000 -t 16

echo "Testing 32 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_110000.txt -s 0,0 -g 999,999 -n 10000 -t 32

echo "Testing 64 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_110000.txt -s 0,0 -g 999,999 -n 10000 -t 64

echo "Testing 128 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_110000.txt -s 0,0 -g 999,999 -n 10000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_20000.txt -s 0,0 -g 999,999 -n 20000 -t 1

echo "Testing 2 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_20000.txt -s 0,0 -g 999,999 -n 20000 -t 2

echo "Testing 4 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_20000.txt -s 0,0 -g 999,999 -n 20000 -t 4

echo "Testing 8 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_20000.txt -s 0,0 -g 999,999 -n 20000 -t 8

echo "Testing 16 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_20000.txt -s 0,0 -g 999,999 -n 20000 -t 16

echo "Testing 32 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_20000.txt -s 0,0 -g 999,999 -n 20000 -t 32

echo "Testing 64 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_20000.txt -s 0,0 -g 999,999 -n 20000 -t 64

echo "Testing 128 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_20000.txt -s 0,0 -g 999,999 -n 20000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
