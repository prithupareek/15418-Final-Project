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
#include "planner.h"

// print the path
// void printPathWaypoints(std::vector<std::vector<int>> path) {
//     std::cout << "PATH: " << std::endl;
//     for (auto v : path)
//     {
//         std::cout << "(" << v[0] << "," << v[1] << ")" << std::endl;
//     }
//     std::cout << std::endl;
// }

// // print the full path
// void printFullPath(std::vector<std::vector<int>> path) {
//     std::cout << "FULL PATH: " << std::endl;
//     for (auto v : path)
//     {
//         std::cout << "(" << v[0] << "," << v[1] << ")" << std::endl;

//         // print the points between the two waypoints

//     }
//     std::cout << std::endl;
// }


int main(int argc, char **argv)
{
    
    // Initialize the map
    Map *map = new Map();
    // map->load("../maps/basic_10x10.txt", 10, 10);
    map->load("../maps/large1_1280x720.txt", 1280, 720);
    // map->print();

    // Initialize the planner
    Planner *planner = new Planner();
    planner->setMap(map);

    planner->setNumSamples(8000);

    // Set the start and goal
    std::vector<int> start = {0, 0};
    std::vector<int> goal = {1279, 719};
    planner->setStartState(start);
    planner->setGoalState(goal);


    // plan the path
    planner->plan();

    // print the graph
    // planner->printGraph();

    // print the path waypoints
    planner->printPath();

    // save the path to a file
    planner->savePathToFile("../paths/large1_1280x720.txt");

    

    delete map;
    delete planner;
    return 0;
}