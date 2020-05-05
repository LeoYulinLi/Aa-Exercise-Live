class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if empty?
    self.map { |num| num.hash }.inject { |accum, num| accum << 1 ^ num }
    # shift left logic
  end
end

class String
  def hash
    self.split("").map { |char| char.ord.hash }.inject(&:-)
    # [1, 2, 3, 4, 5].inject(&:+) => sum => 1 + 2 + 3 + 4 + 5
    # [1, 2, 3, 4, 5].inject(&:-) => 1 - 2 - 3 - 4 - 5
  end
end

# 1 + 2 => 3, 2 + 1 => 3
# 1 - 2 => -1, 2 - 1 => 1


class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    map{|k,v| [k,v].hash }.sum
  end
end
