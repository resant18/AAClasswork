require "singleton"
require_relative "piece"


class NullPiece < Piece

  include Singleton
  
  def initialize    # need initialize for singleton subclass
    @color = ""
    @board = ""
    @pos = []
  end

  def moves
    ""
  end

  def symbol
    :N
  end
  
end
