#include "map.h"
#include <iostream>
#include <fstream>
#include <math.h>

#define FREE 0
#define OCCUPIED 1

Map::Map()
{
    this->width_ = 0;
    this->height_ = 0;
}

Map::~Map()
{
}

void Map::load(std::string file)
{

    // this->map_ = std::vector<std::vector<int> >;

    // print the filename
    std::cout << "Loading map from file: " << file << std::endl;

    // read the map file into the map vector
    std::ifstream mapFile(file);
    std::string line;
    int row = 0;
    while (std::getline(mapFile, line))
    {
        this->map_.push_back(std::vector<int>(line.size(), FREE));
        
        for (size_t col = 0; col < line.size(); col++)
        {
            this->map_[row][col] = (int)(line[col] - '0');
        }
        row++;
    }

    this->width_ = this->map_[0].size();
    this->height_ = this->map_.size();
}

int Map::getWidth()
{
    return this->width_;
}

int Map::getHeight()
{
    return this->height_;
}

bool Map::isFree(int x, int y)
{
    return (this->map_[y][x] == FREE);
}

void Map::print()
{
    for (int row = 0; row < this->height_; row++)
    {
        for (int col = 0; col < this->width_; col++)
        {
            std::cout << this->map_[row][col];
        }
        std::cout << std::endl;
    }
}

// Manhattan Distance
double Map::getDistance(int x1, int y1, int x2, int y2)
{
    return abs(x1 - x2) + abs(y1 - y2);
}

// NOTE - Assumes that the start and goal are valid
int Map::canConnect(int x1, int y1, int x2, int y2)
{
    // check for collision free straight line path
    // between the two points
    int stepX = (x2 > x1) ? 1 : -1;
    int stepY = (y2 > y1) ? 1 : -1;

    // Check horizontal
    bool horizontal_works = true;
    for (int x = x1; x != x2; x += stepX)
    {
        if (!(this->isFree(x, y1)))
        {
            horizontal_works = false;
            break;
        }
    }
    if (horizontal_works)
    {
        for (int y = y1; y != y2; y += stepY)
        {
            if (!(this->isFree(x2, y)))
            {
                horizontal_works = false;
                break;
            }
        }
    }
    if (horizontal_works)
    {
        return CONNECT_HORIZ;
    }

    // Check vertical
    bool vertical_works = true;
    for (int y = y1; y != y2; y += stepY)
    {
        if (!(this->isFree(x1, y)))
        {
            vertical_works = false;
            break;
        }
    }
    if (vertical_works)
    {
        for (int x = x1; x != x2; x += stepX)
        {
            if (!(this->isFree(x, y2)))
            {
                vertical_works = false;
                break;
            }
        }
    }
    if (vertical_works)
    {
        return CONNECT_VERT;
    }

    return CANT_CONNECT;
}