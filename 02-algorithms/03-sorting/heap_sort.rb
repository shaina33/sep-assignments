class MinHeapSort
    
    def initialize()
        @items = [nil]
    end
    
    def build(array)
        for item in array do
            insert(item)
        end
    end
    
    def insert(item)
        @items.push(item)
        item_index = @items.size - 1
        while true
            parent_index = ((item_index) / 2).floor
            if (@items[parent_index] != nil) && (@items[parent_index] > item)
                parent_item = @items[parent_index]
                @items[parent_index] = item
                @items[item_index] = parent_item
                item_index = parent_index
            else
                return
            end
        end
    end
    
    def removeItem(item_index = 1)
        # validate item_index, will be root item by default
        if item_index == nil || item_index < 0 || item_index >= @items.length
            return nil
        end
        
        # return removed_item at end
        removed_item = @items[item_index]
        
        # swap last item into removed position
        @items[item_index] = @items.pop()
        item = @items[item_index]
        
        # percolate item to correct position
        while true
            # determine new indexes of parent & smaller child
            parent_index = ((item_index) / 2).floor
            left_index = 2 * item_index
            right_index = left_index + 1
            if @items[left_index] && @items[right_index]
                child_index = ( @items[left_index] < @items[right_index] ) ? ( left_index ) : ( right_index )
            else
                child_index = left_index
            end
            # swap with parent or child if appropriate
            if ( @items[parent_index] != nil ) && ( @items[parent_index] > item )
                parent_item = @items[parent_index]
                @items[parent_index] = item
                @items[item_index] = parent_item
                item_index = parent_index
            elsif ( @items[child_index] != nil ) && ( @items[child_index] < item )
                child_item = @items[child_index]
                @items[child_index] = item
                @items[item_index] = child_item
                item_index = child_index
            else
                return removed_item
            end
        end
    end
    
end

def heapSort(array)
    sorted = []                     # needs to be in place of array, or ok to make new array?
    heap = MinHeapSort.new
    heap.build(array)
    (array.length).times do
        sorted << heap.removeItem()
    end
    return sorted
end
    