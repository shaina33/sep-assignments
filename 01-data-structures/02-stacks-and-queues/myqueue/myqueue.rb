class MyQueue
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :h 
  attr_accessor :t 

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
    self.h = -1
    self.t = 0
  end

  def enqueue(element)
    self.h += 1
    @queue[self.h] = element
    @head = element
    @tail = @queue[self.t]
  end

  def dequeue
    if !@queue.empty?
      temp = @queue[self.t]
      self.t += 1
      @tail = @queue[self.t]
      return temp
    else
      return nil 
    end
  end

  def empty?
    if self.t > self.h
    	return true 
    else
    	return false 
    end
  end
  
end