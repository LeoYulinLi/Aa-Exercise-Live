require_relative "piece"
require_relative "behaviors/slidable"

class Queen < Piece
  include Slidable

  def initialize(position, color, board)
    super
  end

  def directions
    x_dir = [0, 1, 1, 1, 0, -1, -1, -1]
    y_dir = [-1, -1, 0, 1, 1, 1, 0, -1]
    x_dir.zip(y_dir)
  end

  def to_s
    "♚ "
  end


end

if $PROGRAM_NAME == __FILE__
  q = Queen.new([1, 1])
  p q.possible_moves
end