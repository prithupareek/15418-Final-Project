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
    this->dist_threshold_ = 5.0;
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

    for (auto ed : boost::make_iterator_range(edges(this->graph_)))
    {
        std::cout << "Edge: " << source(ed, this->graph_) << "," << target(ed, this->graph_) << std::endl;
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
    // For each vertex, connect vertex to its k closest neighbors
    for (auto vd : boost::make_iterator_range(vertices(this->graph_)))
    {  
        // find a list of k closest vertices
        std::vector<vertex_t> k_closest_vertices;

        for (auto vd2 : boost::make_iterator_range(vertices(this->graph_)))
        {
            if (vd == vd2)
            {
                continue;
            }
            vertex_property_t vp1 = this->graph_[vd];
            vertex_property_t vp2 = this->graph_[vd2];
            double distance = this->map_->getDistance(vp1.x, vp1.y, vp2.x, vp2.y);
            if (distance < this->dist_threshold_)
            {
                k_closest_vertices.push_back(vd2);
            }
        }

        // for each vertex in list
        for (auto vd2 : k_closest_vertices)
        {
            // check for a collision free edge between the two vertices
            vertex_property_t vp1 = this->graph_[vd];
            vertex_property_t vp2 = this->graph_[vd2];

            int direction = this->map_->canConnect(vp1.x, vp1.y, vp2.x, vp2.y);

            if (direction != CANT_CONNECT)
            {
                edge_t e = boost::add_edge(vd, vd2, this->graph_).first;
                this->graph_[e].distance = this->map_->getDistance(vp1.x, vp1.y, vp2.x, vp2.y);
                this->graph_[e].direction = direction;
            }
        }
    }

    return 0;
}

int Planner::queryPhase(std::vector<std::vector<int>> &path)
{
    return 0;
}