#!/bin/sh

echo "----------------------------------- Testing Large -----------------------------------"

echo "Testing 1 Thread and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_1_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 1

echo "Testing 2 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_2_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 2

echo "Testing 4 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_4_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 4

echo "Testing 8 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_8_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 8

echo "Testing 16 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_16_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 16

echo "Testing 32 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_32_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 32

echo "Testing 64 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_64_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 64

echo "Testing 128 Threads and 20,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_128_20000.txt -s 0,0 -g 1999,1999 -n 20000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_1_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 1

echo "Testing 2 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_2_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 2

echo "Testing 4 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_4_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 4

echo "Testing 8 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_8_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 8

echo "Testing 16 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_16_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 16

echo "Testing 32 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_32_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 32

echo "Testing 64 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_64_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 64

echo "Testing 128 Threads and 40,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_128_40000.txt -s 0,0 -g 1999,1999 -n 40000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_1_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 1

echo "Testing 2 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_2_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 2

echo "Testing 4 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_4_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 4

echo "Testing 8 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_8_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 8

echo "Testing 16 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_16_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 16

echo "Testing 32 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_32_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 32

echo "Testing 64 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_64_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 64

echo "Testing 128 Threads and 80,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Large.txt -o ~/15418-Final-Project/paths/tests/size/Large_128_80000.txt -s 0,0 -g 1999,1999 -n 80000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
