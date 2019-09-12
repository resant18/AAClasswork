module Slideable
  
  attr_reader :horizontal_dirs, :diagonal_dirs

  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

  #this is gonna called by a piece => returning all available move
  def moves 
    available_moves = []

    if move_dirs.include?(:horizontal)
      HORIZONTAL_DIRS.each do |delta|
        dx, dy = delta  #[0, 1]
        horizontal_moves = grow_unblocked_moves_in_dir(dx, dy) # [0,2]
        available_moves.concat(horizontal_moves)
      end
    end

    if move_dirs.include?(:diagonal)
      DIAGONAL_DIRS.each do |delta|
        dx, dy = delta
        diagonal_moves = grow_unblocked_moves_in_dir(dx, dy)
        available_moves.concat(diagonal_moves)
      end
    end

    available_moves
  end


  private
  #hint: this is gonna be overwritten by subclass
  def move_dirs # define which direction a piece move
    # move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []

    row, col = self.pos
    next_row, next_col = row + dx, col + dy
    next_pos = [next_row, next_col]

    while next_row.between(0, 7) && next_col.between(0, 7) && enemy_team?(next_pos)
      moves << next_pos

      break unless self[next_pos].instance_of?(NullPiece)

      next_row += dx
      next_col += dy
      next_pos = [next_row, next_col]
    end

    moves
  end

  def enemy_team?(pos)
    self.color != board[pos].color
  end

end