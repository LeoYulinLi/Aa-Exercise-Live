class Card

  CARDS = {
    diamond: "♦",
    heart: "♥",
    spade: "♠",
    club: "♣"
  }

  CARD_NUMBERS = {
    11 => "K",
    12 => "Q",
    13 => "J"
  }

  attr_reader :value, :suit

  # @param [Number] value
  # @param [[:diamond, :heart, :spade, :club]] suit
  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def self.suits
    return CARDS.keys

  end

  # @param [Card] other
  def ==(other)
    self.value == other.value && self.suit == other.suit
  end


  def to_s
    CARD_NUMBERS.fetch(value, value) + CARDS[suit]
  end
end