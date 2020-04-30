class Piece

  attr_reader :position, :color, :board

  #
  # @param [Array<Integer>] position <description>
  # @param [:white, :black] color <description>
  # @param [Board] board <description>
  #
  def initialize(position, color, board)
    @position = position
    @color = color
    @board = board
  end

  def valid_position?(pos)
    row, col = pos
    (0...8).include?(row) && (0...8).include?(col) && board[pos].color != self.color
  end


  
end