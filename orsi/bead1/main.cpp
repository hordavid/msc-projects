#include "types.hpp"
#include <iostream>
#include <fstream>

int main(int argc, char** argv)
{
    int c;
    int r;
    Map m;
    std::ifstream in("world.map");

    in >> m >> c >> r;

    // @TODO: szálakat implementálni

    in.close();
    
    std::ofstream out ("output.txt");
    if (out.is_open())
    {
        out << "rows=" << m.rows() << std::endl;
        out << "cols=" << m.cols() << std::endl;
        out << "c=" << c << std::endl;
        out << "r=" << r << std::endl;
        out.close();
    }
    else std::cout << "Unable to open file";

    return 0;
}