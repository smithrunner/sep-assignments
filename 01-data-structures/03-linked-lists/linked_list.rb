require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
      @tail = node
    elsif @head == @tail
      @head.next = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end


  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      @head = nil
      @tail = nil
    else
      index = @head
      while index.next != @tail
        index = index.next
      end
      @tail = index
    end
  end

  # This method prints out a representation of the list.
  def print
    string = ''
    index = @head
    while index != @tail
      string << index.data.to_s
      string << "\n"
      index = index.next
    end
    string << @tail.data.to_s
    string << "\n"
    puts string
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @head
      remove_front
    elsif node == @tail
      remove_tail
    else
      index = @head
      while index.next != node
        index = index.next
      end
      index.next = node.next
      node.next = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = @head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      front = @head
      @head = nil
      @tail = nil
      return front
    else
      front = @head
      @head = @head.next
      return front
    end
  end
end