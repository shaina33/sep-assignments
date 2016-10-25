class MyStack
  attr_accessor :top
  attr_accessor :pointer

  def initialize
    @stack = Array.new
    self.top = nil
    self.pointer = -1
  end

  def push(item)
    self.pointer += 1
    @stack[self.pointer] = item
    self.top = item
  end

  def pop
    temp = @stack[self.pointer]
    self.pointer -= 1
    if self.pointer < 0
      self.top = nil
    else
      self.top = @stack[self.pointer]
    end
    return temp
  end

  def empty?
    if self.top == nil
      return true
    else
      return false
    end
  end
  
end