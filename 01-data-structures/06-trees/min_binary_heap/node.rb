class Node
  attr_accessor :title
  attr_accessor :node_data


  def initialize(title, rating)
    @title = title
    @node_data = rating
  end
end