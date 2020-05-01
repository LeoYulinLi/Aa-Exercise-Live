class Hand
  def initialize(cards)
    @cards = cards
  end

  def one_pair?
    hash = Hash.new(0)
    @cards.each do |card|
      hash[card.value] += 1
    end
    hash.values.one? { |count| count == 2 }
  end

  def three_of_a_kind?
    hash = Hash.new(0)
    @cards.each do |card|
      hash[card.value] += 1
    end
    hash.values.one? { |count| count == 3 }
  end
end
