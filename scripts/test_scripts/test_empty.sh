#!/bin/sh

echo "----------------------------------- Testing Empty -----------------------------------"

echo "Testing 1 Thread and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_5000.txt -s 0,0 -g 999,999 -n 5000 -t 1

echo "Testing 2 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_5000.txt -s 0,0 -g 999,999 -n 5000 -t 2

echo "Testing 4 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_5000.txt -s 0,0 -g 999,999 -n 5000 -t 4

echo "Testing 8 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_5000.txt -s 0,0 -g 999,999 -n 5000 -t 8

echo "Testing 16 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_5000.txt -s 0,0 -g 999,999 -n 5000 -t 16

echo "Testing 32 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_5000.txt -s 0,0 -g 999,999 -n 5000 -t 32

echo "Testing 64 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_5000.txt -s 0,0 -g 999,999 -n 5000 -t 64

echo "Testing 128 Threads and 5,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_5000.txt -s 0,0 -g 999,999 -n 5000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_10000.txt -s 0,0 -g 999,999 -n 10000 -t 1

echo "Testing 2 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_10000.txt -s 0,0 -g 999,999 -n 10000 -t 2

echo "Testing 4 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_10000.txt -s 0,0 -g 999,999 -n 10000 -t 4

echo "Testing 8 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_10000.txt -s 0,0 -g 999,999 -n 10000 -t 8

echo "Testing 16 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_10000.txt -s 0,0 -g 999,999 -n 10000 -t 16

echo "Testing 32 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_10000.txt -s 0,0 -g 999,999 -n 10000 -t 32

echo "Testing 64 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_10000.txt -s 0,0 -g 999,999 -n 10000 -t 64

echo "Testing 128 Threads and 10,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_10000.txt -s 0,0 -g 999,999 -n 10000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_20000.txt -s 0,0 -g 999,999 -n 20000 -t 1

echo "Testing 2 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_20000.txt -s 0,0 -g 999,999 -n 20000 -t 2

echo "Testing 4 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_20000.txt -s 0,0 -g 999,999 -n 20000 -t 4

echo "Testing 8 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_20000.txt -s 0,0 -g 999,999 -n 20000 -t 8

echo "Testing 16 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_20000.txt -s 0,0 -g 999,999 -n 20000 -t 16

echo "Testing 32 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_20000.txt -s 0,0 -g 999,999 -n 20000 -t 32

echo "Testing 64 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_20000.txt -s 0,0 -g 999,999 -n 20000 -t 64

echo "Testing 128 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_20000.txt -s 0,0 -g 999,999 -n 20000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
