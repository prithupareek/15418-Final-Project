#include "map.h"
#include <iostream>
#include <fstream>

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

void Map::load(const char* file, int width, int height)
{
    this->width_ = width;
    this->height_ = height;

    this->map_ = std::vector<std::vector<int>>(height, std::vector<int>(width, FREE));
    
    // read the map file into the map vector
    std::ifstream mapFile(file);
    std::string line;
    int row = 0;
    while (std::getline(mapFile, line))
    {
        for (size_t col = 0; col < line.size(); col++)
        {
            this->map_[row][col] = (int) (line[col] - '0');
        }
        row++;
    }
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
    return (this->map_[x][y] == FREE);
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