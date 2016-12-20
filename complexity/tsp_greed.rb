class City
    
    attr_accessor :name
    attr_accessor :neighbors
    attr_accessor :distances
    attr_accessor :visited
    
    def initialize(city_name, distance_hash)
        # city_name is a string
        # distance_hash is a Hash of "city_name": distance number entries
        @name = city_name
        @neighbors = []
        @distances = distance_hash
        @visited = false
    end
    
    def add_neighbors(neighbor_cities)
        # neighbor_cities is an array of city objects
        @neighbors = neighbor_cities
    end
    
    def get_distance(from_city)
        return @distances[from_city]
    end
    
end

def npn(cities_array, current_city)
    for city in cities_array do
        city.visited = false
    end
    city_history = []
    while !current_city.visited
        neighbor_cities = current_city.neighbors
        next_city = neighbor_cities[0]
        for current_neighbor in neighbor_cities do
            if current_neighbor.get_distance(current_city.name) < next_city.get_distance(current_city.name)
                next_city = current_neighbor
            end
        end
        current_city.visited = true
        city_history << current_city.name
        current_city = next_city
    end
    return city_history
end

# Testing #
atlanta = City.new("Atlanta", {"Chicago" => 100, "Indianapolis" => 150} )
chicago = City.new("Chicago", {"Atlanta" => 100, "Indianapolis" => 50} )
indianapolis = City.new("Indianapolis", {"Chicago" => 50, "Atlanta" => 150} )
atlanta.add_neighbors([chicago, indianapolis])
chicago.add_neighbors([atlanta, indianapolis])
indianapolis.add_neighbors([atlanta, chicago])
p npn([atlanta, chicago, indianapolis], atlanta)
# Output:
# ["Atlanta", "Chicago", "Indianapolis"]