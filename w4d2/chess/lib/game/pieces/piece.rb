class Piece

  attr_reader :position

  def initialize(position)
    @position = position
  end

  def self.valid_position?(pos)
    row, col = pos
    (0...8).include?(row) && (0...8).include?(col)
  end

end