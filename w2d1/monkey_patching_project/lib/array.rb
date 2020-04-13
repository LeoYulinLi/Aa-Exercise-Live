# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    empty? ? nil : max - min
  end

  def average
    empty? ? nil : sum * 1.0 / length
  end

  def median
    return nil if empty?
    sorted = self.sort
    sorted.length.odd? ? sorted[length / 2] : (sorted[length / 2 - 1] + sorted[length / 2]) / 2.0
  end

  def counts
    counters = Hash.new(0)
    each { |ele| counters[ele] += 1 }
    counters
  end

  def my_count(target)
    counts[target]
  end

  def my_index(target)
    index = 0

    while self[index] != target && index <= length
      index += 1
    end

    return nil if index > length

    index
  end

  def my_uniq
    counts.each_key.map { |key| key }
  end

  def my_transpose
    (0...self[0].length).map do |n|
      self.map { |arr| arr[n] }
    end
  end
end
