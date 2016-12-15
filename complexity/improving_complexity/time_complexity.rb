def poorly_written_ruby(*arrays)
    combined_array = []
    arrays.each do |array|
        combined_array.concat(array)
    end
    
    # use Ruby's built-in sort function, which is an optimized version of Quick Sort (according to several sources)
    return combined_array.sort
end