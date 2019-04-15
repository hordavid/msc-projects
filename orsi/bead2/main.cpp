#include "types.hpp"
#include <fstream>


int main(int argc, char** argv)
{
    Map m;

    std::ifstream in("world.map");

    in >> m;

    in.clear();
    in.close();
    

    const FlightPath fp(m.get_shortest_flightpath());

    const bool b = Coordinate(fp.first.x, fp.first.y) < Coordinate(fp.second.x, fp.second.y);

    City from = b ? fp.first : fp.second;
    City to = !b ? fp.first : fp.second;

    std::ofstream out("output.txt");
    
    out << "From: (" << from.x << "," << from.y << ")" << std::endl;
    out << "To: (" << to.x << "," << to.y << ")" << std::endl;

    out.clear();
    out.close();


    return 0;
}