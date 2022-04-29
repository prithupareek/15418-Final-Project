#!/bin/sh

echo "----------------------------------- Testing Xlarge -----------------------------------"

echo "Testing 1 Thread and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_1_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 1

echo "Testing 2 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_2_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 2

echo "Testing 4 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_4_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 4

echo "Testing 8 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_8_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 8

echo "Testing 16 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_16_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 16

echo "Testing 32 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_32_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 32

echo "Testing 64 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_64_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 64

echo "Testing 128 Threads and 562,700 samples"
~/15418-Final-Project/src/planner -i ~/15418-Final-Project/maps/tests/size/Xlarge.txt -o ~/15418-Final-Project/paths/tests/size/Xlarge_128_562700.txt -s 0,0 -g 9999,5626 -n 562700 -t 128

echo "--------------------------------------------------------------------------------"
echo "Done."
