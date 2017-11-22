class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    push_stack = [item]
    @stack.each do |element|
      push_stack << element
    end
    @stack = push_stack
    self.top = @stack.first
  end

  def pop
    pop_stack = []
    firstelem = ()
    @stack.each_with_index do |element,index|
      if index > 0
        pop_stack << element
      else
        firstelem = element
      end
    end
    @stack = pop_stack
    self.top = @stack.first
    return firstelem
  end

  def empty?
    if @stack.length > 0 
      return false
    else
      return true
    end
  end
end