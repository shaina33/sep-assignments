require 'benchmark'
require_relative 'linked_list'

# Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
n = 10000
Benchmark.bm do |x|
    x.report {
        array = []
        for i in 1..n do
	        array = array + [1]
        end
    }
    x.report {
        y = LinkedList.new
        node = Node.new(1)
        for i in 1..n do
            y.add_to_tail(node)
        end
    }
end

# Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
index = 4999
LL = LinkedList.new
for i in 1..n do
    LL.add_to_tail(Node.new(i))
end
AR = []
for i in 1..n do
    AR = AR + [i]
end
Benchmark.bm do |x|
    x.report { AR[index] }
    x.report { LL.findIndex(index) }
end

# Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
Benchmark.bm do |x|
    x.report { AR.delete_at(index) }
    x.report { LL.deleteIndex(index) }
end



