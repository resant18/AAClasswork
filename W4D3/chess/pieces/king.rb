require_relative "module/stepable_module"
require_relative "piece"


class King < Piece
  include Stepable

  def symbol
    :K
  end

  def move_diffs
    [[1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1], [0, 1]]
  end

end

# board = Board.new
# k = King.new(:W, board, [0, 3])
# p k.moves
# p k.symbol
# p k.move_dirs