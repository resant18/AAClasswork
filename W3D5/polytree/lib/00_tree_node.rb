class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value, parent = nil, children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def parent=(node)
    if !@parent.nil?
        @parent.children.delete(self) 
    end    

    @parent = node
    if !node.nil? && !node.children.include?(self)
        node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if @children.include?(child_node)
        child_node.parent = nil
    else 
        raise "Not my child"
    end
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result if !result.nil? 
    end
    return nil
  end

  def bfs(target_value)
    q = []
    q << self
    until q.empty?
        node = q.shift
        return node if node.value == target_value
        node.children.each { |child| q << child }
    end
    nil
  end
end

# class Searchable
    
# end


# g.remove_child(d)

#    a
#  /   \
#  b    c #children[f, g]
# / \  / \
# d  e f  g #children[i]
#          \
#           i


# node1 = PolyTreeNode.new("a", [node2, node3])
# node2 = PolyTreeNode.new("b")
# node3 = PolyTreeNode.new("c")

# node2.parent = node1

#    a
#  /   \
#  b    c
# / \  / \
# d  e f  g