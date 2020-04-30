require_relative "piece"
require_relative "behaviors/slidable"

class Rook < Piece

  include Slidable

  def directions
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end
  
  def initialize(position, color, board)
    super
  end

  def to_s
    "♜ "
  end

end

if $PROGRAM_NAME == __FILE__
  q = Rook.new([1, 1], :black, nil)
  p q.possible_moves
end