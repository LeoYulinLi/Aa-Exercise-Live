require_relative "piece"

class Knight < Piece
  def initialize(position, color, board)
    super
  end

  def possible_moves
    x, y = position
    potential_positions = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x - 1, y + 2],
      [x - 2, y + 1],
      [x + 1, y - 2],
      [x + 2, y - 1],
      [x - 1, y - 2],
      [x - 2, y - 1]
    ]
    potential_positions.select{ |pos| valid_position?(pos) }
  end

  def to_s
    "♞ "
  end

end