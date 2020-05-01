require "card"

describe Card do
  describe "#initialize" do
    it "should accept two arguments" do
      expect { Card.new(5, :diamond) }.to_not raise_error
    end
  end

  describe "#=" do
    context "when the two cards have the same value and suit" do
      it "should return true" do
        expect(Card.new(5, :diamond) == Card.new(5, :diamond)).to be_truthy
      end
    end
  end
end