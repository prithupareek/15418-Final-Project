#include "planner.h"
#include <iostream>
#include <queue>
#include "node.h"
#include <unordered_set>
#include <fstream>
#include <omp.h>
#include <chrono>
#include <mutex>

using namespace std;
#include <boost/version.hpp>

Planner::Planner()
{
    std::cout << "Created Planner" << std::endl;
    std::cout << "Using Boost "
              << BOOST_VERSION / 100000 << "."     // major version
              << BOOST_VERSION / 100 % 1000 << "." // minor version
              << BOOST_VERSION % 100               // patch level
              << std::endl;
    // this->graph_ = NULL;
    this->numSamples_ = 0;
    srand(time(0));
    this->dist_threshold_ = 25.0;
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

void Planner::printPath()
{
    std::cout << "PATH: " << std::endl;
    for (auto v : this->path_)
    {
        std::cout << "(" << v[0] << "," << v[1] << ")" << std::endl;
    }
    std::cout << std::endl;
}

int Planner::getPathLength()
{
    return this->path_.size();
}

int Planner::getPathDistance()
{
    int distance = 0;

    // reutrn 0 if path is empty
    if (this->path_.size() == 0)
    {
        return 0;
    }

    // loop over the path and use the distance between each node to calculate the total distance
    for (size_t i = 0; i < this->path_.size() - 1; i++)
    {
        // get the current point x and y
        int x1 = this->path_[i][0];
        int y1 = this->path_[i][1];

        // get the next point x and y
        int x2 = this->path_[i + 1][0];
        int y2 = this->path_[i + 1][1];

        // calculate the distance between the two points
        distance += this->map_->getDistance(x1, y1, x2, y2);
    }

    return distance;
}

// get timing information for connection, generation, and query
double Planner::getConnectionTime()
{
    return this->connection_time_;
}

double Planner::getGenerationTime()
{
    return this->generation_time_;
}

double Planner::getQueryTime()
{
    return this->query_time_;
}

// save path to file
void Planner::savePathToFile(std::string filename)
{
    std::ofstream outfile;
    outfile.open(filename);
    for (auto v : this->path_)
    {
        outfile << "(" << v[0] << "," << v[1] << ")" << std::endl;
    }
    outfile.close();
}


// set start state
void Planner::setStartState(std::vector<int> start)
{
    this->start_ = start;
}

// set goal state
void Planner::setGoalState(std::vector<int> goal)
{
    this->goal_ = goal;
}

int Planner::plan(int numThreads)
{
    // Set the number of threads for the parallel region
    omp_set_num_threads(numThreads);
    std::cout << "Planning" << std::endl;

    // clear the path
    this->path_.clear();

    // time generation phase
    auto start = std::chrono::high_resolution_clock::now();
    if (this->generationPhase(numThreads) != 0)
    {
        std::cout << "Generation failed" << std::endl;
        return -1;
    }
    auto end = std::chrono::high_resolution_clock::now();
    // save the time it took to generate the graph
    this->generation_time_ = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    std::cout << "Generation time: " << this->generation_time_ << "ns" << std::endl;

    // time connection phase
    start = std::chrono::high_resolution_clock::now();
    if (this->connectionPhase() != 0)
    {
        std::cout << "Connection failed" << std::endl;
        return -1;
    }
    end = std::chrono::high_resolution_clock::now();
    // save the time it took to connect the graph
    this->connection_time_ = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    std::cout << "Connection time: " << this->connection_time_ << "ns" << std::endl;
    
    // time query phase
    start = std::chrono::high_resolution_clock::now();
    if (this->queryPhase(numThreads) != 0)
    {
        std::cout << "Query failed" << std::endl;
        return -1;
    }
    end = std::chrono::high_resolution_clock::now();
    // save the time it took to query the graph
    this->query_time_ = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
    std::cout << "Query time: " << this->query_time_ << "ns" << std::endl;
    
    return 0;
}

void Planner::setMap(Map *map)
{
    this->map_ = map;
}

int Planner::generationPhase(int numThreads)
{
    if (this->numSamples_ == 0)
    {
        std::cout << "numSamples is 0" << std::endl;
        return -1;
    }

    std::cout << "Sampling " << this->numSamples_ << " points" << std::endl;

    // print width and height of map
    std::cout << "Map width: " << this->map_->getWidth() << std::endl;
    std::cout << "Map height: " << this->map_->getHeight() << std::endl;

    // Initialize graph the size of num samples
    this->graph_ = Graph(this->numSamples_);

    int mapWidth = this->map_->getWidth();
    int mapHeight = this->map_->getHeight();

    // int chunk_size = (this->numSamples_ + numThreads - 1) / numThreads;

    #pragma omp parallel for schedule(dynamic)
    for (int i = 0; i < this->numSamples_; i++)
    {        

        bool pointIsFree = false;
        vertex_property_t vp;
        int count = 0;
        do
        {
            // pick a random x and y from the map
            vp.x = rand() % mapWidth;
            vp.y = rand() % mapHeight;
            pointIsFree = ((this->map_)->isFree)(vp.x, vp.y);
            count++;
        } while (!pointIsFree);
        // add vertex to graph
        this->graph_[i] = vp;
    }

    return 0;
}

int Planner::connectionPhase()
{
    // For each vertex, connect vertex to its closest neighbors
    #pragma omp parallel for schedule(static)
    for (int vd = 0; vd < this->numSamples_; vd++)
    {
        this->connectVertex(vd);
    }

    return 0;
}

int Planner::connectVertex(vertex_t vd)
{

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
            // check for a collision free edge between the two vertices
            int direction = this->map_->canConnect(vp1.x, vp1.y, vp2.x, vp2.y);

            if (direction != CANT_CONNECT)
            {
                edge_t e;
                // #pragma omp critical
                // {
                    e = boost::add_edge(vd, vd2, this->graph_).first;
                // }
                this->graph_[e].distance = this->map_->getDistance(vp1.x, vp1.y, vp2.x, vp2.y);
                this->graph_[e].direction = direction;
            }
        }
    }

    return 0;
}

