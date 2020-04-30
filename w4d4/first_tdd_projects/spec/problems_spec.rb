require "problems"

describe "problems" do

  describe "my_uniq" do
    it "should accept an array as an argument" do
      expect { my_uniq([1, 2, 3, 4]) }.to_not raise_error
    end

    it "should return an array with duplicate elements removed" do
      expect(my_uniq([1, 1, 1, 1])).to eq([1])
    end

    it "should not modify the original order" do
      expect(my_uniq([2, 2, 1, 1])).to eq([2, 1])
    end
  end

  describe "two_sum" do
    it "should return pairs add to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "transpose" do
    it "should transpose the matrix" do
      matrix = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      expected = [[0, 3, 6],
                  [1, 4, 7],
                  [2, 5, 8]]
      expect(transpose(matrix)).to eq(expected)
    end
  end

  describe "stock_picker" do
    it "should accept an array as an argument" do
      expect { stock_picker([1, 2, 3, 4]) }.to_not raise_error
    end
    it "should return the starting day and ending day that maximes my profit" do
      expect(stock_picker([1, 2, 3, 4])).to eq([0, 3])
    end
    it "should return nil if none of the days is profitable" do
      expect(stock_picker([4, 3, 2, 1])).to eq(nil)
    end
  end

  

end