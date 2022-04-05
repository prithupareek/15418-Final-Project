
#ifndef MAP_H
#define MAP_H

#include <vector>

#define CANT_CONNECT    0
#define CONNECT_VERT    1
#define CONNECT_HORIZ  -1

class Map
{
    public:
        Map();
        ~Map();

        void load(const char* file, int width, int height);
        int getWidth();
        int getHeight();
        bool isFree(int x, int y);
        double getDistance(int x1, int y1, int x2, int y2);
        int canConnect(int x1, int y1, int x2, int y2);

        // print the map for debuging
        void print();

    private:
        int width_;
        int height_;
        std::vector<std::vector<int>> map_;
};

#endif /* MAP_H */