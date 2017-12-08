class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
  end
  
  def contain(data)
    if self.title == data
      true
    elsif self.rating == data
      true
    elsif self.left == data
      true
    elsif self.right == data
      true
    else
      false
    end
  end
end