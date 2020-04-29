require_relative "piece"

class King < Piece
  def initialize

  end

  def to_s
    "♛"
  end

  def possible_moves
    x, y = position
    moves = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, 1],
      [0, -1],
      [1, -1],
      [1, 0],
      [1, 1],
    ]
    potential_new_positions = []
    moves.each do |(a, b)|
      new_pos = [a + x, b + y]
      potential_new_positions << new_pos if Piece.valid_position?(new_pos)
    end
    potential_new_positions
  end

end