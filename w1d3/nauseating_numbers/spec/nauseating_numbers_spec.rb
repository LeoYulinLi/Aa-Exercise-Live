require "nauseating_numbers"

describe "Phase 1: No big deal." do
  describe "strange_sums" do
    it "should accept an array as args" do
      expect(strange_sums([11, 5, 13, 2, 3])).to_not raise_error
    end
    it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
      expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)
      expect(strange_sums([42, 3, -1, -42])).to eq(1)
      expect(strange_sums([-5, 5])).to eq(1)
      expect(strange_sums([19, 6, -3, -20])).to eq(0)
      expect(strange_sums([9])).to eq(0)
    end
  end

  describe "pair_product" do
    it "should accept an array of numbers and a product as args" do
      expect(pair_product([4, 2, 5, 8], 16)).to_not raise_error
    end
    it "should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together" do
      expect(pair_product([4, 2, 5, 8], 16)).to eq(true)
      expect(pair_product([8, 1, 9, 3], 8)).to eq(true)
      expect(pair_product([3, 4], 12)).to eq(true)
      expect(pair_product([3, 4, 6, 2, 5], 12)).to eq(true)
      expect(pair_product([4, 2, 5, 7], 16)).to eq(false)
      expect(pair_product([8, 4, 9, 3], 8)).to eq(false)
      expect(pair_product([3], 12)).to eq(false)
    end
  end

  describe "rampant_repeats" do
    it "should accept a string and a hash as args" do
      expect { rampant_repeats('taco', {'a' => 3, 'c' => 2}).to_not raise_error }
    end
    it "should return a new string where characters of the original string are repeated the number of times specified by the hash" do
      expect(rampant_repeats('taco', {'a' => 3, 'c' => 2})).to eq('taaacco')
      expect(rampant_repeats('feverish', {'e' => 2, 'f' => 4, 's' => 3})).to eq('ffffeeveerisssh')
      expect(rampant_repeats('misispi', {'s' => 2, 'p' => 2})).to eq('mississppi')
      expect(rampant_repeats('faarm', {'e' => 3, 'a' => 2})).to eq('faaaarm')
    end
  end

  describe "perfect_square?" do
    it "should accept a number as args" do
      expect { perfect_square?(4) }.to_not raise_error
    end
    it "should return a boolean indicating whether or not the argument is a perfect square" do
      expect(perfect_square(1)).to eq(true)
      expect(perfect_square(4)).to eq(true)
      expect(perfect_square(64)).to eq(true)
      expect(perfect_square(100)).to eq(true)
      expect(perfect_square(169)).to eq(true)
      expect(perfect_square(2)).to eq(false)
      expect(perfect_square(40)).to eq(false)
      expect(perfect_square(32)).to eq(false)
      expect(perfect_square(50)).to eq(false)
    end
  end
end

describe "Phase 2: Nothing you can't handle." do
  describe "anti_prime?" do

    it "should accept a number as args" do
      expect { anti_prime?(24) }.to_not raise_error
    end

    it "should return true when the given number has more divisors than all positive numbers less than the given number" do
      expect(anti_prime?(24)).to eq(true)
      expect(anti_prime?(36)).to eq(true)
      expect(anti_prime?(48)).to eq(true)
      expect(anti_prime?(360)).to eq(true)
      expect(anti_prime?(1260)).to eq(true)
    end

    it "should return false when the given number doesn't have more divisors than previous numbers" do
      expect(anti_prime?(27)).to eq(false)
      expect(anti_prime?(5)).to eq(false)
      expect(anti_prime?(100)).to eq(false)
      expect(anti_prime?(136)).to eq(false)
      expect(anti_prime?(1024)).to eq(false)
    end

  end

  describe "matrix_addition" do
    it "should accept two matrices as args" do
      matrix_a = [[2, 5], [4, 7]]
      matrix_b = [[9, 1], [3, 0]]
      expect { matrix_addition(matrix_a, matrix_b) }.to_not raise_error
    end

    it "should return a new matrix representing the sum of the two arguments" do
      matrix_a = [[2, 5], [4, 7]]
      matrix_b = [[9, 1], [3, 0]]
      matrix_c = [[-1, 0], [0, -1]]
      matrix_d = [[2, -5], [7, 10], [0, 1]]
      matrix_e = [[0, 0], [12, 4], [6, 3]]

      expect(matrix_addition(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
      expect(matrix_addition(matrix_a, matrix_c)).to eq([[1, 5], [4, 6]])
      expect(matrix_addition(matrix_b, matrix_c)).to eq([[8, 1], [3, -1]])
      expect(matrix_addition(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
    end
  end

  describe "mutual_factors" do
    it "should accept any numbers of numer as args" do
      expect { mutual_factors(50, 30) }.to_not raise_error
    end
    it "return an array containing all of the common divisors shared among the arguments" do
      expect(mutual_factors(50, 30)).to eq([1, 2, 5, 10])
      expect(mutual_factors(50, 30, 45, 105)).to eq([1, 5])
      expect(mutual_factors(8, 4)).to eq([1, 2, 4])
      expect(mutual_factors(8, 4, 10)).to eq([1, 2])
      expect(mutual_factors(12, 24)).to eq([1, 2, 3, 4, 6, 12])
      expect(mutual_factors(12, 24, 64)).to eq([1, 2, 4])
      expect(mutual_factors(22, 44)).to eq([1, 2, 11, 22])
      expect(mutual_factors(22, 44, 11)).to eq([1, 11])
      expect(mutual_factors(7)).to eq([1, 7])
      expect(mutual_factors(7, 9)).to eq([1])
    end
  end
  describe "tribonacci_number" do
    it "accepts a number argument" do
      expect { tribonacci_number(1) }.to_not raise_error
    end
    it "returns the n-th number of the tribonacci sequence" do
      expect(tribonacci_number(1)).to eq(1)
      expect(tribonacci_number(2)).to eq(1)
      expect(tribonacci_number(3)).to eq(2)
      expect(tribonacci_number(4)).to eq(4)
      expect(tribonacci_number(5)).to eq(7)
      expect(tribonacci_number(6)).to eq(13)
      expect(tribonacci_number(7)).to eq(24)
      expect(tribonacci_number(11)).to eq(274)
    end
  end
end

describe "Phase 3: Now we're having fun." do
  
end