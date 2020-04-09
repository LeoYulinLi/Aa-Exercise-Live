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
  describe "matrix_addition_reloaded" do

    matrix_a = [[2, 5], [4, 7]]
    matrix_b = [[9, 1], [3, 0]]
    matrix_c = [[-1, 0], [0, -1]]
    matrix_d = [[2, -5], [7, 10], [0, 1]]
    matrix_e = [[0, 0], [12, 4], [6, 3]]

    it "accepts any number of matrices as arguments" do
      expect { matrix_addition_reloaded(matrix_a, matrix_b) }.to_not raise_error
    end
    it "should return a new matrix representing the sum of the arguments" do
      expect(matrix_addition_reloaded(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)).to eq([[10, 6], [7, 6]])
      expect(matrix_addition_reloaded(matrix_e)).to eq([[0, 0], [12, 4], [6, 3]])
      expect(matrix_addition_reloaded(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
    end
    it "should reject matrices that do not have the same dimensions" do
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)).to eq(nil)
      expect(matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)).to eq(nil)
    end
  end

  describe "squarocol?" do
    it "accepts 2-dimensional array as an argument" do
      expect do
        squarocol?([
                       [:a, :x, :d],
                       [:b, :x, :e],
                       [:c, :x, :f],
                   ])
      end.to_not raise_error
    end
    it "should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals" do
      expect(squarocol?([
                            [:a, :x, :d],
                            [:b, :x, :e],
                            [:c, :x, :f],
                        ])).to eq(true)

      expect(squarocol?([
                            [:x, :y, :x],
                            [:x, :z, :x],
                            [:o, :o, :o],
                        ])).to eq(true)

      expect(squarocol?([
                            [:o, :x, :o],
                            [:x, :o, :x],
                            [:o, :x, :o],
                        ])).to eq(false)

      expect(squarocol?([
                            [1, 2, 2, 7],
                            [1, 6, 6, 7],
                            [0, 5, 2, 7],
                            [4, 2, 9, 7],
                        ])).to eq(true)

      expect(squarocol?([
                            [1, 2, 2, 7],
                            [1, 6, 6, 0],
                            [0, 5, 2, 7],
                            [4, 2, 9, 7],
                        ])).to eq(false)
    end
  end

  describe "squaragonal?" do
    matrix_a = [[:x, :y, :o],
                [:x, :x, :x],
                [:o, :o, :x]]
    matrix_b = [[:x, :y, :o],
                [:x, :o, :x],
                [:o, :o, :x]]
    matrix_c = [[1, 2, 2, 7],
                [1, 1, 6, 7],
                [0, 5, 1, 7],
                [4, 2, 9, 1]]
    matrix_d = [[1, 2, 2, 5],
                [1, 6, 5, 0],
                [0, 2, 2, 7],
                [5, 2, 9, 7]]

    it "accepts 2-dimensional array as an argument" do
      expect { squarocol?(matrix_a) }.to_not raise_error
    end

    it "should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals" do
      expect(squaragonal?(matrix_a)).to be(true)
      expect(squaragonal?(matrix_b)).to be(true)
      expect(squaragonal?(matrix_c)).to be(true)
      expect(squaragonal?(matrix_d)).to be(false)
    end
  end

  describe "pascals_triangle" do
    it "accepts a positive number" do
      expect { pascals_triangle(5) }.to_not raise_error
    end
    it "returns a 2-dimensional array representing the first n levels of pascal's triangle" do
      expect(pascals_triangle(5)).to eq([[1],
                                         [1, 1],
                                         [1, 2, 1],
                                         [1, 3, 3, 1],
                                         [1, 4, 6, 4, 1]])

      expect(pascals_triangle(7)).to eq([[1],
                                         [1, 1],
                                         [1, 2, 1],
                                         [1, 3, 3, 1],
                                         [1, 4, 6, 4, 1],
                                         [1, 5, 10, 10, 5, 1],
                                         [1, 6, 15, 20, 15, 6, 1]])
    end
  end
end

describe "Phase 4: Nauseating." do
  describe "mersenne_prime" do
    it "accepts a number argument" do
      expect { mersenne_prime(1) }.to_not raise_error
    end
    it "should n-th Mersenne prime" do
      expect(mersenne_prime(1)).to be(3)
      expect(mersenne_prime(2)).to be(7)
      expect(mersenne_prime(3)).to be(31)
      expect(mersenne_prime(4)).to be(127)
      expect(mersenne_prime(6)).to be(131071)
    end
  end

  describe "triangular word" do
    it "accepts a word as an argument" do
      expect { triangular_word?('abc') }.to_not raise_error
    end
    it "returns a boolean indicating whether or not that word's number encoding is a triangular number" do
      expect(triangular_word?('abc')).to eq(true)
      expect(triangular_word?('ba')).to eq(true)
      expect(triangular_word?('lovely')).to eq(true)
      expect(triangular_word?('question')).to eq(true)
      expect(triangular_word?('aa')).to eq(false)
      expect(triangular_word?('cd')).to eq(false)
      expect(triangular_word?('cat')).to eq(false)
      expect(triangular_word?('sink')).to eq(false)
    end
  end

  describe "consecutive_collapse" do
    it "should accepts an array as argument" do
      expect { consecutive_collapse([3, 4, 1]) }.to_not raise_error
    end

    it "should return a new array that results from continuously removing consecutive numbers that are adjacent in the array" do
      expect(consecutive_collapse([3, 4, 1])).to eq([1])
      expect(consecutive_collapse([1, 4, 3, 7])).to eq([1, 7])
      expect(consecutive_collapse([9, 8, 2])).to eq([2])
      expect(consecutive_collapse([9, 8, 4, 5, 6])).to eq([6])
      expect(consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])).to eq([1, 9, 2])
      expect(consecutive_collapse([3, 5, 6, 2, 1])).to eq([1])
      expect(consecutive_collapse([5, 7, 9, 9])).to eq([5, 7, 9, 9])
      expect(consecutive_collapse([13, 11, 12, 12])).to eq([])
    end
  end

  describe "pretentious_primes" do
    it "should take an array and a number as arguments" do
      expect { pretentious_primes([4, 15, 7], 1) }.to_not raise_error
    end

    it "should work" do
      expect(pretentious_primes([4, 15, 7], 1)).to eq([5, 17, 11])
      expect(pretentious_primes([4, 15, 7], 2)).to eq([7, 19, 13])
      expect(pretentious_primes([12, 11, 14, 15, 7], 1)).to eq([13, 13, 17, 17, 11])
      expect(pretentious_primes([12, 11, 14, 15, 7], 3)).to eq([19, 19, 23, 23, 17])
      expect(pretentious_primes([4, 15, 7], -1)).to eq([3, 13, 5])
      expect(pretentious_primes([4, 15, 7], -2)).to eq([2, 11, 3])
      expect(pretentious_primes([2, 11, 21], -1)).to eq([nil, 7, 19])
      expect(pretentious_primes([32, 5, 11], -3)).to eq([23, nil, 3])
      expect(pretentious_primes([32, 5, 11], -4)).to eq([19, nil, 2])
      expect(pretentious_primes([32, 5, 11], -5)).to eq([17, nil, nil])
    end

  end

end
