#include "types.hpp"
#include <iostream>


FIELD field_from_int(const int i)
{
    return static_cast<FIELD>(i);
}

int field_value(const FIELD& f)
{
    switch(f)
    {
        case FIELD::CANNIBALS: return -2;
        case FIELD::DESERT: return 0;
        case FIELD::SEA:
        case FIELD::SWAMP: return 1;
        case FIELD::GRASSLAND:
        case FIELD::IRON: return 2;
        case FIELD::FOREST:
        case FIELD::LAKE:
        case FIELD::WHEAT: return 3;
        case FIELD::GOLD_MINE: return 5;
        case FIELD::VILLAGE: return 6;
    }
    return 0;
}

int tile_value(const Tile& t)
{
    return field_value(std::get<1>(t));
}

bool operator<(const Coordinate& a, const Coordinate& b)
{
    if ((a.x < b.x) || (a.x == b.x && a.y < b.y)) 
    {
        return true;
    }

    return false;
}

/*
std::ostream& operator<<(std::ostream& s, const FIELD& f)
{
    return s;
}

std::ostream& operator<<(std::ostream& s, const DIRECTION& d)
{
    return s;
}

std::ostream& operator<<(std::ostream& s, const Coordinate& p)
{
    return s;
}
std::istream& operator>>(std::istream& s, Coordinate& p)
{
    return s;
}

std::ostream& operator<<(std::ostream& s, const Tile& t)
{
    return s;
}
*/
std::istream& operator>>(std::istream& s, Map& m)
{
    s >> m.rows_ >> m.cols_;

    m.map_.resize(m.rows());
    for (int r = 0; r < m.rows(); r++)
    {
        m.map_[r].resize(m.cols());
        for (int c = 0; c < m.cols(); c++)
        {
            int f_ind;
            s >> f_ind;

            m.map_[r][c] = field_from_int(f_ind);
        }
    }

    return s;
}

Map::Map()
{
    rows_ = cols_ = 0;
}

Map::Map(const int r, const int c)
{
    rows_ = r < 0 ? 0 : r;
    cols_ = c < 0 ? 0 : c;
}
    
int Map::rows() const
{
    return rows_;
}

int Map::cols() const
{
    return cols_;
}

bool Map::in_range(const int x, const int y) const
{
    return (0 <= x && rows_ > x) ? (0 <= y && cols_ > y) : false;
}

Tile Map::tile_at(const int i,const int j) const
{
    Coordinate c(i, j);

    if (in_range(i, j))
    {
        return std::make_pair(c, map_[i][j]);
    }

    return std::make_pair(c, FIELD::SEA);
}

void Map::set_tile(const int i, const int j, const FIELD f)
{
    if (in_range(i, j))
    {
        map_[i][j] = f;
    }
}

Tile Map::tile_in_direction(int x, int y, const DIRECTION d) const
{
    return tile_at(0,0);
}

std::set<Tile> Map::get_tiles_in_radius(const int i, const int j, const int r) const
{
    std::set<Tile> s;
    return s;
}
