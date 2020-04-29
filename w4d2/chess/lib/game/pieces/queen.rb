require_relative "piece"

class Queen < Piece
  def initialize(position)
    super
  end

  def possible_moves
    x_dir = [0, 1, 1, 1, 0, -1, -1, -1]
    y_dir = [-1, -1, 0, 1, 1, 1, 0, -1]
    directions = x_dir.zip(y_dir)
    directions.flat_map { |dir| trace_path(dir) }
  end

  def to_s
    "♚"
  end

  private

  def trace_path(direction)
    result = []
    current_position = position
    while Piece.valid_position?(current_position)
      current_position = current_position.zip(direction).map(&:sum)
      result << current_position if Piece.valid_position?(current_position)
    end
    result
  end


end

if $PROGRAM_NAME == __FILE__
  q = Queen.new([1, 1])
  p q.possible_moves
end