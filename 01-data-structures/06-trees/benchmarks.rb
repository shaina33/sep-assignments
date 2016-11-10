require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_heap/min_heap'

n = 10000
root = Node.new('5000', 5000)
tree = BinarySearchTree.new(root)
heap = MinHeap.new(root)
Benchmark.bm do |x|
    # insertion
    x.report {
        for i in 1..n do
            unless i == 5000
                tree.insert(root, Node.new(i.to_s, i))
            end
        end
    }
    x.report {
        for i in 1..n do
            unless i == 5000
                heap.insert(Node.new(i.to_s, i))
            end
        end 
    }
    
    # find 
    x.report {
        tree.find(root, "5000")
    }
    x.report {
        heap.findNode("5000")
    }
    
    # deletion
    x.report {
        tree.delete(root, '10')
        tree.delete(root, '4000')
        tree.delete(root, '9000')
    }
    x.report {
        heap.delete('10')
        heap.delete('4000')
        heap.delete('9000')
    }
    
end