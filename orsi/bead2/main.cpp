#include "types.hpp"
#include <fstream>
#include <numeric>
#include <algorithm>
#include <future>


std::vector<Coordinate> get_coordinates(std::ifstream &in, const int c);
int psum(const Map &m, const Coordinate &c, const int r);


int main(int argc, char** argv)
{
    Map m;

    std::ifstream in("world.map");

    in >> m;

    in.clear();
    in.close();
    

    std::ofstream out("output.txt");

    const FlightPath fp(m.get_shortest_flightpath());

    out << "From: (" << fp.first.x << "," << fp.first.y << ")" << std::endl;
    out << "To: (" << fp.second.x << "," << fp.second.y << ")" << std::endl;

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