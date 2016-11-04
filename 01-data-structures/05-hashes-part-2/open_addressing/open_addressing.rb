require_relative 'node'

class OpenAddressing
  
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  # Insertion of new item
  def []=(key, value)
    index = index(key, @size)
    if @items[index] && @items[index].value != value
      if key == @items[index].key
        # existing key with different value, ignore insertion
        return
      else
        # collision
        new_index = next_open_index(index)
        if new_index == -1
          # no empty space
          resize()
          self[key] = value
        else
          # insertion at new index
          @items[new_index] = Node.new(key, value)
          #print()
        end
      end
    else
      # new or duplicated insertion at empty location
    	@items[index] = Node.new(key,value)
    	#print()
    end
  end

  # Retrieval of an item by key
  def [](key)
    index = index(key, @size)
    if @items[index] && ( @items[index].key == key )
      return @items[index].value
    else
      next_index = index + 1
      while next_index != index
        if @items[next_index].key == key
          return @items[next_index].value
        else
          if next_index < ( @size - 1 )
            next_index += 1
          else
            next_index = 0
          end
        end
      end
      return nil
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # Hash code is the summation of the ASCII values in the key string
  def index(key, size)
    code = 0
    key.each_byte do |c|
      code = code + c
    end
    location = code % size
    return location
  end

  # Given an index, find the next open index in @items
  # Uses simple Linear Probing
  def next_open_index(index)
    if @size == 1
      return -1
    end
    next_index = index + 1
    while @items[next_index] && ( next_index != index )
      if next_index < ( @size - 1 )
        next_index += 1
      else
        next_index = 0
      end
    end
    if next_index == index
      return -1
    else
      return next_index
    end
  end
  
  # Double the hash size & relocate existing items
  def resize
    @size = 2 * @size
    temp = Array.new(@size)
    for entry in @items do
      if entry
        index = index(entry.key, @size)
        # collision
        if temp[index]
          next_index = index + 1
          while temp[next_index]
            if next_index < ( @size - 1 )
              next_index += 1
            else
              next_index = 0
            end
          end
          index = next_index
        end
        # insertion at new location
        temp[index] = Node.new(entry.key, entry.value)
      end
    end
    @items = temp
  end

  # Simple method to return the number of locations in the hash
  def size
    @size
  end
  
  # Number of actual items in the hash (not empty)
  def count
    count = 0
    for location in @items do
      if location
        count += 1
      end
    end
    return count
  end
  
  # Display the contents of the hash
  def print
    puts 'HASH SUMMARY'
    puts 'size: ' + @size.to_s + ' # of items: ' + count().to_s
    puts 'load factor: ' + (count()/@size.to_f).round(2).to_s
    for index in 0..@size do
      if @items[index]
        puts 'Index: ' + index.to_s + ' ' + @items[index].key + ' -> ' + @items[index].value
      end
    end
  end
  
end

def test_function
  
  star_wars_movies = OpenAddressing.new(6)
  
  star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
  star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
  star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
  star_wars_movies["Star Wars: A New Hope"] = "Number Four"
  star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
  star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"
  star_wars_movies["One too many"] = "Number Seven"
  
  star_wars_movies.print()
  
end

test_function()