
#ifndef MAP_H
#define MAP_H

#include <vector>

class Map
{
    public:
        Map();
        ~Map();

        void load(const char* file, int width, int height);
        int getWidth();
        int getHeight();
        bool isFree(int x, int y);

        // print the map for debuging
        void print();

    private:
        int width_;
        int height_;
        std::vector<std::vector<int>> map_;
};

#endif /* MAP_H */