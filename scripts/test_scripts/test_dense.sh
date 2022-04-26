#!/bin/sh

echo "----------------------------------- Testing Dense -----------------------------------"

echo "Testing 1 Thread and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 1

echo "Testing 2 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 2

echo "Testing 4 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 4

echo "Testing 8 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 8

echo "Testing 16 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 16

echo "Testing 32 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 32

echo "Testing 64 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 64

echo "Testing 128 Threads and 500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_500000.txt -s 0,0 -g 4999,4250 -n 500000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 1

echo "Testing 2 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 2

echo "Testing 4 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 4

echo "Testing 8 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 8

echo "Testing 16 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 16

echo "Testing 32 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 32

echo "Testing 64 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 64

echo "Testing 128 Threads and 1,250,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_1250000.txt -s 0,0 -g 4999,4250 -n 1250000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Testing 1 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_1_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 1

echo "Testing 2 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_2_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 2

echo "Testing 4 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_4_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 4

echo "Testing 8 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_8_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 8

echo "Testing 16 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_16_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 16

echo "Testing 32 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_32_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 32

echo "Testing 64 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_64_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 64

echo "Testing 128 Threads and 2,500,000 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/density/Dense.txt -o ~/15418-Final-Project/paths/tests/density/Dense_128_2500000.txt -s 0,0 -g 4999,4250 -n 2500000 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
