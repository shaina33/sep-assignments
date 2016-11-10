require_relative 'node'

class MinHeap
    
    attr_accessor :items # for testing purposes
    
    def initialize(node)
        @items = [nil, node]
    end
    
    def root
        return @items[1]
    end
    
    def insert(node)
        # add new node to end of heap
        @items.push(node)
        node_index = @items.size - 1
        # percolate upwards
        while true
            parent_index = ((node_index) / 2).floor
            if ( @items[parent_index] != nil ) && ( @items[parent_index].rating > node.rating )
                parent_node = @items[parent_index]
                @items[parent_index] = node
                @items[node_index] = parent_node
                node_index = parent_index
            else
                return
            end
        end
    end
    
    def print
        puts 'PRINT HEAP'
        @items.each_with_index do |node, i|
            if node
                puts i.to_s + " " + node.title + ": " + node.rating.to_s
            end
        end
    end
    
    def findNode(data) # data is a title
        @items.each do |item|
            if item == nil
                next
            elsif ( item.title == data )
                return item
            end
        end
        return nil
    end
    
    def findIndex(data) # data is a title
        @items.each_index do |i|
            if @items[i] == nil
                next
            elsif ( @items[i].title == data )
                return i
            end
        end
        return nil
    end
    
    def delete(data) # data is a title
        # find node to delete, replace with last node
        node_index = findIndex(data)
        if node_index == nil
            return nil
        end
        @items[node_index] = @items.last
        node = @items[node_index]
        @items.pop()
        # percolate node to correct position
        while true
            # determine new indexes of parent & smaller child
            parent_index = ((node_index) / 2).floor
            left_index = 2 * node_index
            right_index = left_index + 1
            if @items[left_index] && @items[right_index]
                child_index = ( @items[left_index].rating < @items[right_index].rating ) ? ( left_index ) : ( right_index )
            else
                child_index = left_index
            end
            # swap with parent or child if appropriate
            if ( @items[parent_index] != nil ) && ( @items[parent_index].rating > node.rating )
                parent_node = @items[parent_index]
                @items[parent_index] = node
                @items[node_index] = parent_node
                node_index = parent_index
            elsif ( @items[child_index] != nil ) && ( @items[child_index].rating < node.rating )
                child_node = @items[child_index]
                @items[child_index] = node
                @items[node_index] = child_node
                node_index = child_index
            else
                return
            end
        end
    end
    
end