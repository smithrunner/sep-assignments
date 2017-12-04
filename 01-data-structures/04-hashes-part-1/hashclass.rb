require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
    print_it()
  end

  def []=(key, value)
    i = index(key, size())
    node = HashItem.new(key, value)
    
    if @items[i] == nil
      @items[i] = node
      print_it()
    elsif @items[i].value == value && @items[i].key == key
      print_it()
      return value
    elsif key == @items[i].key
      @items[i] = node
      print_it()
    else
      resize()

      i_new = index(key, size())
      
      if @items[i_new] == nil
        @items[i_new] = node
      else
        self[key] = value
      end
      print_it()
    end
    
  end

  def [](key)
    i = index(key, size())
    if @items[i] == nil
      return nil
    else
      @items[i].value
    end
  end

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

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end
  
  private
  
  def print_it
    @items.each_with_index do |node,index|
      if node != nil
        puts "index #{index}: #{node.value}"
      else
        puts "index #{index}: nil"
      end
    end
  end

end