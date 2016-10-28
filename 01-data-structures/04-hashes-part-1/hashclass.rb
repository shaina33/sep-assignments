require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    # puts 'INSERTION'
    index = index(key, @size)
    # puts 'initial index: '+ index.to_s
    if @items[index] && @items[index].value != value
        # puts 'collision'
        resize()
        self[key] = value
    else
    	@items[index] = HashItem.new(key,value)
    	summary()
    end
  end
  
  def summary
    puts 'HASH SUMMARY'
    puts 'size: '+ @size.to_s + ' items: ' + size().to_s
    for index in 0..size() do
      if @items[index]
        puts 'Index: ' + index.to_s + ' Key: ' + @items[index].key
      end
    end
  end

  def [](key)
    index = index(key, @size)
    if @items[index]
      return @items[index].value
    else
      return nil
    end
  end

  def resize
    # puts "RESIZE"
    @size = 2 * @size
    temp = Array.new(@size)
    for entry in @items do
      if entry
        new_index = index(entry.key, @size)
        temp[new_index] = entry
        # puts entry.key + ' saved at new index '+ new_index.to_s
      end
    end
    @items = temp
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    code = 0
    key.each_byte do |c|
      code = code + c
    end
    location = code % size
    return location
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end

h = HashClass.new(1)
h['key'] = 'one'
h['key1'] = 'two'