require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    self.width = width
    self.height = height
    self.matrix = []
    row = []
    for var in 1..width do
    	row.push(nil)
    end
    for var in 1..height do
    	matrix.push(row)
    end
    # each element in matrix is a row array
    # (x,y) -> self.matrix[y][x]
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x,y)
      self.matrix[y][x] = pixel
    else
      return nil
    end
  end

  def at(x, y)
    self.matrix[y][x]
  end

  private

  def inbounds(x, y)
    if (x >= 0 && x <= width)
      if (y >= 0 && y <= height)
        return true
      end
    end
    return false
  end

end