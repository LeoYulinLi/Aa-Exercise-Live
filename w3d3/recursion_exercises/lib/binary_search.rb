def bsearch(array, target)
  # array.sort!
  return nil if array.length == 0

  mid = array.length / 2

  if array[mid] == target
    return mid
  elsif array[mid] > target
    return bsearch(array[0...mid], target)
  else
    result = bsearch(array[(mid + 1)..-1], target)
    if result.nil?
      return nil
    else
      return mid + 1 + result
    end
  end
end

p recursive_bsearch([1, 2, 3], 1) # => 0 ~
p recursive_bsearch([2, 3, 4, 5], 3) # => 1 ~
p recursive_bsearch([2, 4, 6, 8, 10], 6) # => 2 ~
p recursive_bsearch([1, 3, 4, 5, 9], 5) # => 3 ?
p recursive_bsearch([1, 2, 3, 4, 5, 6], 6) # => 5 ?
p recursive_bsearch([1, 2, 3, 4, 5, 6], 0) # => nil ~
p recursive_bsearch([1, 2, 3, 4, 5, 7], 6) # => nil ~