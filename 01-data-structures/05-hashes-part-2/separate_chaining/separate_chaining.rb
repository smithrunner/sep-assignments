require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0
    display()
  end

  def []=(key, value)
    @count += 1
    i = index(key,@items.length)
    node = Node.new(key,value)
    
    if @items[i] == nil
      @items[i] = LinkedList.new
      @items[i].add_to_tail(node)
    else
      @items[i].add_to_tail(node)
    end
    
    if load_factor > @max_load_factor
      resize()
    end
    
    display()
  end

  def [](key)
    i = index(key,@items.length)
    if @items[i] == nil
      nil
    else
      check = @items[i].head
      while check.key != key
        check = check.next
      end
      check.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count.to_f / size().to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    items_resize = Array.new( size() * 2 )
    @items.each do |bucket|
      if bucket != nil
        i = index(bucket.head.key,items_resize.length)
        items_resize[i] = bucket
      end
    end
    @items = items_resize
  end
  
  private
  
  def display
    puts "Current Load Factor: #{self.load_factor}"
    @items.each_with_index do |node, index|
      if node == nil
        puts "index #{index}: nil"
      else
        puts "index #{index}:"
        puts "#{node.print}"
      end
    end
  end
end
