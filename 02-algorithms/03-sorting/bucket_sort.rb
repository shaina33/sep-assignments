# n is number of buckets to use
def bucketSort(array, n)
    # initialize buckets
    buckets = []
    n.times do
        buckets << []
    end
    # distribute array items into buckets
    min_value = array.min
    max_value = array.max
    width = ( (max_value - min_value) / n.to_f ).ceil
    for item in array do
        if item == min_value
            bucket_num = 0
        elsif item == max_value
            bucket_num = -1
        else
            bucket_num = ( (item / width.to_f) - ((min_value + 1) / width.to_f) ).floor
        end
        buckets[bucket_num].push(item)
    end
    # sort each bucket, then add its contents into the cleared array
    array.clear
    for bucket in buckets do
        bucket = insertionSort(bucket)
        for item in bucket do
            array.push(item)
        end
    end
    return array
end

def insertionSort(collection)
    sorted_collection = [collection.delete_at(0)]
    for val in collection
        sorted_collection_index = 0
        while sorted_collection_index < sorted_collection.length
            if val <= sorted_collection[sorted_collection_index]
                sorted_collection.insert(sorted_collection_index, val)
                break
            elsif sorted_collection_index == sorted_collection.length - 1
                sorted_collection.insert(sorted_collection_index + 1, val)
                break
            end

            sorted_collection_index += 1
        end
    end
    return sorted_collection
end