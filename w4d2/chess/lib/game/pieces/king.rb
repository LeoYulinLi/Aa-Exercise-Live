require_relative "piece"

class King < Piece
  def initialize(position, color, board)
    super
  end

  def to_s
    "♛ "
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
      potential_new_positions << new_pos if valid_position?(new_pos)
    end
    potential_new_positions
  end

end

if $PROGRAM_NAME == __FILE__
  q = King.new([1, 1])
  p q.possible_moves
end