require_relative "module/slideable_module"
require_relative "piece"


class Rook < Piece
  include Slideable

  def symbol
    :R
  end

  def move_dirs
    [:horizontal]
  end

end

# board = Board.new
# puts "___________________"
# r = Rook.new(:W, board, [3, 2])
# # board[1,0] = NullPiece.instance

# p r.moves
# p r.symbol
# p r.move_dirs