vertex_t Planner::addAndConnectVertex(std::vector<int> point, int &status)
{
    // check if the point is free
    if (!this->map_->isFree(point[0], point[1]))
    {
        status = -1;
        return 0;
    }

    vertex_property_t vp;
    vp.x = point[0];
    vp.y = point[1];

    // add vertex to graph
    vertex_t vd = boost::add_vertex(this->graph_);
    this->graph_[vd] = vp;

    // connect the vertex
    // NOTE this algo has been modified from the original.
    // Here we connect to all k nearest vertices, in the original only the closest is connected.
    this->connectVertex(vd);

    return vd;
}

int Planner::queryPhase(int numThreads)
{
    // Add the start and goal vertex to the graph
    int status = 0;
    this->start_vd_ = addAndConnectVertex(this->start_, status);
    if (status == -1)
    {
        std::cout << "Invalid Start State. Planning Failed." << std::endl;
        return -1;
    }

    this->goal_vd_ = addAndConnectVertex(this->goal_, status);
    if (status == -1)
    {
        std::cout << "Invalid Goal State. Planning Failed." << std::endl;
        return -1;
    }

    // create the waypoint vector
    std::vector<vertex_t> waypoints;

    std::cout << "Starting A*" << std::endl;

    // Try and find a path from start to goal
    this->astar_parallel(waypoints, numThreads);

    if (waypoints.size() == 0)
    {
        std::cout << "No path found. Planning Failed." << std::endl;
        return -1;
    }

    // interpolate the path
    this->interpolate(waypoints);

    return 0;
}

/*
int Planner::astar(std::vector<vertex_t> &waypoints)
{

    vertex_property_t start_properties = this->graph_[this->start_vd_];
    vertex_property_t goal_properties = this->graph_[this->goal_vd_];

    // Create the open list
    priority_queue<AstarNode *, vector<AstarNode *>, OpenListNodeComparator> openList = priority_queue<AstarNode *, vector<AstarNode *>, OpenListNodeComparator>();

    // create the start and goal nodes
    int start_h = this->map_->getDistance(start_properties.x, start_properties.y, goal_properties.x, goal_properties.y);
    AstarNode *startNode = new AstarNode(this->start_vd_, 0, start_h, NULL);
    AstarNode *goalNode = new AstarNode(this->goal_vd_, -1, 0, NULL);
    // int path_size = -1;
    (void)goalNode;

    // add the start node to the open list
    openList.push(startNode);

    // Create the closed list
    unordered_set<AstarNode *, NodeHasher, ClosedListNodeComparator> closedList = unordered_set<AstarNode *, NodeHasher, ClosedListNodeComparator>();

    // while the open list is not empty
    while (!openList.empty())
    {
        // get node with smalled f-value
        AstarNode *currNode = openList.top();
        openList.pop();

        // keep removing until node not in closed list
        if (closedList.find(currNode) != closedList.end())
        {
            continue;
        }

        // insert into the closed list
        closedList.insert(currNode);

        // check if we have reached the goal stage
        if (currNode->vertexDescriptor == this->goal_vd_)
        {
            cout << this->goal_vd_ << std::endl;
            cout << "We have Reached the Goal!!!" << endl;
            goalNode = currNode;
            break;
        }

        // get the vertex descriptor of the current node
        vertex_t currNodeVD = currNode->vertexDescriptor;

        // get neighbors
        auto neighbors = boost::adjacent_vertices(currNode->vertexDescriptor, this->graph_);

        // for each neighbor
        for (vertex_t vd : make_iterator_range(neighbors))
        {
            edge_t e = boost::edge(currNodeVD, vd, this->graph_).first;

            vertex_property_t vdPos = this->graph_[vd];

            // calculate f value
            int newG = currNode->gValue + this->graph_[e].distance;
            int newH = this->map_->getDistance(vdPos.x, vdPos.y, goal_properties.x, goal_properties.y);

            // construct the node
            AstarNode *newNode = new AstarNode(vd, newG, newH, currNode);

            // if node already in closed list then skip
            if (closedList.find(newNode) == closedList.end())
            {
                openList.push(newNode);
            }
        }
    }

    // check if found path
    if (goalNode->parent == NULL)
    {
        cout << "No Path Found" << endl;
        return -1;
    }

    // construct the path
    AstarNode *currNode = goalNode;
    while (currNode != NULL)
    {
        waypoints.push_back(currNode->vertexDescriptor);
        currNode = currNode->parent;
    }

    // reverse the path
    reverse(waypoints.begin(), waypoints.end());

    return 0;
}
*/

