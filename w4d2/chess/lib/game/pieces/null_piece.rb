require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def initialize
    super(nil, nil, board)
  end

  def to_s
    "  "
  end
end