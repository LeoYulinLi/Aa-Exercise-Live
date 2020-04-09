require "perilous_procs"

describe "Perilous Procs" do
  describe "Phase 1: Problems that are pleasant." do
    describe "some?" do
      it "should take an array and a block as argument" do
        expect { some?([3, 1, 11, 5]) { |n| n.even? } }.to_not raise_error
      end

      it "should return true when at least one of the elements of the array returns true when given to the block" do
        expect(some?([3, 4, 11, 5]) { |n| n.even? }).to eq(true)
        expect(some?([8, 2]) { |n| n.even? }).to eq(true)
        expect(some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(true)
        expect(some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }).to eq(true)
      end

      it "should return false when none of the elements of the array returns true when given to the block" do
        expect(some?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)
        expect(some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false)
      end
    end

    describe "exactly?" do
      it "should accept an array and a block as args" do
        expect { exactly?([5, 10, 7, 3]) { |n| n.even? } }.to_not raise_error
      end

      context "when exactly one element of the array results in true when passed into the block" do
        it "should return true" do
          expect(exactly?([5, 10, 7, 3]) { |n| n.even? } ).to eq(true)
          expect(exactly?(["a", "b", "c", "x"]) { |char| char == "x" } ).to eq(true)
        end
      end

      context "when there is not exactly one element that results in true when passed into the block" do
        it "should return false" do
          expect(exactly?([8, 10, 7, 3]) { |n| n.even? } ).to eq(false)
          expect(exactly?(["a", "x", "c", "x"]) { |char| char == "x" } ).to eq(false)
          expect(exactly?(["a", "b", "c", "d"]) { |char| char == "x" } ).to eq(false)
        end
      end

      it "should not use the built-in Array#one?" do
        array = [5, 10, 7, 3]
        expect(array).to_not receive(:one?)
        my_one?(array) { |n| n.even? }
      end
    end

  end
end