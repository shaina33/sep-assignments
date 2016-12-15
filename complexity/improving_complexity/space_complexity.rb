def selection_sort(collection)
    length = collection.length
    for i in 0..length - 2
        min_index = i
        for j in (i + 1)...length
            if collection[j] < collection[min_index]
            min_index = j  
            end
        end
    
        tmp = collection[i]
        collection[i] = collection[min_index]
        collection[min_index] = tmp
    end
    collection
end

def poorly_written_ruby(*arrays)
    combined_array = []
    arrays.each do |array|
        combined_array.concat(array)
    end
    
    # use selection sort, which executes in-place
    return selection_sort(combined_array)
end