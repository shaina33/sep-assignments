def quickSort(array)
    
    # moves an item to the right of the pivot position
    def moveRight(array, counter, pivot_index)
        temp = array[counter]
        array.insert(pivot_index + 1, temp)
        array.delete_at(counter)
        return array
    end
    
    pivot_index = array.length - 1
    pivot_value = array[pivot_index]
    final_index = array.length - 1
    counter = 0
    while true
        # check each item before the pivot & move to right of pivot if greater
        if counter < pivot_index
            if array[counter] > pivot_value
                array = moveRight(array, counter, pivot_index)
                pivot_index -= 1
            else
                counter += 1
            end
        # reached the pivot
        else
            # recursion on each half, includes base case of length = 1
            left = (pivot_index != 0) ? quickSort(array[0...pivot_index]) : []
            right = (pivot_index != final_index) ? quickSort(array[(pivot_index + 1)..final_index]) : []
            return left + [pivot_value] + right
        end
    end
    
end
            