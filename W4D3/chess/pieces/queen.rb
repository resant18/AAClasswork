require_relative "module/slideable_module"
require_relative "piece"


class Queen < Piece
  include Slideable

  def symbol
    :Q
  end

  def move_dirs
    [:horizontal, :diagonal]
  end

end

# board = Board.new
# q = Queen.new(:W, board, [3, 4])
# p q.symbol
# p q.move_dirs
# p q.moves
