class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    first_in = @head
    @queue.delete(@head)
    @head = @queue.first
    return first_in
  end

  def empty?
    if @queue.length > 0
      return false
    else
      return true
    end
  end
end