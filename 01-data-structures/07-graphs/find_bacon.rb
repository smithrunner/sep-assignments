require_relative 'node'

class FindBacon
# Initializes the class. We are going to find the Bacon-ator using Breath first search
# The @stack is to keep a list of actors we have already checked. The @queue is
# to keep a list of the actors we need to check still, as long as they arent already
# in the stack. The @answer is to keep the list of movies we are looking through.
# Once we find the Bacon, this will be our list of movies connecting the starting
# actor to bacon.
  def initialize
    @stack = []
    @queue = []
    @answer = []
  end
  
  
# A method to add actors to the queue, as long as they aren't in the stack already  
  def add_to_queue(index)
    index.film_actor_hash.each do |movie,actors|
      if !@answer.include? movie
        @answer << movie
      end
      
      actors.each do |actor|
        if !@stack.include? actor
          @queue << actor
        end
      end
    end
  end
    
# Where the magic happens. While there are actors to check still, check if the
# actor is Bacon. no? then add all the related actors to the queue via the method
# above.
  def find_kevin_bacon(node,kevin_bacon)
    add_to_queue(node)
    
    while !@queue.empty?
      index = @queue.pop
      if index == kevin_bacon
        return @answer
      else
        @stack << index
        add_to_queue(index)
      end
    end
    
  end
end