require_relative "module/slideable_module"
require_relative "piece"


class Bishop < Piece
  include Slideable

  def symbol
    :B
  end

  def move_dirs
    [:diagonal]
  end

end

# board = Board.new
# b = Bishop.new(:W, board, [2, 2])
# p b.symbol
# p b.move_dirs
# p b.moves
