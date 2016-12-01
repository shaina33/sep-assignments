require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

arr = []
1000.times do 
    arr << rand(1000)
end

Benchmark.bm do |x|
    x.report { bucketSort(arr, 100) }
    x.report { heapSort(arr) }
    x.report { quickSort(arr) }
end

# Output for 50 items and 5 buckets

#       user     system      total        real
#   0.000000   0.000000   0.000000 (  0.000073)
#   0.000000   0.000000   0.000000 (  0.000192)
#   0.000000   0.000000   0.000000 (  0.000149)

# Output for 300 items and 10 buckets

#       user     system      total        real
#   0.000000   0.000000   0.000000 (  0.000791)
#   0.010000   0.000000   0.010000 (  0.002730)
#   0.000000   0.000000   0.000000 (  0.004659)

# Output for 1000 items and 20 buckets

#       user     system      total        real
#   0.000000   0.000000   0.000000 (  0.003083)
#   0.010000   0.000000   0.010000 (  0.011759)
#   0.030000   0.000000   0.030000 (  0.035174)

# Output for 1000 items and 100 buckets

#       user     system      total        real
#   0.010000   0.000000   0.010000 (  0.001797)
#   0.010000   0.000000   0.010000 (  0.014881)
#   0.030000   0.000000   0.030000 (  0.034574)

# Thoughts

# Based on my implementations at least, the Bucket Sort is the fastest, and the Quick Sort is the slowest.
# Generally speaking, some sort algorithms are faster than others because they have to do less work than others, in order to achieve the same result.
# For example, if an algorithm must inspect every element of the set, for each element in the set, then it will take longer to finish
# than, say, an algorithm that only has to inspect half of the set, for each element in the set. This can all be determined by carefully going through
# the algorithm to determine what kind of work it needs to do, and how many iterations it needs to do, in best, worst, and average scenarios.