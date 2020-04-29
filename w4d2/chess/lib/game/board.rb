require_relative "pieces/null_piece"
require_relative "pieces/king"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  #
  # Get a piece at a position
  #
  # @param [Array<Integer>] pos position
  #
  # @return [Piece]
  #
  def [](pos)
    raise ArgumentError.new("invalid position") unless valid_position?(pos)

    row, col = pos
    grid[row][col]
  end

  # @param [Array<Integer>] pos <description>
  # @param [Piece] piece <description>
  def []=(pos, piece)
    raise ArgumentError.new("invalid position") unless valid_position?(pos)
    
    row, col = pos
    grid[row][col] = piece
  end

  def valid_position?(pos)
    row, col = pos
    (0...8).include?(row) && (0...8).include?(col)
  end
  #
  # Move a piece from a starting position to a end location
  #
  # @param [Array<Integer>] start_pos
  # @param [Array<Integer>] end_pos
  #
  def move_piece(start_pos, end_pos)
    raise ArgumentError.new("invalid start position") if self[start_pos].is_a?(NullPiece)
    raise ArgumentError.new("invalid end position") unless self[end_pos].is_a?(NullPiece)
    
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  
  end

  def inspect
    grid.map { |row| row.map(&:to_s).join }.join("\n")
  end
end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  board[[0, 0]] = King.new
  board[[1, 1]] = King.new
  # board.move_piece([0, 0], [1, 1])
  p board
end