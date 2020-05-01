require "card"

class Deck

  # @return [Array<Card>]
  attr_reader :cards

  def initialize
    @cards = (1..13).flat_map do |value|
      Card.suits.map { |suit| Card.new(value, suit) }
    end
  end

  def shuffle!
    @cards.shuffle!
  end


end