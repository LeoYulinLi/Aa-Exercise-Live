class Array
  
  def recursive_sum
    return 0 if self.empty?
    return self.first if self.length == 1

    self.first + self[1..-1].recursive_sum
  end

  def iterative_sum
    sum = 0
    self.each { |n| sum += n }
    sum
  end

end

p [1, 2, 3, 4].iterative_sum
p [1, 2, 3, 4].recursive_sum
