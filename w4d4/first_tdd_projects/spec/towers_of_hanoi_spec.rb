require 'towers_of_hanoi'

describe TowersOfHanoi do

  subject(:piles) { TowersOfHanoi.new(4) }

  describe "#initialize" do
    it "should accept one number as an argument" do
      expect { TowersOfHanoi.new(4) }.to_not raise_error
    end
  end

  describe "#print_towers" do
    it "should print 3 towers" do
      expect(piles.print_towers).to eq("pile1: 1 2 3 4 pile2:  pile3:")
    end
  end

  describe "#move" do
    it "should take 2 integers as an argument" do
      expect { piles.move(0, 1) }.to_not raise_error
    end

    it "should check if the given position is valid" do
      expect { piles.move(3, 4) }.to raise_error
    end

    it "should not allow a bigger disk to be put onto a smaller disk" do
      piles.move(0, 1)
      expect { piles.move(0, 1) }.to raise_error
    end
  end

  describe "#won?" do
    context "when all disks have been moved to a different tower" do
      it "should return true" do
        winning_tower = TowersOfHanoi.new(1)
        winning_tower.move(0, 1)

        expect(winning_tower.won?).to be_truthy 
      end
    end

    context "when none of the towers have all the disk" do
      it "should return false" do
        expect(piles.won?).to be_falsey
      end
    end
  end
end