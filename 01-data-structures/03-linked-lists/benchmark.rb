require_relative 'node'
require_relative 'linked_list'
require 'benchmark'

array = []
n = 10000

list = LinkedList.new
node1 = Node.new('sam')

Benchmark.bm do |x|
    x.report("array append:") {for i in 1..n; array << i; end }
    x.report("Linked List:") {n.times do ; list.add_to_tail(node1); end }
end

index = list.head

Benchmark.bm do |x|
    x.report('array 5000th element:') { a5 = array[4999] }
    x.report('LinkedList 5000th element:') { 5000.times do ; index = index.next; end }
end


Benchmark.bm do |x|
    x.report('array delete 5000th') {
        first = array[0..4999]
        second = array[5001..9999]
        array_new = first + second
    }
    x.report('linked list delete 5000th') { list.delete(index) }
end