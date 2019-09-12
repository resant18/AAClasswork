require_relative "pieces/piece"
require_relative "pieces/nullpiece"
require_relative "pieces/rook"

class Board

  attr_reader :rows, :sentinel

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @sentinel = NullPiece.instance

    (0..7).each do |row_idx|      # 0 -> 7
      (0..7).each do |col_idx|    # 0 -> 7
        if row_idx < 2 
          @rows[row_idx][col_idx] = Rook.new(:W, @rows, [row_idx, col_idx]) # Phase 2
        elsif row_idx > 5
          @rows[row_idx][col_idx] = Piece.new(:B, @rows, [row_idx, col_idx])
        else
          @rows[row_idx][col_idx] = @sentinel
        end        
      end
    end

    p @rows[1][0].moves
  end

  def [](pos)
    row, col = pos
    @rows[row][col] 
  end

  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val 
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos] == @sentinel
      raise "There is no piece at the start position."
    elsif !valid_pos?(end_pos)      # refactor when color is implemented
      raise "The piece cannot move to the end position."
    else
      self[start_pos], self[end_pos] = @sentinel, self[start_pos]     # refactor when singleton is implemented
    end
  end

  def valid_pos?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  p board.rows
  # board.move_piece([0,0],[7,7])
  # puts "-----------------------------------------------------------------------"
  # p board.rows
  # # p board.move_piece([2,0],[2,1])
  # puts "-----------------------------------------------------------------------"
  # p board.move_piece([1,0],[10,10])


end