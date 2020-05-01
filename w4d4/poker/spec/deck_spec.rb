require "deck"

describe Deck do
  describe "#initialize" do
    it "should create 52 unique cards" do
      deck = Deck.new
      expect(deck.cards.uniq.length).to eq(52)
    end
  end

  describe "#shuffle!" do
    it "should shuffle the all the cards" do
      deck1 = Deck.new
      deck2 = Deck.new
      deck1.shuffle!
      expect(deck1.cards).to_not eq(deck2.cards)
    end
  end
end