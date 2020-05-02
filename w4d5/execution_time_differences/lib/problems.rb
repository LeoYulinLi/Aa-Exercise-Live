def my_min1(array) #O(n^2)
  array.find { |ele| array.none? { |ele2| ele2 < ele } }
end

#  array = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#  p my_min1(array)

def my_min2(array) #O(n)
  min = array.first
  array.each do |num|
    min = num if num < min
  end
  min
end

# p my_min2(array)

def largest_contiguous_subsum1(list) #O(n^2)
  result = []

  (0...list.length).each do |i|
    (i...list.length).each do |j|
      result << list[i..j]
    end
  end

  max = result.first
  result.each do |ele|
    max = ele if ele.sum > max.sum
  end
  max.sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum1(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum1(list)

def largest_contiguous_subsum2(list)

  current_sum = 0
  sum_so_far = list.first

  list.each do |num|
    if num > sum_so_far
      current_sum = num
    else
      current_sum += num
    end
    sum_so_far = current_sum if current_sum > sum_so_far
  end

  sum_so_far

  # right_current_sum = 0
  # right_sum_so_far = 0

  # (0...list.length).reverse_each do |idx|
  #     right_current_sum += list[idx] # -3
  #     if right_current_sum > right_sum_so_far
  #         right_sum_so_far = right_current_sum
  #         left_idx = idx
  #     end
  # end

  # list[left_idx..right_idx].sum
end