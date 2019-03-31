#include "types.hpp"
#include <fstream>
#include <algorithm>


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