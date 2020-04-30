require_relative "piece"
require_relative "behaviors/slidable"

class Bishop < Piece

  include Slidable

  def initialize(position, color, board)
    super
  end

  def directions
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s
    "♝"
  end

end

if $PROGRAM_NAME == __FILE__
  q = Bishop.new([1, 1])
  p q.possible_moves
end