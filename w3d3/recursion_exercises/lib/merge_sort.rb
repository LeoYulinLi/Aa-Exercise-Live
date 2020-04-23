class Array

  def merge_sort
    return self if length <= 1
    left = self[0...length / 2].merge_sort
    right = self[length / 2..-1].merge_sort
    left.merge(right)
  end

  def merge(other)
    result = []
    left = self.dup
    right = other.dup
    until left.empty? || right.empty?
      if left.first < right.first
        result << left.shift
      else
        result << right.shift
      end
    end
    result += left
    result += right
  end

end

p [1, 2, 5, 2, 3, 4, 9, 10, 50, -1, -234, 7].merge_sort
