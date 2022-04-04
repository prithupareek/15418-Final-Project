/**
 * @file planner.h
 * @authors Prithu Pareek & Omkar Savkur
 * @brief Header file for planner class
 * @version 0.1
 * @date 2022-04-04
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#ifndef PLANNER_H
#define PLANNER_H

#include <vector>
#include "map.h"

#define ADJACENCY_LIST

#ifdef ADJACENCY_LIST
    #include <boost/graph/adjacency_list.hpp>
    typedef boost::adjacency_list<boost::undirectedS> Graph;
#elif defined(ADJACENCY_MATRIX)
    #include <boost/graph/adjacency_matrix.hpp>
    typedef boost::adjacency_matrix<boost::undirectedS> Graph;
#endif

// Planner class
class Planner
{
public:
    Planner();
    Planner(Map &map);

    ~Planner();

    int plan(std::vector<double> &start, std::vector<double> &goal, std::vector<std::vector<double>> &path);

    void setMap(Map &map);

private:
    Map *map_;
    Graph *graph_;
    
    int generationPhase();
    int connectionPhase();
    int queryPhase(std::vector<std::vector<double>> &path);
};


#endif /* PLANNER_H */