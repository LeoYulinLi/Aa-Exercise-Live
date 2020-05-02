def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

arr = [1, 5, 7, 0, 5]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum) #bsearch = log n => n * log n
  sorted_arr = arr.sort #.sort => n * log n
  sorted_arr.each_index do |i|
    j = sorted_arr.bsearch_index { |n| n + sorted_arr[i] == target_sum }
    return true if !j.nil? && j != i
  end
  false
end

# p okay_two_sum?(arr, 6)
# p okay_two_sum?(arr, 10)


def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each_with_index do |num, idx|
    hash[num] = idx
  end
  arr.each_with_index do |num, idx|
    return true if hash.has_key?(target_sum - num) && idx != hash[target_sum - num]
  end
  false
end

# p two_sum?(arr, 6)
# p two_sum?(arr, 10)