require_relative 'min_binary_heap'
require_relative 'node'
require 'benchmark'

index = 1
root = Node.new(index,index)
tree = MinBinaryHeap.new(root) 
index += 1

Benchmark.bm do |x|
  x.report('Insert 10,000 Nodes: ') {
      while index <= 10000
        node = Node.new(index,index)
        tree.insert(node)
        index += 1
      end
  }
  x.report("Find 5,000th Node:   ") { 
      node = Node.new(5000,5000)
      tree.contains_element(node) 
  }
  x.report("Delete 5,000th Node: ") { 
      node = Node.new(5000,5000)
      tree.delete_element(node) 
  }
end