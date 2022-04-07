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

    planner->setNumSamples(6000);

    // Set the start and goal
    std::vector<int> start = {0, 0};
    std::vector<int> goal = {1279, 719};

    // create the path vector
    std::vector<std::vector<int> > path;

    // plan the path
    planner->plan(start, goal, path);

    // print the graph
    // planner->printGraph();

    // print the path
    std::cout << "PATH: " << std::endl;
    for (auto v : path)
    {
        std::cout << "(" << v[0] << "," << v[1] << ")" << std::endl;
    }
    std::cout << std::endl;

    delete map;
    delete planner;
    return 0;
}