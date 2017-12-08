require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating
      if root.left == nil
        root.left = node
      else
        insert(root.left, node)
      end
    elsif node.rating > root.rating
      if root.right == nil
        root.right = node
      else
        insert(root.right,node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil
      return nil
    elsif root.contain(data)
      return root
    end
    left = find(root.left, data) if root.left
    right = find(root.right, data) if root.right
    left or right
  end

  def delete(root, data)
    if data == nil
      return nil
    end
    
    doomed = find(root,data)
    doomed_parent = find(root,doomed)
    
    if doomed.left == nil && doomed.right == nil
      
      if doomed_parent.left == doomed
        doomed_parent.left = nil
      elsif doomed_parent.right == doomed
        doomed_parent.right = nil
      end

    elsif doomed.left != nil && doomed.right == nil
      doomed_parent.left = doomed.left
    elsif doomed.left == nil && doomed.right != nil
      doomed_parent.right = doomed.right
    elsif doomed.left != nil && doomed.right != nil
      doomed_parent.left = doomed.left
    end
      
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    
    while queue.size != 0
      index = queue.shift
      puts "#{index.title}: #{index.rating}"
      queue << index.left if index.left
      queue << index.right if index.right
    end
  end
  
end
