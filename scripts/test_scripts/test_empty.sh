#!/bin/sh

echo "----------------------------------- Testing Empty -----------------------------------"

echo "Testing 1 Thread and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 1

echo "Testing 2 Threads and 1000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 2

echo "Testing 4 Threads and 1000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 4

echo "Testing 8 Threads and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 8

echo "Testing 16 Threads and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 16

echo "Testing 32 Threads and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 32

echo "Testing 64 Threads and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 64

echo "Testing 128 Threads and 100,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_100000.txt -s 0,0 -g 2499,2499 -n 100000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 1

echo "Testing 2 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 2

echo "Testing 4 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 4

echo "Testing 8 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 8

echo "Testing 16 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 16

echo "Testing 32 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 32

echo "Testing 64 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 64

echo "Testing 128 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_500000.txt -s 0,0 -g 2499,2499 -n 500000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_1_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 1

echo "Testing 2 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_2_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 2

echo "Testing 4 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_4_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 4

echo "Testing 8 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_8_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 8

echo "Testing 16 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_16_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 16

echo "Testing 32 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_32_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 32

echo "Testing 64 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_64_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 64

echo "Testing 128 Threads and 1,000,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Empty.txt -o ~/15418-Final-Project/paths/tests/density/Empty_128_1000000.txt -s 0,0 -g 2499,2499 -n 1000000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
