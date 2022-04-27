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

typedef struct
{
    int x;
    int y;
} vertex_property_t;

typedef struct
{
    int distance;
    int direction;
} edge_property_t;

#define ADJACENCY_LIST

#ifdef ADJACENCY_LIST
#include <boost/graph/adjacency_list.hpp>
typedef boost::adjacency_list<boost::listS, boost::vecS, boost::undirectedS, vertex_property_t, edge_property_t> Graph;
#elif defined(ADJACENCY_MATRIX)
#include <boost/graph/adjacency_matrix.hpp>
typedef boost::adjacency_matrix<boost::undirectedS> Graph;
#endif

typedef boost::graph_traits<Graph>::vertex_descriptor vertex_t;
typedef boost::graph_traits<Graph>::edge_descriptor edge_t;

// Planner class
class Planner
{
public:
    Planner();
    Planner(Map *map);

    ~Planner();

    void setStartState(std::vector<int> start);
    void setGoalState(std::vector<int> goal);

    int plan(int numThreads);

    void setMap(Map *map);

    void setNumSamples(int numSamples);

    void printGraph();

    void printPath();

    void savePathToFile(std::string fileName);

    int getPathLength();

    int getPathDistance();

private:
    Map *map_;
    Graph graph_;
    int numSamples_;
    double dist_threshold_;

    vertex_t start_vd_;
    vertex_t goal_vd_;

    // start and goal vectors
    std::vector<int> start_;
    std::vector<int> goal_;

    // path vector
    std::vector<std::vector<int> > path_;

    int generationPhase(int numThreads);
    int connectionPhase();
    int queryPhase(int numThreads);
    int interpolate(std::vector<vertex_t> &waypoints);

    int connectVertex(vertex_t vd);

    vertex_t addAndConnectVertex(std::vector<int> point, int &status);

    // int astar(std::vector<vertex_t> &waypoints);
    int astar_parallel(std::vector<vertex_t> &waypoints, int numThreads);
};

#endif /* PLANNER_H */