/**
 * @file main.cpp
 * @authors Prithu Pareek & Omkar Savkur
 * @brief Main file for the PRM planner
 * @version 0.1
 * @date 2022-04-04
 *
 * @copyright Copyright (c) 2022
 *
 */

#include <iostream>
#include <omp.h>
#include "planner.h"
#include <chrono>
#include <fstream>

using namespace std::chrono;
typedef std::chrono::high_resolution_clock Clock;
typedef std::chrono::duration<double> dsec;

int main(int argc, char **argv)
{
    
    int opt = 0;
    std::string mapFile = "";
    std::string pathFile = "";
    int numSamples = 2000;
    int numThreads = 1;

    std::vector<int> start = {0, 0};
    std::vector<int> goal = {0, 0};


    do
    {
        opt = getopt(argc, argv, "i:o:s:g:n:h:t:");
        switch (opt)
        {
            case 'i':
                std::cout << "Input file: " << optarg << std::endl;
                mapFile = optarg;
                break;
            case 'o':
                std::cout << "Output file: " << optarg << std::endl;
                pathFile = optarg;
                break;
            case 's':
                std::cout << "Start: " << optarg << std::endl;
                start[0] = atoi(strtok(optarg, ","));
                start[1] = atoi(strtok(NULL, ","));
                break;
            case 'g':
                std::cout << "Goal: " << optarg << std::endl;
                goal[0] = atoi(strtok(optarg, ","));
                goal[1] = atoi(strtok(NULL, ","));
                break;
            case 'n':
                std::cout << "Number of samples: " << optarg << std::endl;
                numSamples = atoi(optarg);
                break;
            case 'h':
                std::cout << "Usage: " << argv[0] << " -i <input_file> -o <output_file> -s <start_x,start_y> -g <goal_x,goal_y> -n <number_of_samples>" << std::endl;
                return 0;
            case 't':
                std::cout << "Number of threads: " << optarg << std::endl;
                numThreads = atoi(optarg);
                break;
        }
    } while(opt != -1);

    // validate arguments
    if (mapFile == "" || pathFile == "")
    {
        std::cout << "Please provide input and output file names" << std::endl;
        std::cout << "Usage: " << argv[0] << " -i <input_file> -o <output_file> -s <start_x,start_y> -g <goal_x,goal_y> -n <number_of_samples>" << std::endl;
        return -1;
    }
    

    // Initialize the map
    Map *map = new Map();
    map->load(mapFile);

    // Initialize the planner
    Planner *planner = new Planner();
    planner->setMap(map);

    planner->setNumSamples(numSamples);

    // Set the start and goal
    planner->setStartState(start);
    planner->setGoalState(goal);

    // start timer
    auto startTime = Clock::now();
    
    // plan the path
    planner->plan(numThreads);
    
    // end timer
    auto endTime = Clock::now();

    // print the time
    double planTime = duration_cast<dsec>(endTime - startTime).count();
    std::cout << "Time taken: " << planTime << " seconds" << std::endl;

    // print the path length
    std::cout << "Path Nodes: " << planner->getPathLength() << std::endl;

    // print the path distance
    std::cout << "Path Distance: " << planner->getPathDistance() << std::endl;

    // save the path to a file
    planner->savePathToFile(pathFile);

    // add stats data to teh test_data.csv file
    std::ofstream outputdatafile;
    outputdatafile.open("test_data.csv", std::ios_base::app);
    // save all stats including planner timing data 
    outputdatafile << mapFile << "," << numSamples << "," << numThreads << "," 
                   << planner->getGenerationTime() << "," << planner->getConnectionTime() << "," 
                   << planner->getQueryTime() << "," << planTime << "," << planner->getPathLength() << "," 
                   << planner->getPathDistance() << std::endl;

    delete map;
    delete planner;
    return 0;
}