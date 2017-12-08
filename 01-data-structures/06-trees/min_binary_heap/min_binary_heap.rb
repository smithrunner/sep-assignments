require_relative 'node'

class MinBinaryHeap
  
  def initialize(root)
    @root = root
  end
  
  def insert(root,node)
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
  
  def find(root,data)
    if data == nil
      return nil
    elsif root.contain(data)
      return root
    end
    left = find(root.left, data) if root.left
    right = find(root.right, data) if root.right
    left or right
  end
  
  def delete(root,data)
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
  
  def print(root)
    queue = [@root]
    
    while queue.size != 0
      index = queue.shift
      puts "#{index.title}: #{index.rating}"
      queue << index.left if index.left
      queue << index.right if index.right
    end
  end
  
  private
  
  def swap(parent,child)
    temp_p = parent
    temp_c = child
    if parent.left == child
      parent = temp_c
      child = temp_p
        
      parent.left = temp_c.left
      parent.right = temp_c.right
        
      child.left = parent
      child.right = temp_p.right
    elsif parent.right == child
      parent = temp_c
      child = temp_p
        
      parent.left = temp_c.left
      parent.right = temp_c.right
        
      child.left = temp_p.left
      child.right = parent
    end
  end
  
  def sort(node)
    index = node
    if index == @root
      return nil
    end
    index_parent = find(@root,node)
    
    
    while index != @root || index.rating > index_parent.rating
      swap(index_parent,index)
      index = index_parent
      index_parent = find(@root,index)
    end
  end
end
    