require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if !self.head
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.tail = node 
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head.next == nil
      self.head = nil
      self.tail = nil
    else
      temp = self.head
      while temp && (temp.next.next != nil)
        temp = temp.next
      end
      temp.next = nil
      self.tail = temp
    end
  end

  # This method prints out a representation of the list.
  def print
    output = ""
    temp = self.head
    while temp
      output << temp.data << "\n"
      temp = temp.next
    end
    puts output
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if self.head.data == node.data
      self.remove_front
    else
      temp = self.head
      while temp && (temp.next.data != node.data)
        temp = temp.next
      end
      target = temp.next
      temp.next = target.next
      if temp.next == nil
        self.tail = temp
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    self.head = self.head.next
    if self.head == nil
      self.tail = nil
    end
  end
  
end