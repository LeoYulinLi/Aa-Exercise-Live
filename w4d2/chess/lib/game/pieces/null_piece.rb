require "singleton"
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def to_s
    "⬜"
  end
end