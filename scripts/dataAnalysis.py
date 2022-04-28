# open a text file
file = open("data.txt", "r")

# list of speedups
speedup_sums = [0, 0, 0, 0, 0, 0, 0, 0]

# line counter
line_count = 0
curr_baseline = 0
num_baseline = 0

# loop through each line in the file
for line in file:
    index = line_count % 8

    # if line_count is divisible by 8, then we are at the start of a new baseline
    if index == 0:
        curr_baseline = float(line)
        num_baseline += 1
        print("Baseline: " + str(curr_baseline))
    
    # calculate the speedup
    speedup = curr_baseline / float(line)

    # add the speedup to the list
    speedup_sums[index] += speedup

    # increment line counter
    line_count += 1

# list of average speedups
avg_speedups = [0, 0, 0, 0, 0, 0, 0, 0]

# calculate the average speedup
for i in range(0, 8):
    avg_speedups[i] = speedup_sums[i] / num_baseline

# print the average speedups array one on each line
for i in range(0, 8):
    print(avg_speedups[i])
