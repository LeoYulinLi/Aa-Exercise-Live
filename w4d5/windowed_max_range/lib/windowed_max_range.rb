# list = [5, 3, -7]
# p largest_contiguous_subsum2(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list)

def windowed_max_range(arr, window_size)
  arr.each_cons(window_size).max_by { |sub_array| sub_array.max - sub_array.min }
  # O(n)      +        O(n *                 ( O(n)      +    O(n))  )
end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
p windowed_max_range([1, 0, 2, 5, 4, 8], 3)
p windowed_max_range([1, 0, 2, 5, 4, 8], 4)
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)