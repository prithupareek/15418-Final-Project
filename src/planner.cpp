#include "planner.h"
#include <iostream>

using namespace std;

Planner::Planner()
{
    std::cout << "Created Planner" << std::endl;
}

Planner::Planner(Map &map)
{
    std::cout << "Created Planner with Map" << std::endl;
}

Planner::~Planner()
{
    std::cout << "Destroyed Planner" << std::endl;
}

int Planner::plan(std::vector<double> &start, std::vector<double> &goal, std::vector<std::vector<double>> &path)
{
    std::cout << "Planning" << std::endl;
    return 0;
}