#include "types.hpp"
#include <iostream>
#include <cmath>
#include <algorithm>
#include <future>
#include <numeric>
#include <fstream>


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
                cities_.push_back(City(i, j));
            }
        }
    }
}

std::vector<City> Map::get_cities() const
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

    for (int i = 0; i < cities.size() - 1; i++)
    {
        for (int j = i + 1; j < cities.size(); j++)
        {
            const City from = cities[i];
            const City to = cities[j];

            if (get_distance(fp.first, fp.second) > get_distance(from, to))
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

    const std::vector<City> on_left_x(x_cities.begin(), x_cities.begin() + (x_cities.size() / 2));
    const std::vector<City> on_right_x(x_cities.begin() + (x_cities.size() / 2), x_cities.end());
    const int middle_x = on_right_x[0].x;

    std::vector<City> on_left_y;
    std::vector<City> on_right_y;
    for (const auto &c : y_cities)
    {
        if (c.x <= middle_x)
        {
            on_left_y.push_back(c);
        }
        else
        {
            on_right_y.push_back(c);
        }
    }

    std::future<FlightPath> ffp = std::async(std::launch::async, [&]() {return find_shortest(on_left_x, on_left_y);});

    FlightPath fp_right = find_shortest(on_right_x, on_right_y);

    FlightPath fp_left = ffp.get();

    FlightPath min_path = get_length(fp_left) < get_length(fp_right) ? fp_left : fp_right;

    std::vector<City> stripe;
    for (const auto &c : y_cities)
    {
        if (std::abs(middle_x - c.x) < get_length(min_path))
        {
            stripe.push_back(c);
        }
    }

    if (stripe.size() > 1)
    {
        for (int i = 0; i < stripe.size() - 1; i++)
        {
            for (int j = i + 1; j < stripe.size(); j++)
            {
                const City from = stripe[i];
                const City to = stripe[j];

                if (get_distance(from, to) < get_length(min_path))
                {
                    min_path = FlightPath(from, to);
                }
            }
        }
    }

	return min_path;
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
    std::sort(y_cities.begin(), y_cities.end(), sort_by_y);
    
    return find_shortest(x_cities, y_cities);
}

//3rd assignment
void write_traders(const int n, Pipe<trader>& p)
{
    std::ofstream out("output.txt");

    for (int i = 0; i < n; i++)
    {
        const trader t = p.pop();
        for (int j = 0; j < t.size() - 1; j++)
        {
            const auto value = t[j];
            if (j < t.size() - 2) out << value << " ";
            else out << value << std::endl;
        }
    }

    out.clear();
    out.close();
}


void Map::calculate_trades(std::vector<trader>& traders)
{
    find_cities();
    const int c = get_cities().size();

    std::vector<Pipe<trader>> ps(c + 1);
    std::vector<std::thread> wcs(c);

    for (int i = 0; i < c; i++)
    {
        auto f = [&](int j){ city_trade(cities_[j], traders.size(), ps[j], ps[j+1]); };
        wcs.push_back(std::thread(f, i));
    }

    std::thread wt(write_traders, traders.size(), std::ref(ps[ps.size() - 1]));

    std::for_each(traders.begin(), traders.end(), [&](trader& t) { ps[0].push(t); });
    std::for_each(wcs.begin(), wcs.end(), [&](std::thread& t) { t.join(); });
    wt.join();
}

bool is_useful_field(FIELD f)
{
    const int i = field_value(f);

    return 1 > i && 6 < i;
}

int get_field_index(FIELD f)
{
    switch(f)
    {
        case FIELD::FOREST: return 0;
        case FIELD::GOLD_MINE: return 1;
        case FIELD::IRON: return 2;
        case FIELD::LAKE: return 3;
        case FIELD::WHEAT: return 4;
    }
    return -1;
}

bool have_sellable(stock& s)
{
    const int sum = std::accumulate(s.begin(), s.end(), 0);
    
    return sum > 0;
}



void Map::city_trade(const City& city, int count, Pipe<trader>& from, Pipe<trader>& to) const
{
    stock s;
    s.fill(0);

    std::set<Tile> ts = get_tiles_in_radius(city.x, city.y, 2);

    for (auto& tile: ts)
    {
        FIELD f = tile.second;
        if (is_useful_field(f))
        {
            int i = get_field_index(f);
            s[i] += 1;
        }
    }

    for (int i = 0; i < count; i++)
    {
        trader t = from.pop();
        int mi = t.back();

        for (int k = 0; k < s.size() && have_sellable(s); k++)
        {
            if (0 < t[k] && 0 == s[k])
            {
                for (int l = 0; l < s.size() && l != k; l++)
                {
                    if (mi < s[l])
                    {
                        s[l] -= mi;
                        s[k] += 1;

                        t[l] += mi;
                        t[k] -= 1;

                        break;
                    }
                }
            }
        }
        to.push(t);
    }
}
