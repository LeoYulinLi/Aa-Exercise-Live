require_relative "pieces/null_piece"
require_relative "pieces/king"
require_relative 'pieces/knight'
require_relative 'pieces/queen'
require_relative 'pieces/piece'
require_relative 'pieces/bishop'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'

class Board

  # @return [Array<Array<Piece>>]
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.instance } }
    setup_grid
  end

  def setup_grid
    back_line(:white)
    back_line(:black)
    front_line(:white)
    front_line(:black)
  end

  # @param [:black, :white] color <description>
  def back_line(color)
    # @type [Array<Class<Piece>>]
    back_pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    if color == :white
      (0...8).each do |i|
        grid[0][i] = back_pieces[i].new([0, i], color, self)
      end
    else
      (0...8).each do |i|
        grid[7][i] = back_pieces[i].new([0, i], color, self)
      end
    end
  end

  # @param [:black, :white] color <description>
  #
  def front_line(color)
    front_pieces = Array.new(8) { Pawn }
    if color == :white
      (0...8).each do |i|
        grid[1][i] = front_pieces[i].new([0, i], color, self)
      end
    else
      (0...8).each do |i|
        grid[6][i] = front_pieces[i].new([0, i], color, self)
      end
    end
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

  def empty?(pos)
    self[pos].is_a?(NullPiece)
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
    grid.reverse.map { |row| row.map(&:to_s).join }.join("\n")
  end

  def in_check?(color)
    king_pos = nil
    # @grid.each_with_index { |row, y| row.each_with_index { |ele, x| [x, y] king_pos = [x, y] if ele.is_a?(King) && ele.color == color } }
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  board.move_piece([1, 0], [2, 1])
  p board
  # p board[[0, 1]]
end