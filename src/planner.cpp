#include "planner.h"
#include <iostream>

using namespace std;
#include <boost/version.hpp>

Planner::Planner()
{
    std::cout << "Created Planner" << std::endl;
    std::cout << "Using Boost "     
          << BOOST_VERSION / 100000     << "."  // major version
          << BOOST_VERSION / 100 % 1000 << "."  // minor version
          << BOOST_VERSION % 100                // patch level
          << std::endl;
    // this->graph_ = NULL;
    this->numSamples_ = 0;
    srand(time(0));
}

Planner::Planner(Map *map)
{
    std::cout << "Created Planner with Map" << std::endl;
    this->setMap(map);
}

Planner::~Planner()
{
    // if (this->graph_ != NULL)
    // {
    //     delete this->graph_;
    // }
    std::cout << "Destroyed Planner" << std::endl;
}

void Planner::setNumSamples(int numSamples)
{
    this->numSamples_ = numSamples;
}

void Planner::printGraph()
{
    for (auto vd : boost::make_iterator_range(vertices(this->graph_)))
    {
        std::cout << "Vertex: " << this->graph_[vd].x << "," << this->graph_[vd].y << std::endl;
    }
}

int Planner::plan(std::vector<int> &start, std::vector<int> &goal, std::vector<std::vector<int>> &path)
{
    std::cout << "Planning" << std::endl;
    if (this->generationPhase() != 0)
    {
        std::cout << "Generation failed" << std::endl;
        return -1;
    }
    if (this->connectionPhase() != 0)
    {
        std::cout << "Connection failed" << std::endl;
        return -1;
    }
    if (this->queryPhase(path) != 0)
    {
        std::cout << "Query failed" << std::endl;
        return -1;
    }
    return 0;
}

void Planner::setMap(Map *map)
{
    this->map_ = map;
    map->print();
}

int Planner::generationPhase()
{
    if (this->numSamples_ == 0)
    {
        std::cout << "numSamples is 0" << std::endl;
        return -1;
    }

    std::cout << "Sampling " << this->numSamples_ << " points" << std::endl;

    // Initialize graph to empty
    this->graph_ = Graph();
    for (int i = 0; i < this->numSamples_; i++)
    {
        bool pointIsFree = false;
        vertex_property_t vp;
        do {
            // pick a random x and y from the map
            vp.x = rand() % this->map_->getWidth();
            vp.y = rand() % this->map_->getHeight();
            pointIsFree = this->map_->isFree(vp.x, vp.y);
        } while (!pointIsFree);

        // add vertex to graph
        vertex_t v = boost::add_vertex(this->graph_);
        this->graph_[v] = vp;
    }

    return 0;
}

int Planner::connectionPhase()
{
    return 0;
}

int Planner::queryPhase(std::vector<std::vector<int>> &path)
{
    return 0;
}