int hash_fn(AstarNode *startNode, int numThreads)
{
    return startNode->vertexDescriptor % numThreads;
}

bool isOpenListEmpty(priority_queue<AstarNode *, vector<AstarNode *>, OpenListNodeComparator> *openLists, int procID, std::mutex *openListsMutex)
{
    openListsMutex[procID].lock();
    int ret = openLists[procID].empty();    
    openListsMutex[procID].unlock();
    return ret;
}

int isNodeInClosedList(unordered_set<AstarNode *, NodeHasher, ClosedListNodeComparator> *closedLists, int procID, AstarNode *node, std::mutex *closedListsMutex)
{
    closedListsMutex[procID].lock();
    int ret = (closedLists[procID].find(node) != closedLists[procID].end());
    closedListsMutex[procID].unlock();
    return ret;
}

bool allOpenListsEmpty(bool *threadDone, int numThreads)
{
    for (int i = 0; i < numThreads; i++)
    {
        if (!threadDone[i]) 
        {
            return false;
        }
    }
    return true;
}

int Planner::astar_parallel(std::vector<vertex_t> &waypoints, int numThreads)
{

    vertex_property_t start_properties = this->graph_[this->start_vd_];
    vertex_property_t goal_properties = this->graph_[this->goal_vd_];

    bool threadDone[numThreads];

    // Create the open lists
    priority_queue<AstarNode *, vector<AstarNode *>, OpenListNodeComparator> openLists[numThreads];
    std::mutex openListsMutex[numThreads];

    // Create the closed list
    unordered_set<AstarNode *, NodeHasher, ClosedListNodeComparator> closedLists[numThreads];
    std::mutex closedListsMutex[numThreads];
    
    for (int i = 0; i < numThreads; i++)
    {
        openLists[i] = priority_queue<AstarNode *, vector<AstarNode *>, OpenListNodeComparator>();
        closedLists[i] = unordered_set<AstarNode *, NodeHasher, ClosedListNodeComparator>();
    }

    // create the start and goal nodes
    int start_h = this->map_->getDistance(start_properties.x, start_properties.y, goal_properties.x, goal_properties.y);
    AstarNode *startNode = new AstarNode(this->start_vd_, 0, start_h, NULL);
    AstarNode *goalNode = NULL;
    (void)goalNode;

    // add the start node to the open list
    int firstProc = hash_fn(startNode, numThreads);
    openListsMutex[firstProc].lock();
    openLists[firstProc].push(startNode);    
    openListsMutex[firstProc].unlock();

    int procID;
    #pragma omp parallel default(shared) private(procID)
    {
        procID = omp_get_thread_num();
        do
        {
            threadDone[procID] = false;
            // while the open list is not empty
            while (!isOpenListEmpty(openLists, procID, openListsMutex))
            {
                // get node with smalled f-value
                openListsMutex[procID].lock();
                AstarNode *currNode = openLists[procID].top();
                openLists[procID].pop();
                openListsMutex[procID].unlock();

                // keep removing until node not in closed list
                if (isNodeInClosedList(closedLists, procID, currNode, closedListsMutex))
                {
                    continue;
                }

                // insert into the closed list
                closedListsMutex[procID].lock();
                closedLists[procID].insert(currNode);
                closedListsMutex[procID].unlock();

                // check if we have reached the goal stage
                if (currNode->vertexDescriptor == this->goal_vd_)
                {
                    cout << this->goal_vd_ << std::endl;
                    cout << "We have Reached the Goal!!!" << endl;
                    goalNode = currNode;
                    break;
                }

                // get the vertex descriptor of the current node
                vertex_t currNodeVD = currNode->vertexDescriptor;

                // get neighbors
                auto neighbors = boost::adjacent_vertices(currNode->vertexDescriptor, this->graph_);

                // for each neighbor
                for (vertex_t vd : make_iterator_range(neighbors))
                {
                    edge_t e = boost::edge(currNodeVD, vd, this->graph_).first;

                    vertex_property_t vdPos = this->graph_[vd];

                    // calculate f value
                    int newG = currNode->gValue + this->graph_[e].distance;
                    int newH = this->map_->getDistance(vdPos.x, vdPos.y, goal_properties.x, goal_properties.y);

                    // construct the node
                    AstarNode *newNode = new AstarNode(vd, newG, newH, currNode);
                    int hashedProc = hash_fn(newNode, numThreads);

                    // if node already in closed list then skip                
                    if (!isNodeInClosedList(closedLists, hashedProc, newNode, closedListsMutex))
                    {
                        openListsMutex[hashedProc].lock();
                        openLists[hashedProc].push(newNode);
                        openListsMutex[hashedProc].unlock();
                    } else {
                        delete newNode;
                    }
                }
            }

            
            #pragma omp barrier
            threadDone[procID] = isOpenListEmpty(openLists, procID, openListsMutex);
            if (goalNode != NULL)
            {
                threadDone[procID] = true;
            }

            #pragma omp barrier
        } while (!allOpenListsEmpty(threadDone, numThreads));
    }

    cout << "All threads exited" << endl;
    bool no_path_found = false;

    // check if found path
    if (goalNode == NULL)
    {
        cout << "No Path Found" << endl;
        no_path_found = true;
    }

    if (!no_path_found)
    {
        // construct the path
        AstarNode *currNode = goalNode;
        std::cout << "Path Found" << std::endl;
        while (currNode != NULL)
        {
            waypoints.push_back(currNode->vertexDescriptor);
            currNode = currNode->parent;
        }
    }

    for (int i = 0; i < numThreads; i++)
    {
        while (openLists[i].size() > 0)
        {
            AstarNode *node = openLists[i].top();
            openLists[i].pop();
            delete node;
        }


        for (auto it = closedLists[i].begin(); it != closedLists[i].end(); ++it )
        {
            AstarNode *node = *it;
            delete node;
        }

        while (closedLists[i].size() > 0)
        {
            closedLists[i].erase(closedLists[i].begin());
        }
        
    }


    // reverse the path
    reverse(waypoints.begin(), waypoints.end());

    return !no_path_found;
}

