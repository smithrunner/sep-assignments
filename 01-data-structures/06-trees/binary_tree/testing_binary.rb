require_relative 'binary_search_tree'
require_relative 'node'
require 'benchmark'

index = 1
root = Node.new(index,index)
tree = BinarySearchTree.new(root) 
index += 1

Benchmark.bm do |x|
  x.report('Insert 10,000 Nodes: ') {
      while index <= 10000
        node = Node.new(index,index)
        tree.insert(root,node)
        index += 1
      end
  }
  x.report("Find 5,000th Node:   ") { tree.find(root,5000) }
  x.report("Delete 5,000th Node: ") { tree.delete(root,5000) }
end