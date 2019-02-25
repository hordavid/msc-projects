#include "types.hpp"
#include <fstream>
#include <numeric>
#include <algorithm>
#include <thread>
#include <future>


std::vector<Coordinate> get_coordinates(std::ifstream &in, const int c);
void psum(const Map &m, const Coordinate &c, const int r, std::promise<int> *p);


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
    

    std::ofstream out("output.txt");
    std::vector<std::thread> ts;

    for (const auto &c : cs)
    {
        std::promise<int> p;
        std::future<int> f = p.get_future();
        ts.push_back(std::thread(psum, m, c, r, &p));

        out << f.get() << std::endl;
    }

    std::for_each(ts.begin(), ts.end(), [](std::thread &t) { t.join(); });

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

void psum(const Map &m, const Coordinate &c, const int r, std::promise<int> *p) 
{
    std::set<Tile> s = m.get_tiles_in_radius(c.x, c.y, r);

    p->set_value(std::accumulate(s.begin(), s.end(), 0, [](int x, const Tile &t) { return x + field_value(t.second); }));
}