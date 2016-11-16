def binary_search_R(collection, value, low = 0, high = collection.length - 1)
    if low <= high
        mid = low + ((high - low) / 2)
        if collection[mid] < value
            return binary_search_R(collection, value, mid + 1, high)
        elsif value < collection[mid]
            return binary_search_R(collection, value, low, mid - 1)
        else
            return mid
        end
    else
        return -1 # not found
    end
end