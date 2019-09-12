require_relative "module/stepable_module"
require_relative "piece"


class Knight < Piece
  include Stepable

  def symbol
    :Kn
  end

  def move_diffs
    [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

end

# board = Board.new
# kn = Knight.new(:W, board, [0, 2])
# p kn.moves
# p kn.symbol
# p kn.move_dirs