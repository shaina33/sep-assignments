def poorly_written_ruby(*arrays)
    combined_array = []
    arrays.each do |array|
        # concatenate each array, rather than annexing each value of each array
        combined_array.concat(array)
    end

    sorted_array = [combined_array.delete_at(combined_array.length-1)]
    
    for val in combined_array
        i = 0
        while i < sorted_array.length
            if val <= sorted_array[i]
                sorted_array.insert(i, val)
                break
            elsif i == sorted_array.length - 1
                sorted_array.insert(i, val)
                break
            end
            i+=1
        end
    end
    
    sorted_array
end

poorly_written_ruby([2,1], [4,3,7])