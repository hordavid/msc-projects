#include "types.hpp"
#include <fstream>
#include <numeric>
#include <algorithm>
#include <future>


std::vector<Coordinate> get_coordinates(std::ifstream &in, const int c);
int psum(const Map &m, const Coordinate &c, const int r);


int main(int argc, char** argv)
{
    int c;
    int r;
    Map m;


    std::ifstream in("world.map");

    in >> m >> c >> r;

    std::vector<Coordinate> cs = get_coordinates(in, c);

    in.clear();
    in.close();
    

    std::vector<std::future<int>> fs;
    std::ofstream out("output.txt");

    std::for_each(cs.begin(), cs.end(), [&](Coordinate &c) { fs.push_back(std::async(std::launch::async, psum, std::ref(m), std::ref(c), r)); });

    std::for_each(fs.begin(), fs.end(), [&](std::future<int> &f) { out << f.get() << std::endl; });

    out.clear();
    out.close();

    return 0;
}


std::vector<Coordinate> get_coordinates(std::ifstream &in, const int c)
{
    std::vector<Coordinate> cs;
    
    for (int i = 0; i < c; i++)
    {
        Coordinate coord;
        in >> coord.x >> coord.y;
        --coord.x;
        --coord.y;

        cs.push_back(coord);
    }

    return cs;
}

int psum(const Map &m, const Coordinate &c, const int r) 
{
    std::set<Tile> s = m.get_tiles_in_radius(c.x, c.y, r);

    return std::accumulate(s.begin(), s.end(), 0, [](int x, const Tile &t) { return x + field_value(t.second); });
}