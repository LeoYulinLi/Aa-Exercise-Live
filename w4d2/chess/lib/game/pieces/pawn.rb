require_relative "piece"

class Pawn < Piece
  def initialize(position, color, board)
    super
    @starting_position = position
  end

  def potential_moves
    result = []
    x, y = position
    diagonal_moves = [[1, 1], [-1, 1]]
    vertical_moves = [[0, 1]]
    if @starting_position == position
      vertical_moves << [0, 2]
    end

    diagonal_moves.each do |pos|
      a, b = forward_move(pos)
      diagonal_pos = [a + x, b + y]
      result << diagonal_pos if board[diagonal_pos].color != self.color
    end
    vertical_moves.each do |pos|
      a, b = forward_move(pos)
      vertical_pos = [a + x, b + y]
      result << vertical_pos if board[vertical_pos].valid_position?(vertical_pos)
    end
  end

  def forward_move(direction)
    if self.color == black
      x, y = direction
      [-x, -y]
    else
      direction
    end
  end

  def to_s
    "♟"
  end

end

