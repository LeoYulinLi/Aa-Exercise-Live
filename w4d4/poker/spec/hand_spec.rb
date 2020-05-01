require "hand"

describe Hand do
  let(:cards) { [
    Card.new(5, :diamond),
    Card.new(3, :heart),
    Card.new(5, :diamond),
    Card.new(10, :spade),
    Card.new(13, :club)
  ]
  }
  describe "#initialize" do
    it "should accept an array of 5 card as an argument" do
      expect { Hand.new(cards) }.to_not raise_error
    end
  end

  describe "#one_pair?" do
    context "when they are two cards have the same value" do
      it "should return true" do
        expect(Hand.new(cards).one_pair?).to be(true)
      end
    end
  end
end 