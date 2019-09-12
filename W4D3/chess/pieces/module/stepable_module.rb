module Stepable

  def moves
    available_moves = []
    row, col = self.pos
    move_diffs.each do |delta|
      dx, dy = delta
      next_row += dx
      next_col += dy
      pos = [next_row, next_col]
      available_moves << pos if check_pos(pos)
    end

    if move_dirs.each do |delte
      HORIZONTAL_DIRS.each do |delta|
        dx, dy = delta  #[0, 1]
        horizontal_moves = grow_unblocked_moves_in_dir(dx, dy) # [0,2]
        available_moves.concat(horizontal_moves)
      end
    end
  end

  #overwritten by subclass
  def move_diffs
    ""
  end

end