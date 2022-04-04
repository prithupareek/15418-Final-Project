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
    map->load("../maps/basic_10x10.txt", 10, 10);
    map->print();

    // Initialize the planner
    Planner *planner = new Planner();

    delete map;
    delete planner;
    return 0;
}