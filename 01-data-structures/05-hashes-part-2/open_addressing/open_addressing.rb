require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    display()
  end

  def []=(key, value)
    i = index(key, size())
    node = Node.new(key,value)
    if @items[i] == nil
      @items[i] = node
    elsif @items[i].key == key
      @items[i] = node
    else
      i_new = next_open_index(i)
      
      if i_new != -1
        @items[i_new] = node
      else
        resize()
        i_again = index(key,size())
        if @items[i_again] == nil
          @items[i_again] = node
        else
          self[key] = value
        end
      end
    end
    display()
  end

  def [](key)
    i = index(key, size())
    if @items[i].key == key
      return @items[i].value
    else
      while i < size()
        if @items[i] != nil && @items[i].key == key
          return @items[i].value
        end
        i += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < size()
      if @items[index] == nil
        return index
      end
      index += 1
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    items_resize = Array.new( size() * 2 )
    @items.each do |node|
      if node != nil
        i = index(node.key,items_resize.length)
        items_resize[i] = node
      end
    end
    @items = items_resize
  end
  
  private
  def display
    @items.each_with_index do |node,index|
      if node != nil
        puts "index #{index}: #{node.value}"
      else
        puts "index #{index}: nil"
      end
    end
  end
  
end