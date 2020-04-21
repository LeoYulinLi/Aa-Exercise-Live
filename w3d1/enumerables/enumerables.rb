class Array

  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_select(&block)
    result = []
    self.my_each { |ele| result << ele if block.call(ele) }
    result
  end

  def my_reject(&block)
    result = []
    self.my_each { |ele| result << ele unless block.call(ele) }
    result
  end

  def my_any?(&block)
    self.my_each { |ele| return true if block.call(ele) }
    false
  end


  def my_all?(&block)
    self.my_each { |ele| return false unless block.call(ele) }
    true
  end


  def my_flatten

    result = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        result += ele.my_flatten
      else
        result << ele
      end
    end
    result
  end

  def my_zip(*arrays)
    num_arrays = arrays.length
    result = []
    (0...self.length).to_a.my_each do |ii|
      new_array = []
      new_array << self[ii]
      (0...num_arrays).to_a.my_each do |i|
        new_array << arrays[i][ii]
      end
      result << new_array
    end
    result
  end

  def my_rotate(num = 1)
    amount = num % self.length
    self[amount..-1] + self[0...amount]
  end

  def my_join(separator = "")
    new_string = ""
    (0...self.length).to_a.my_each do |i|
      return new_string += self[i] if i == self.length - 1
      new_string +=  self[i] + separator
    end
    new_string
  end

  def my_reverse
    result = []
    i = self.length - 1
    while i >= 0 do
      result << self[i]
      i -= 1
    end
    result
  end

end