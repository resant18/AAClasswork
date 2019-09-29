require "byebug"

require_relative "polytree"

class KnightPathFinder
  def self.valid_moves(pos)
    row, col = pos

    all_moves = [
      [row+1, col-2],
      [row+1, col+2],
      [row+2, col+1],
      [row+2, col-1],
      [row-2, col+1],
      [row-2, col-1],
      [row-1, col+2],
      [row-1, col-2]]

    valid_moves = all_moves.select do |pos|
      row, col = pos
      row >= 0 && row < 8 && col >=0 && col < 8
    end
    return valid_moves
  end

  attr_accessor :root_node, :considered_positions

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = [@root_node]
    self.build_move_tree
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    new_pos = []
    valid_moves.each do |move|
      if !@considered_positions.include?(move)
        new_pos << move
        @considered_positions << move
      end
    end

    return new_pos
  end

  def build_move_tree
    q = [@root_node]
    until q.empty?
      # debugger
      node = q.shift
      new_move_positions(node.value).each do |newnode| 
        kidnode = PolyTreeNode.new(newnode)
        node.add_child(kidnode)
        q << kidnode
      end
    end
  end

  def find_path(end_pos)
    end_node = @root_node.bfs(end_pos)
    # find node.value == end_pos
    # return node
    
    trace_path_back(end_node)
  end

  def trace_path_back(node)
    path = []

    until node.value == @root_node.value
      path.unshift(node.value)
      node = node.parent
    end
    return path.unshift(@root_node.value)
  end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]



