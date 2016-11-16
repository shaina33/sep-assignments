def binary_search_I(collection, value)
    low = 0
    high = collection.length - 1
    while low <= high
        mid = (low + high) / 2
        if collection[mid] > value
            high = mid - 1
        elsif collection[mid] < value
            low = mid + 1
        else
            return mid
        end
    end
    return -1 # not found
end