// interpolate the path
int Planner::interpolate(std::vector<vertex_t> &waypoints)
{   
    // hold curr and prev waypoint
    vertex_t currWaypoint;
    vertex_t nextWaypoint;


    // for each waypoint starting at index 1
    for (size_t i = 0; i < waypoints.size(); i++)
    {
        // get the current waypoint
        currWaypoint = waypoints[i];

        // get the x and y of the current waypoint
        int currWaypointX = this->graph_[currWaypoint].x;
        int currWaypointY = this->graph_[currWaypoint].y;

        // push the x and y of the current waypoint onto the path as a vector
        this->path_.push_back({currWaypointX, currWaypointY});

        // if the current waypoint is the last waypoint then break
        if (i == waypoints.size() - 1)
        {
            break;
        }

        // get the next waypoint
        nextWaypoint = waypoints[i + 1];

        // get the x and y of the next waypoint
        int nextWaypointX = this->graph_[nextWaypoint].x;
        int nextWaypointY = this->graph_[nextWaypoint].y;

        // get the edge between the current and next waypoint
        edge_t e = boost::edge(currWaypoint, nextWaypoint, this->graph_).first;
        
        // get the direction of the edge
        int direction = this->graph_[e].direction;

        // calculate stepx and stepy
        int stepX = (nextWaypointX > currWaypointX) ? 1 : -1;
        int stepY = (nextWaypointY > currWaypointY) ? 1 : -1;

        // if the direction is horizontal
        if (direction == CONNECT_HORIZ)
        {
            // horizontal part first
            for (int x = currWaypointX; x != nextWaypointX; x += stepX)
            {
                // push the point onto the path
                this->path_.push_back({x, currWaypointY});
            }

            // vertical part
            for (int y = currWaypointY; y != nextWaypointY; y += stepY)
            {
                // push the point onto the path
                this->path_.push_back({nextWaypointX, y});
            }
        }

        // else if the direction is vertical
        else if (direction == CONNECT_VERT)
        {
            // vertical part first
            for (int y = currWaypointY; y != nextWaypointY; y += stepY)
            {
                // push the point onto the path
                this->path_.push_back({currWaypointX, y});
            }

            // horizontal part
            for (int x = currWaypointX; x != nextWaypointX; x += stepX)
            {
                // push the point onto the path
                this->path_.push_back({x, nextWaypointY});
            }
        }

    }

    return 0;
}