#include "types.hpp"
#include <iostream>
#include <cmath>
#include <algorithm>
#include <future>


const static DIRECTION directions[] = {DIRECTION::NORTH, DIRECTION::SOUTH,
            DIRECTION::NORTH_EAST, DIRECTION::NORTH_WEST,
            DIRECTION::SOUTH_EAST, DIRECTION::SOUTH_WEST};

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
        case FIELD::CITY: return 10;
    }
    return 0;
}

int tile_value(const Tile& t)
{
    return field_value(t.second);
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

    m.map_.resize(m.rows(), std::vector<FIELD>(m.cols()));
    for (int r = 0; r < m.rows(); r++)
    {
        for (int c = 0; c < m.cols(); c++)
        {
            int f_ind;
            s >> f_ind;

            m.map_[r][c] = field_from_int(f_ind);
        }
    }

    m.find_cities();

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
        this->set_tile(Coordinate(i, j), f);
    }
}

Tile Map::tile_in_direction(int x, int y, const DIRECTION d) const
{
    const bool y_is_even = y % 2 == 0;

    switch (d)
    {
        case DIRECTION::NORTH:
            return tile_at(x - 1, y);
        case DIRECTION::SOUTH:
            return tile_at(x + 1, y);
        case DIRECTION::NORTH_EAST:
            return tile_at(y_is_even ? x - 1 : x, y + 1);
        case DIRECTION::NORTH_WEST:
            return tile_at(y_is_even ? x - 1 : x, y - 1);
        case DIRECTION::SOUTH_EAST:
            return tile_at(y_is_even ? x : x + 1, y + 1);
        case DIRECTION::SOUTH_WEST:
            return tile_at(y_is_even ? x : x + 1, y - 1);
        default:
            return tile_at(x, y);
    }
}

std::set<Tile> Map::get_tiles_in_radius(const int i, const int j, const int r) const
{
    std::set<Tile> s;

    s.insert(tile_at(i, j));

    if (0 < r)
    {
        for (const auto &d: directions)
        {
            const Coordinate c = std::get<0>(tile_in_direction(i, j, d));

            const std::set<Tile> ts = get_tiles_in_radius(c.x, c.y, r - 1);
            s.insert(ts.begin(), ts.end()); 
        }
    }

    return s;
}

/**
  * new functions for 2nd assignment
  */
 
void Map::find_cities()
{
	for (int i = 0; i < map_.size(); i++)
    {
        for (int j = 0; j < map_[i].size(); j++)
        {
            if (FIELD::CITY == map_[i][j])
            {
                cities_.insert(City(i, j));
            }
        }
    }
}

std::set<City> Map::get_cities() const
{
	return cities_;
}

double Map::get_length(const FlightPath& p) const
{
	return get_distance(p.first, p.second);
}

double Map::get_distance(const City& a, const City& b) const
{
	return std::sqrt(std::pow(b.x - a.x, 2) + std::pow(b.y - a.y, 2));
}

FlightPath Map::closest_brute_force(const std::vector<City>& cities) const
{
    FlightPath fp(cities[0], cities[1]);

    for (auto &from : cities)
    {
        for (auto &to : cities)
        {
            if (from < to && get_distance(fp.first, fp.second) > get_distance(from, to))
            {
                fp.first = from;
                fp.second = to;
            }
        }
    }
    
	return fp;	
}

FlightPath Map::find_shortest(const std::vector<City>& x_cities, const std::vector<City>& y_cities) const
{
    if (4 > x_cities.size())
    {
        return closest_brute_force(x_cities);
    }

	return closest_brute_force(x_cities);
}

bool sort_by_x(const City& c1, const City& c2)
{
    return c1.x < c2.x;
}

bool sort_by_y(const City& c1, const City& c2)
{
    return c1.y < c2.y;
}

FlightPath Map::get_shortest_flightpath() const
{	
    std::vector<City> x_cities(cities_.begin(), cities_.end());
    std::vector<City> y_cities(cities_.begin(), cities_.end());
	
    std::sort(x_cities.begin(), x_cities.end(), sort_by_x);
    std:sort(y_cities.begin(), y_cities.end(), sort_by_y);
    
    return find_shortest(x_cities, y_cities);
}