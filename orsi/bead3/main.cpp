#include "types.hpp"
#include <fstream>


int main(int argc, char** argv)
{
    Map m;
    int c;

    std::ifstream in("world.map");

    in >> m >> c;
    std::vector<trader> ts(c);

    for (int i = 0; i < c; i++)
    {
        for (int j = 0; j < 6; j++) 
        {
            in >> ts[i][j];
        }
    }

    in.clear();
    in.close();
    

    m.calculate_trades(ts);


    return 0;
}