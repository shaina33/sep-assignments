require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current = root
    while true
      if node.rating < current.rating
        if current.left
          current = current.left
        else
          current.left = node
          return
        end
      elsif node.rating > current.rating
        if current.right
          current = current.right
        else
          current.right = node
          return
        end
      else
        # duplicate value
        return nil
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.title == data
      # base case, data matches
      return root
    else
      if root.left
        left = find(root.left, data)
      end
      if root.right
        right = find(root.right, data)
      end
      if left
        return left
      elsif right
        return right
      else
        # no match found toward the left or the right
        return nil
      end
    end
  end

  def delete(root, data)
    parent = findParent(root, data)
    if parent == true
      # matching node is the tree root
      @root = nil
    elsif parent == nil
      # no matching node found
      return nil
    else
      if (parent.left) && (parent.left.title == data)
        nextNode = parent.left
      else
        nextNode = parent.right
      end
      if nextNode.rating < parent.rating
        parent.left = nextNode.left
      else
        parent.right = nextNode.left
      end
    end
    
  end
  
  # written as a helper function for delete
  # same as find, except tracks & returns parent of the matching node
  def findParent(root, data, parent=true)
    if root.title == data
      # base case, data matches
      return parent
    else
      if root.left
        left = findParent(root.left, data, root)
      end
      if root.right
        right = findParent(root.right, data, root)
      end
      if left
        return left
      elsif right
        return right
      else
        # no match found toward the left or the right
        return nil
      end
    end
  end

  # Recursive Breadth First Search
  #def printf(children=nil) <- suggested by Bloc
  def printf(list=[@root], output='')
    # remove front list item & add it to the output
    first = list.shift()
    print_string = first.title + ': ' + first.rating.to_s + "\n"
    output << print_string
    # add its children to the back of the list
    if first.left
      list << first.left
    end
    if first.right
      list << first.right
    end
    # repeat until all nodes have been visited, then print output
    if list.empty?
      puts output
      return
    else
      printf(list, output)
    end
  end
end
