class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? { |c| POSSIBLE_PEGS.has_key?(c.upcase) }
  end

  def self.random(length)
    Code.new(Array.new(length) { POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  attr_reader :pegs

  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map(&:upcase)
    else
      raise Exception(":P")
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  # a = [1, 2, 3]
  # b = [4, 5, 6]
  # a.zip(b) => [[1, 4], [2, 5], [3, 6]]
  def num_exact_matches(code)
    self.pegs.zip(code.pegs).count { |(a,b)| a == b }
  end

  def num_near_matches(code)
    code.pegs.count { |p| self.pegs.include?(p) } - num_exact_matches(code)
  end

  def ==(code)
    code.pegs.length == self.pegs.length && num_exact_matches(code) == self.pegs.length
  end
end
